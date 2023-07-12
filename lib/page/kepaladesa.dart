import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surat_meyurat/page/kepalades_suratverif.dart';
import 'package:surat_meyurat/page/news_page.dart';
import 'package:surat_meyurat/page/setting_page.dart';

import 'package:surat_meyurat/page/unggah_berkas_page.dart';

class Kepaladesa extends StatefulWidget {
  const Kepaladesa({super.key});

  @override
  State<Kepaladesa> createState() => _KepaladesaState();
}

class _KepaladesaState extends State<Kepaladesa> {
  bool isAddButtonClicked = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Tulis kode di sini untuk mengubah perilaku tombol "Back"
        return false; // Mengembalikan false akan mencegah navigasi kembali
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 62, 90, 243),
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(
                'Dashboard',
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
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        top: 20,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 62, 90, 243),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: -20,
                                top: -70,
                                child: Align(
                                  child: SizedBox(
                                    width: 441.78,
                                    height: 415,
                                    child: Image.asset('assets/spiral.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 22,
                                top: MediaQuery.of(context).size.height * 0.16,
                                child: Container(
                                  width: 235,
                                  height: 103,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 16),
                                        constraints: BoxConstraints(
                                          maxWidth: 235,
                                        ),
                                        child: Text(
                                          'Lakukan Verifikasi Dokumen Anda Secara Digital',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            height: 1.75,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 30,
                                top: 26,
                                child: Align(
                                  child: SizedBox(
                                    width: 60,
                                    height: 98,
                                    child: Image.asset('assets/logo1.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        // homeindicatorSWF (10:359)
                        left: MediaQuery.of(context).size.width * 0.40,
                        top: MediaQuery.of(context).size.height * 0.33,
                        child: Align(
                          child: SizedBox(
                            width: 75,
                            height: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color.fromARGB(255, 62, 90, 243),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: MediaQuery.of(context).size.height * 0.36,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(17.19, 18, 27.45, 18.52),
                          width: MediaQuery.of(context).size.width *
                              0.95, // 40% dari lebar layar
                          height: MediaQuery.of(context).size.height *
                              0.15, // 30% dari tinggi layar
                          decoration: BoxDecoration(
                            color: Color(0x28f0a714),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const KepdesSuratnoverif(),
                                    ),
                                  );
                                },
                                child: Container(
                                  // title8KD (10:127)
                                  margin: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      MediaQuery.of(context).size.width * 0.6,
                                      0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // pengajuansGo (10:129)
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 10.14),
                                        child: Text(
                                          'Pengajuan',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2000000477,
                                            letterSpacing: -0.2399999946,
                                            color: Color(0xfff0a714),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // defaultC4B (10:128)
                                        '10 Files',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 1.1999999455,
                                          letterSpacing: -0.2399999946,
                                          color: Color(0xfffdcd55),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                                          builder: (context) =>
                                              const Uploadb()),
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
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          // vector7ZP (11:292)
                                          margin: EdgeInsets.fromLTRB(
                                              0, 0, 19.13, 0),
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
                      onPressed: () {}),
                  IconButton(
                    icon: Icon(
                      Icons.newspaper_outlined,
                      color: Color.fromARGB(255, 62, 90, 243),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const News()),
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
      ),
    );
  }
}
