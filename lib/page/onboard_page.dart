import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surat_meyurat/page/login_page.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(
              44,
              MediaQuery.of(context).size.height * 0.1,
              43.11,
              MediaQuery.of(context).size.height * 0.01),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 65.5),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 45.5, 0, 29.5),
                      width: 232.89,
                      height: 184,
                      child: Image.asset(
                        'assets/bg1.png',
                        width: 532,
                        height: 184,
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        constraints: const BoxConstraints(
                          maxWidth: 356,
                        ),
                        child: Text(
                          'Welcome To Aplication Managemen Document',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2058334053,
                              height: 1.5,
                              color: const Color(0xff494c52)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(50, 0, 50.89, 39),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
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
                          color: Color(0x26bd212f),
                          offset: Offset(0, 15),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Center(
                      child: Center(
                        child: Text(
                          'Let’s get started',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.1725,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(context).size.height * 0.15, 0.89, 0),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const Login()),
                        // );
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.1725,
                            color: const Color(0xff1e1e1e),
                          ),
                          children: [
                            TextSpan(
                              text: 'Already have account?',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 1.1725,
                                color: const Color(0xff494c52),
                              ),
                            ),
                            TextSpan(
                              text: 'Sign In',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 1.1725,
                                color: const Color.fromARGB(255, 62, 90, 243),
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
    );
  }
}
