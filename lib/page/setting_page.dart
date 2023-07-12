// ignore_for_file: unused_field, unused_local_variable

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:surat_meyurat/network/user_provider.dart';
import 'package:surat_meyurat/page/about.dart';
import 'package:surat_meyurat/page/home_page.dart';
import 'package:surat_meyurat/page/kepaladesa.dart';
import 'package:surat_meyurat/page/login_page.dart';
import 'package:surat_meyurat/page/unggah_berkas_page.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isAddButtonClicked = false;
  final _dialog = RatingDialog(
    // your app's name?
    title: Text(
      'Bagaimana Dengan Layanan Kami',
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5,
        color: Color(0xff242424),
      ),
    ),
    // encourage your user to leave a high rating?
    message: Text(
      'Berikan Bintang Dari 1 - 5 ',
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5,
        color: Color(0xff242424),
      ),
    ),
    // your app's logo?
    image: const FlutterLogo(size: 60),
    submitButtonText: 'Submit',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');
      // TODO: add your own logic
      if (response.rating < 3.0) {
      } else {
        //go to app store
        StoreRedirect.redirect(
            androidAppId: 'shri.complete.fitness.gymtrainingapp',
            iOSAppId: 'com.example.rating');
      }
    },
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 62, 90, 243),
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Setting',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // supportusus3 (11:955)
                  margin: EdgeInsets.fromLTRB(
                      15, MediaQuery.of(context).size.height * 0.035, 0, 0),
                  child: Text(
                    'SUPPORT US',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: Color(0xff242424),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 1.0,
                  child: Stack(
                    children: [
                      Positioned(
                        // autogroupaskbpsX (45uBhRzwE29aDbSDsuAsKb)
                        left: 19,
                        top: 23,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => _dialog,
                            );
                          },
                          child: Container(
                            width: 383,
                            height: 31,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group759997 (11:979)
                                  margin: EdgeInsets.fromLTRB(10, 0, 11, 1),
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 62, 90, 243),
                                  ),
                                ),
                                Container(
                                  // rateappStu (11:949)
                                  margin: EdgeInsets.fromLTRB(
                                      0,
                                      2,
                                      MediaQuery.of(context).size.width * 0.5,
                                      0),
                                  child: Text(
                                    'Rate app',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      color: Color(0xff242424),
                                    ),
                                  ),
                                ),
                                Container(
                                  // optZid (11:957)
                                  margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // autogroupx8mkmiD (45uBv1UK5K3eowAzH4X8mK)
                        left: 28,
                        top: 70,
                        child: Container(
                          width: 383,
                          height: 34,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // group760tXw (11:987)
                                margin: EdgeInsets.fromLTRB(0, 0, 11, 0),
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.share,
                                  color: Color.fromARGB(255, 62, 90, 243),
                                ),
                              ),
                              Container(
                                // sharetheapp1cZ (11:951)
                                margin: EdgeInsets.fromLTRB(0, 0,
                                    MediaQuery.of(context).size.width * 0.4, 3),
                                child: Text(
                                  'Share the app',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    color: Color(0xff242424),
                                  ),
                                ),
                              ),
                              Container(
                                // optXqo (11:963)
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // autogrouppdxsxJq (45uC75zBpLsSiqtt4RpDXs)
                        left: 28,
                        top: 125,
                        child: Container(
                          width: 383,
                          height: 32,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group761gkd (11:996)
                                margin: EdgeInsets.fromLTRB(0, 0, 11, 2),
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.comment_outlined,
                                  color: Color.fromARGB(255, 62, 90, 243),
                                ),
                              ),
                              Container(
                                // commentforuscPP (11:953)
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    1,
                                    MediaQuery.of(context).size.width * 0.35,
                                    0),
                                child: Text(
                                  'Comment for us',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    color: Color(0xff242424),
                                  ),
                                ),
                              ),
                              Container(
                                // optvus (11:969)
                                margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // contact9rV (11:956)
                        left: 20,
                        top: 212,
                        child: Align(
                          child: SizedBox(
                            width: 79,
                            height: 24,
                            child: Text(
                              'CONTACT',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                color: Color(0xff242424),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // autogroupxufbGsw (45uCHFMvSKvj7DDggoxufb)
                        left: 28,
                        top: 269,
                        child: Container(
                          width: 383,
                          height: 31,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  // group762bQR (11:983)
                                  margin: EdgeInsets.fromLTRB(0, 0, 11, 1),
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.live_help,
                                    color: Color.fromARGB(255, 62, 90, 243),
                                  )),
                              Container(
                                // about7tZ (11:950)
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    2,
                                    MediaQuery.of(context).size.width * 0.45,
                                    0),
                                child: Text(
                                  'Regulation',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    color: Color(0xff242424),
                                  ),
                                ),
                              ),
                              Container(
                                // optetV (11:960)
                                margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // autogroupjca14Kw (45uCSAGjoRkmbPN6U2jca1)
                        left: 28,
                        top: 322,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const About()),
                            );
                          },
                          child: Container(
                            width: 383,
                            height: 34,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    // group763BfT (11:992)
                                    margin: EdgeInsets.fromLTRB(0, 0, 11, 0),
                                    width: 30,
                                    height: 30,
                                    child: Icon(
                                      Icons.privacy_tip_outlined,
                                      color: Color.fromARGB(255, 62, 90, 243),
                                    )),
                                Container(
                                  // privacypolicyWSq (11:952)
                                  margin: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      MediaQuery.of(context).size.width * 0.4,
                                      3),
                                  child: Text(
                                    'About Apps',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      color: Color(0xff242424),
                                    ),
                                  ),
                                ),
                                Container(
                                  // optpyK (11:966)
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 4),
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // autogrouppxbbeay (45uCauXAbcMStjcrQAPXBB)
                        left: 28,
                        top: 386,
                        child: Container(
                          width: 383,
                          height: 32,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  // group764mfb (11:1000)
                                  margin: EdgeInsets.fromLTRB(0, 0, 11, 2),
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.web_outlined,
                                    color: Color.fromARGB(255, 62, 90, 243),
                                  )),
                              Container(
                                // website5wB (11:954)
                                margin: EdgeInsets.fromLTRB(0, 1,
                                    MediaQuery.of(context).size.width * 0.5, 0),
                                child: Text(
                                  'Website',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    color: Color(0xff242424),
                                  ),
                                ),
                              ),
                              Container(
                                // opt1pq (11:972)
                                margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // autogroupdqkm8eZ (45uCmKPV4yFn4Ln8oBDQkm)
                        left: 28,
                        top: 440,
                        child: Container(
                          width: 382,
                          height: 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  // group765GEy (11:1011)
                                  margin: EdgeInsets.fromLTRB(0, 0, 11, 0),
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.phone_android,
                                    color: Color.fromARGB(255, 62, 90, 243),
                                  )),
                              Container(
                                // whatsappbY9 (11:1006)
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    3,
                                    MediaQuery.of(context).size.height * 0.22,
                                    0),
                                child: Text(
                                  'WhatsApp',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    color: Color(0xff242424),
                                  ),
                                ),
                              ),
                              Container(
                                // optKU9 (35495:261)
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // autogroupgusdf2D (45uCwEGdqaU1fUGTevguSd)
                        left: 28,
                        top: 500,
                        child: InkWell(
                          onTap: () {
                            Provider.of<UserProvider>(context, listen: false)
                                .logout();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                          child: Container(
                            width: 387,
                            height: 30,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group766NhK (35495:251)
                                  margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.exit_to_app_outlined,
                                    color: Color.fromARGB(255, 62, 90, 243),
                                  ),
                                ),
                                Container(
                                  // logoutHpH (35495:257)
                                  margin: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      MediaQuery.of(context).size.width * 0.5,
                                      3),
                                  child: Text(
                                    'Log Out',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5,
                                      color: Color(0xff242424),
                                    ),
                                  ),
                                ),
                                Container(
                                  // opt2G5 (35495:258)
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 62, 90, 243),
          child: Icon(
            isAddButtonClicked ? Icons.clear_outlined : Icons.add,
          ),
          onPressed: () {
            setState(() {
              isAddButtonClicked = true;
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Customize the border radius as desired
                      // Add additional border customization properties here, such as border color, etc.
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(24, 32, 24, 79.63),
                      width: 313,
                      height: 230,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 2,
                            sigmaY: 0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                child: Text(
                                  'Buat Surat',
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2000000477,
                                    letterSpacing: -0.2399999946,
                                    color: Color.fromARGB(255, 62, 90, 243),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Uploadb()),
                                  );
                                },
                                child: Container(
                                  // autogroupvg45ntV (TFZN5MmB1HcyCFkvZxvg45)
                                  margin:
                                      EdgeInsets.fromLTRB(2.6, 0, 124, 23.22),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          // galleryLQD (11:540)
                                          margin: EdgeInsets.fromLTRB(
                                              0, 0, 17.6, 0),
                                          width: 20.8,
                                          height: 20.8,
                                          child: Icon(Icons.image_outlined)),
                                      Container(
                                        // photoorvideoTUq (11:287)
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Text(
                                          'Upload Berkas',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            height: 1.3714286259,
                                            letterSpacing: -0.2399999946,
                                            color: Color(0xff242424),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupecirNrh (TFZNAmmpT7cLm6CdaLEciR)
                                margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        // vector7ZP (11:292)
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 19.13, 0),
                                        width: 17.88,
                                        height: 22.75,
                                        child:
                                            Icon(Icons.upload_file_outlined)),
                                    Text(
                                      // files3C9 (11:288)
                                      'Files',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3714286259,
                                        letterSpacing: -0.2399999946,
                                        color: Color(0xff242424),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).then((value) {
                setState(() {
                  isAddButtonClicked = false;
                });
              });
            });
          },
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.home_outlined,
                      color: Color.fromARGB(255, 62, 90, 243),
                    ),
                    onPressed: () async {
                      final userProvider =
                          Provider.of<UserProvider>(context, listen: false);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      final level = userProvider.user?.level;
                      if (level == 'masyarakat') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Kepaladesa()),
                        );
                      }
                    }),
                IconButton(
                  icon: Icon(
                    Icons.newspaper_outlined,
                    color: Color.fromARGB(255, 62, 90, 243),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const About()),
                    );
                  },
                ),
                SizedBox(width: 40), // The dummy child
                IconButton(
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: Color.fromARGB(255, 62, 90, 243),
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.settings_outlined,
                      color: Color.fromARGB(255, 62, 90, 243),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Setting()),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
