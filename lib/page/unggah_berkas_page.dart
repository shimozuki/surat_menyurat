// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surat_meyurat/network/upload_file_service.dart';
import 'package:surat_meyurat/network/user_provider.dart';
import 'package:surat_meyurat/page/about.dart';
import 'package:surat_meyurat/page/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:surat_meyurat/page/setting_page.dart';
import 'dart:io';

import 'package:surat_meyurat/page/surataktif_page.dart';

class Uploadb extends StatefulWidget {
  const Uploadb({super.key});

  @override
  State<Uploadb> createState() => _UploadbState();
}

class _UploadbState extends State<Uploadb> {
  bool isAddButtonClicked = false;
  List<File> fileNames = [];
  UploadFileService uploadFileService = UploadFileService();

  void saveButtonPressed() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final nik = userProvider.user?.nik;
    if (fileNames.length >= 2) {
      File fotoKTP = fileNames[0]; // Ambil file foto KTP dari fileNames list
      File fotoKK = fileNames[1]; // Ambil file foto KK dari fileNames list

      bool up = await uploadFileService.uploadFiles(nik!, fotoKTP, fotoKK);
      if (up) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Surat()),
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
    } else {
      print('Pilih minimal 2 file gambar');
    }
  }

  Future<void> selectFiles() async {
    List<XFile>? result = await ImagePicker().pickMultiImage();

    if (result != null) {
      List<File> images =
          result.map((XFile image) => File(image.path)).toList();

      if (images.length > 2) {
        images = images.sublist(
            0, 2); // Select the first 2 images if more than 2 are chosen
      }

      setState(() {
        fileNames = images;
      });
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
              'Upload Berkas',
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 20,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: MediaQuery.of(context).size.width * 0.55,
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
                                top: MediaQuery.of(context).size.height * 0.14,
                                child: Container(
                                  width: 235,
                                  height: 103,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        constraints: BoxConstraints(
                                          maxWidth: 235,
                                        ),
                                        child: Text(
                                          'Alamat Domisili',
                                          style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 16),
                                        constraints: BoxConstraints(
                                          maxWidth: 235,
                                        ),
                                        child: Text(
                                          'Desa Berang Rea',
                                          style: GoogleFonts.poppins(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 7,
                                top: 10,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height: 95,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        width: 105,
                                        height: double.infinity,
                                        child:
                                            Image.asset('assets/profile.png'),
                                      ),
                                      Container(
                                        // muhammadammadSGu (35469:366)
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 21),
                                        child: Text(
                                          'Shimozuki',
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800,
                                            height: 1.2575,
                                            color: Color(0xffffffff),
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
                      ),
                      Positioned(
                        // membersinceaugust12022XxZ (35469:489)
                        left: 125,
                        top: MediaQuery.of(context).size.height * 0.1,
                        child: Align(
                          child: SizedBox(
                            width: 116,
                            height: 20,
                            child: Text(
                              'Masyarakat',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                height: 1.2575,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // homeindicatorSWF (10:359)
                        left: MediaQuery.of(context).size.width * 0.37,
                        top: MediaQuery.of(context).size.height * 0.32,
                        child: Align(
                          child: SizedBox(
                            width: 80,
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
                      Container(
                        // group8016Bf (35469:482)
                        padding: EdgeInsets.fromLTRB(0,
                            MediaQuery.of(context).size.height * 0.35, 0, 12),
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 31),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // uploadfotoktpkartukeluargaEHs (35469:483)
                              margin: EdgeInsets.fromLTRB(9, 0, 0, 15),
                              child: Text(
                                'Upload Foto Ktp &  Kartu Keluarga',
                                style: GoogleFonts.poppins(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: selectFiles,
                              child: Container(
                                // autogroupp9gzM7b (XMYvi5KfygL5CnriiLP9GZ)
                                padding: EdgeInsets.fromLTRB(141, 10, 140, 0),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                  color: Color(0xffebebeb),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  // backupsrd (35469:485)
                                  child: SizedBox(
                                    width: 64,
                                    height: 64,
                                    child: Icon(
                                      Icons.cloud_upload_outlined,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            31, MediaQuery.of(context).size.height * 0.5, 0, 0),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 1.0,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          itemCount: fileNames.length,
                          itemBuilder: (BuildContext context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            width: 56,
                                            height: 69,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child:
                                                  Image.file(fileNames[index]),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  'File_image.jpg',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.2,
                                                    letterSpacing: -0.24,
                                                    color: Color(0xff21205a),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '200 MB', // Tanggal yang ingin ditampilkan
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: 6.37,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25),
                                      width: 16.67,
                                      height: 16.08,
                                      child: Icon(
                                        Icons.delete_forever_outlined,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10, // Spasi antara file yang diupload
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: saveButtonPressed,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 46,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 62, 90, 243),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: Center(
                        child: Text(
                          'Upload Berkas',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            height: 1.1725,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Center(
                      child: Text(
                        '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.1725,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Center(
                      child: Text(
                        '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.1725,
                          color: const Color(0xffffffff),
                        ),
                      ),
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
