import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class Selesai extends StatefulWidget {
  @override
  SelesaiState createState() => SelesaiState();
}

class SelesaiState extends State<Selesai> {
  @override
  Widget build(BuildContext context) {
    return new MediaQuery(
      data: new MediaQueryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 225,
                      height: 245,
                      padding: EdgeInsets.all(3),
                      child: Image(
                        image: AssetImage("assets/berhasil.png"),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Pendaftaran Berhasil",
                      style: GoogleFonts.poppins()
                          .copyWith(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Anda telah terdaftar sebagai member di aplikasi ini",
                      style: GoogleFonts.poppins()
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 130,
                  ),
                  Container(
                    height: 40,
                    width: 310,
                    child: FlatButton(
                        onPressed: () {
                          Get.to(Selesai());
                          },
                        child: Text("Kembali ke Home", style: GoogleFonts.poppins().copyWith(
                            color: "FFFFFF".toColor(),
                            fontWeight: FontWeight.bold)),
                        color: "AAD7DD".toColor()),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
