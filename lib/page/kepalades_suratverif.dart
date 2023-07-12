// ignore_for_file: unused_local_variable

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surat_meyurat/model/allsurat_model.dart';
import 'package:surat_meyurat/network/allsurat_service.dart';
import 'package:surat_meyurat/network/updatesurat_service.dart';
import 'package:surat_meyurat/network/user_provider.dart';
import 'package:surat_meyurat/page/about.dart';
import 'package:surat_meyurat/page/kepaladesa.dart';
import 'package:surat_meyurat/page/setting_page.dart';

class KepdesSuratnoverif extends StatefulWidget {
  const KepdesSuratnoverif({super.key});

  @override
  State<KepdesSuratnoverif> createState() => _KepdesSuratnoverifState();
}

class _KepdesSuratnoverifState extends State<KepdesSuratnoverif> {
  final AllSuratService suratsAllService = AllSuratService();
  List<AllSuratModel> suratList = [];
  bool isAddButtonClicked = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final nik = userProvider.user?.nik;
      final List<AllSuratModel> fetchedSurat = // Update the type here
          await suratsAllService.fetchAllSurat();
      setState(() {
        suratList = fetchedSurat;
      });
    } catch (e) {
      // Handle error
      print(e.toString());
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
              'My Surat',
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
                      itemCount: suratList.length,
                      itemBuilder: (context, index) {
                        final suratsis = suratList[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 5),
                              width: 52,
                              height: 50,
                              child: Image.asset('assets/pdf.png'),
                            ),
                            InkWell(
                              onTap: () async {
                                if (suratsis.status == '0') {
                                  UpdateSuratService updateSuratService =
                                      UpdateSuratService();
                                  bool upsurat = await updateSuratService
                                      .updateSurat(suratsis.idSuratDesa);
                                  if (upsurat) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const KepdesSuratnoverif()),
                                    );

                                    // Tampilkan toast "Berhasil melakukan pengajuan"
                                    Fluttertoast.showToast(
                                      msg: 'Surat Diaktifkan',
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
                                          title:
                                              Text('Gagal Melakukan Pengajuan'),
                                          content: Text('Terjadi Kesalahan'),
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
                                } else {
                                  Fluttertoast.showToast(
                                    msg: 'Surat Telah Diaktifkan',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor:
                                        const Color.fromARGB(255, 66, 66, 66),
                                    textColor: Colors.white,
                                  );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 7),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          MediaQuery.of(context).size.width *
                                              0.15,
                                          0),
                                      width: 180,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 8),
                                            child: Text(
                                              '${suratsis.jenisSurat}',
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
                                                EdgeInsets.fromLTRB(0, 0, 0, 8),
                                            child: Text(
                                              '${suratsis.nik}',
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
                                                EdgeInsets.fromLTRB(0, 0, 0, 8),
                                            child: Text(
                                              '${suratsis.dateCreated}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                height: 1.1999999455,
                                                letterSpacing: -0.2399999946,
                                                color: Color(0xff7c809e),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // rideletebin2lineXgf (11:849)
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      width: 20,
                                      height: 25,
                                      child: Icon(
                                        suratsis.status == '1'
                                            ? Icons.check_box_outlined
                                            : Icons.access_time,
                                        color: suratsis.status == '1'
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
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
                                  Fluttertoast.showToast(
                                    msg: 'Tidak Dapat Di Akses',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor:
                                        Color.fromARGB(255, 41, 41, 41),
                                    textColor: Colors.white,
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
                        MaterialPageRoute(
                            builder: (context) => const Kepaladesa()),
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
