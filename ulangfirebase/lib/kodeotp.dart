import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import 'selesai.dart';

class KodeOtp extends StatefulWidget {
  const KodeOtp({Key? key}) : super(key: key);

  @override
  State<KodeOtp> createState() => KodeOtpState();
}

class KodeOtpState extends State<KodeOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 40,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_outlined),
                  ),
                  Text(" Masukkan Kode OTP",
                      style: GoogleFonts.poppins().copyWith(
                          fontSize: 19, fontWeight: FontWeight.bold)),
                ]),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Untuk mengganti password, masukkan kado OTP yang dikirim ke nomer +6281290****84",
                    maxLines: 2,
                    style: GoogleFonts.poppins().copyWith(
                        fontSize: 15,
                        color: "A2A2A2".toColor(),
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 55,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  onChanged: (String value) {},
                  pinTheme: PinTheme(
                    inactiveColor: Colors.black45,
                    activeColor: Colors.blue,
                  ),
                ),
              ]),
              Container(
                height: 40,
                width: 310,
                child: FlatButton(
                  onPressed: () {
                    Get.to(Selesai());
                    },
                  child: Text("Verifikasi Sekarang",
                      style: GoogleFonts.poppins()
                          .copyWith(color: "FFFFFF".toColor(),
                          fontWeight: FontWeight.bold)),
                  color: "AAD7DD".toColor(),
                ),
              ),
            ]),
      ),
    );
  }
}
