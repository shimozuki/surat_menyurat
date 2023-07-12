import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surat_meyurat/model/user_model.dart';
import 'package:surat_meyurat/network/cek_user_service.dart';
import 'package:surat_meyurat/network/user_provider.dart';
import 'package:surat_meyurat/page/home_page.dart';
import 'package:surat_meyurat/page/kepaladesa.dart';
import 'package:surat_meyurat/page/onboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Memeriksa status login pada SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  final userData = prefs.getString('userData');

  UserProvider userProvider = UserProvider();
  if (isLoggedIn) {
    await userProvider.restoreUser();
    String storedToken = await getToken(userProvider.user!.idUser);
    if (storedToken == userProvider.user!.nik) {
      // Token sesuai, lsadsadangsung ke halaman home
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => userProvider,
            ),
          ],
          child: MyApp(
            isLoggedIn: true,
            userData: userData,
          ),
        ),
      );
    } else {
      // Token tidak sesuai, kembali ke halaman onboard
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => userProvider,
            ),
          ],
          child: MyApp(
            isLoggedIn: false,
            userData: null,
          ),
        ),
      );
    }
  } else {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => userProvider,
          ),
        ],
        child: MyApp(
          isLoggedIn: false,
          userData: null,
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  final bool isLoggedIn;
  final userData;

  const MyApp({Key? key, required this.isLoggedIn, required this.userData})
      : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    userProvider = Provider.of<UserProvider>(context, listen: false);

    userProvider.checkLoggedInStatus().then((isLoggedIn) {
      if (isLoggedIn) {
        userProvider.restoreUser();
      }
    });

    SharedPreferences.getInstance().then((prefs) {
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      String userData = prefs.getString('userData') ?? '';

      if (isLoggedIn && userData.isNotEmpty) {
        User user = User.fromJson(jsonDecode(userData));
        print('Data pengguna yang tersimpan: ${user.idUser}');
      } else {
        print('Data pengguna tidak ditemukan dalam SharedPreferences.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: widget.isLoggedIn || widget.userData != null
          ? (userProvider.user?.level == 'masyarakat'
              ? '/home'
              : '/kepala_desa')
          : '/',
      routes: {
        '/': (context) => const Onboard(),
        '/home': (context) => const Home(),
        '/kepala_desa': (context) => const Kepaladesa(),
      },
    );
  }
}
