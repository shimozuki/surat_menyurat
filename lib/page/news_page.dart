// ignore_for_file: unused_field, unused_local_variable, unused_import

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surat_meyurat/model/news_model.dart';
import 'package:surat_meyurat/network/news_service.dart';
import 'package:surat_meyurat/network/user_provider.dart';
import 'package:surat_meyurat/page/detail_berita.dart';
import 'package:surat_meyurat/page/home_page.dart';
import 'package:surat_meyurat/page/kepaladesa.dart';
import 'package:surat_meyurat/page/setting_page.dart';
import 'package:surat_meyurat/page/unggah_berkas_page.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool isAddButtonClicked = false;
  final NewsService _newsService = NewsService();
  List<NewsModel> _newsList = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  void fetchNews() async {
    try {
      final news = await _newsService.fetchNewsList();
      setState(() {
        _newsList = news;
      });
    } catch (e) {
      print('Error: $e');
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
              'Berita Desa',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(30),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 22.67, 64.4),
                    width: double.infinity,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true, // Add this line
                      itemCount: _newsList.length,
                      itemBuilder: (context, index) {
                        final news = _newsList[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 5),
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                'assets/news_defauld.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print(news.idBerita);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailBerita(
                                            beritaId: news.idBerita,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          MediaQuery.of(context).size.width *
                                              0.15,
                                          0),
                                      width: 280,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 8),
                                            child: Text(
                                              '${news.jenisBerita}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                height: 1.1999999455,
                                                letterSpacing: -0.2399999946,
                                                color: Color(0xff7c809e),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 8),
                                            child: Text(
                                              '${news.namaBerita}',
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
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: Text(
                                              '${news.tanggalPost}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                height: 1.2000000477,
                                                letterSpacing: -0.2399999946,
                                                color: Color(0xff7c809e),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   // rideletebin2lineXgf (11:849)
                                  //   margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  //   width: 20,
                                  //   height: 25,
                                  //   child: InkWell(
                                  //     onTap: () async {
                                  //       // await downloadAndSavePdf(
                                  //       //     suratsis.idSuratDesa);
                                  //       // sharePdf();
                                  //     },
                                  //     child: Icon(
                                  //       Icons.print,
                                  //       color: Color.fromARGB(255, 62, 90, 243),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const About()),
                    // );
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
