// ignore_for_file: unused_local_variable

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surat_meyurat/network/PengajuanSurat_Service.dart';
import 'package:surat_meyurat/network/user_provider.dart';
import 'package:surat_meyurat/page/about.dart';
import 'package:surat_meyurat/page/home_page.dart';
import 'package:surat_meyurat/page/setting_page.dart';
import 'package:surat_meyurat/page/suratnonverif_page.dart';
import 'package:surat_meyurat/page/unggah_berkas_page.dart';

class PengajuanSurat extends StatefulWidget {
  const PengajuanSurat({super.key});

  @override
  State<PengajuanSurat> createState() => _PengajuanSuratState();
}

class _PengajuanSuratState extends State<PengajuanSurat> {
  bool isAddButtonClicked = false;
  PengajuanSuratService pengajuanSuratService = PengajuanSuratService();

  void submitButtonPressed(String jenisSurat) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final nik = userProvider.user?.nik;
    bool isSuccess = await pengajuanSuratService.submitSurat(nik!, jenisSurat);
    if (isSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Suratnoverif()),
      );

      // Tampilkan toast "Berhasil melakukan pengajuan"
      Fluttertoast.showToast(
        msg: 'Berhasil melakukan pengajuan',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Gagal Melakukan Pengajuan'),
            content:
                Text('Anda Harus Melakukan Pengajuan Berkas Terlebih Dahulu'),
            actions: <Widget>[
              TextButton(
                child: Text('Tutup'),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 62, 90, 243),
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Pengajuan Surat',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 36.25, 0, 0),
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(27.25, 0, 28, 502.5),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0, 0, MediaQuery.of(context).size.width * 0.2, 0),
                        width: 230.75,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 39.75),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    // folderH41 (16:234)
                                    margin: EdgeInsets.fromLTRB(0, 0, 10.25, 0),
                                    width: 52.5,
                                    height: 47.25,
                                    child: Image.asset(
                                      'assets/pdf.png',
                                    ),
                                  ),
                                  Container(
                                    // autogroupqgrrL2H (65d4cRbpZzR7gLa2FdQGrR)
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0.5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // suratkelakuanbaikpi9 (16:233)
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 0, 8),
                                          child: Text(
                                            'Surat Kelakuan Baik',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              height: 1.2000000477,
                                              letterSpacing: -0.2399999946,
                                              color: Color(0xff21205a),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // sizesgR (16:229)
                                          margin:
                                              EdgeInsets.fromLTRB(1, 0, 0, 0),
                                          width: 74,
                                          height: 17,
                                          child: Center(
                                            child: Text(
                                              'Pengajuan ',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                height: 1.1999999455,
                                                letterSpacing: -0.2399999946,
                                                color: Color(0xff7c809e),
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
                            Container(
                              // project2tLd (16:218)
                              margin: EdgeInsets.fromLTRB(0, 0, 13, 39.75),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      // folderQJy (16:224)
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 21.25, 0),
                                      width: 52.5,
                                      height: 47.25,
                                      child: Image.asset('assets/pdf.png')),
                                  Container(
                                    // autogroupmf5wuWd (65d4KBbYq14orstz9zmf5w)
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0.5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // suratpindahdesaPwb (16:223)
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 0, 8),
                                          child: Text(
                                            'Surat Tidak Mampu',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              height: 1.2000000477,
                                              letterSpacing: -0.2399999946,
                                              color: Color(0xff21205a),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // sizeVUq (16:219)
                                          margin:
                                              EdgeInsets.fromLTRB(1, 0, 0, 0),
                                          width: 74,
                                          height: 17,
                                          child: Center(
                                            child: Text(
                                              'Pengajuan',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                height: 1.1999999455,
                                                letterSpacing: -0.2399999946,
                                                color: Color(0xff7c809e),
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
                            Container(
                              // project2tLd (16:218)
                              margin: EdgeInsets.fromLTRB(0, 0, 13, 39.75),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                      // folderQJy (16:224)
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 21.25, 0),
                                      width: 52.5,
                                      height: 47.25,
                                      child: Image.asset('assets/pdf.png')),
                                  Container(
                                    // autogroupmf5wuWd (65d4KBbYq14orstz9zmf5w)
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0.5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // suratpindahdesaPwb (16:223)
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 0, 8),
                                          child: Text(
                                            'Surat Keterangan Usaha',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              height: 1.2000000477,
                                              letterSpacing: -0.2399999946,
                                              color: Color(0xff21205a),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // sizeVUq (16:219)
                                          margin:
                                              EdgeInsets.fromLTRB(1, 0, 0, 0),
                                          width: 74,
                                          height: 17,
                                          child: Center(
                                            child: Text(
                                              'Pengajuan',
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                height: 1.1999999455,
                                                letterSpacing: -0.2399999946,
                                                color: Color(0xff7c809e),
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
                          ],
                        ),
                      ),
                      Container(
                        // autogroupu9nvZDo (65d4AwLHjaAE81KBm8U9NV)
                        margin: EdgeInsets.fromLTRB(0, 10.25, 0, 13),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                print('kelakuan baik');
                                submitButtonPressed('Surat Kelakuan Baik');
                              },
                              child: Container(
                                // iconmenugZK (16:267)
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 71),
                                width: 16,
                                height: 16,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print('kelakuan baik');
                                submitButtonPressed('Surat Tidak Mampu');
                              },
                              child: Container(
                                // iconmenugZK (16:267)
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 71),
                                width: 16,
                                height: 16,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print('pindah desa');
                                submitButtonPressed('Surat Keterangan Usaha');
                              },
                              child: Container(
                                // iconmenuaeh (16:272)
                                width: 16,
                                height: 16,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
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
