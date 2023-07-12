// ignore_for_file: unused_field

// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surat_meyurat/model/user_model.dart';
import 'package:surat_meyurat/network/login_service.dart';
import 'package:surat_meyurat/network/user_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  bool _isLoggedIn = false;

  bool passenable = true;

  late UserProvider _userProvider;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Tulis kode di sini untuk mengubah perilaku tombol "Back"
        return false; // Mengembalikan false akan mencegah navigasi kembali
      },
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1.0,
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(1, 50, 0, 27),
                    width: 227,
                    height: 157,
                    child: Image.asset(
                      'assets/bg2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0, 0, 0, MediaQuery.of(context).size.height * 0.25),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0x11000000),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Container(
                                  width: 134,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 2.5, 399, 0),
                                          width: 24,
                                          height: 24,
                                          child: const Icon(
                                            Icons.mail_outline,
                                            color: Color.fromARGB(78, 0, 0, 0),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            34, 0, 0, 0),
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 5),
                                        child: TextFormField(
                                          controller: _emailController,
                                          decoration:
                                              const InputDecoration.collapsed(
                                            hintText: "Username",
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                          // onSaved: (value) {
                                          //   _emailController.text = value!;
                                          // },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0x11000000),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            width: 134,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 10.5, 399, 0),
                                    width: 24,
                                    height: 24,
                                    child: const Icon(
                                      Icons.lock_outlined,
                                      color: Color.fromARGB(78, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 34, right: 7),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: passenable,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            passenable = !passenable;
                                          });
                                        },
                                        icon: Icon(passenable
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    // onSaved: (value) {
                                    //   _passwordController.text = value!;
                                    // },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          // forgotpasswordvRh (2:25)
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 17.5),
                            width: double.infinity,
                            child: Text(
                              'Forgot password?',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.1725,
                                color: const Color(0x7f000000),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print('klik');
                            if (_formKey.currentState!.validate()) {
                              _isLoading ? null : _login();
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 46,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 62, 90, 243),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3fffb0b7),
                                  offset: Offset(0, 15),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Center(
                                child: Text(
                                  'Sign in',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1725,
                                    color: const Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(1, 0, 0, 0),
                        child: TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const Register()),
                            // );
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.1725,
                                color: const Color(0xff494c52),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Don’t have an account?',
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1725,
                                    color: const Color(0xff494c52),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Register',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 1.1725,
                                    color:
                                        const Color.fromARGB(255, 62, 90, 243),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        String email = _emailController.text.trim();
        String password = _passwordController.text.trim();

        if (email.isEmpty || password.isEmpty) {
          throw Exception('Email and password cannot be empty');
        }
        User? user = await ApiService().login(email, password);
        print(email);

        if (user != null) {
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          userProvider.setUser(user);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('userData', jsonEncode(user.toJson()));
          if (user.level == 'masyarakat') {
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            Navigator.pushReplacementNamed(context, '/kepala_desa');
          }

          print(user.nik);
        } else {
          throw Exception('Failed to login');
        }

        setState(() {
          _isLoading = false;
          _errorMessage = '';
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
          _errorMessage = e.toString();
        });
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Gagal'),
              content: const Text(
                  'Akun Anda belum terverifikasi atau Email & password salah'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }
}
