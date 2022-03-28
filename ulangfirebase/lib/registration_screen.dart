import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';
import 'package:ulangfirebase/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController NamaDepanEditingController = new TextEditingController();
  TextEditingController NamaBelakangEditingController = new TextEditingController();
  TextEditingController EmailEditingController = new TextEditingController();
  TextEditingController PasswordEditingController = new TextEditingController();
  TextEditingController KonfirmasiPasswordEditingController = new TextEditingController();
  bool _obscureText = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    final namaDepanField = TextFormField(
      autofocus: false,
      controller: NamaDepanEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        NamaDepanEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.black),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nama Depan",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final namaBelakangField = TextFormField(
      autofocus: false,
      controller: NamaBelakangEditingController,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        NamaBelakangEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.black),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Nama Belakang",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: EmailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        EmailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.black,
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: PasswordEditingController,
      obscureText: _obscureText,
      onSaved: (value) {
        PasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key, color: Colors.black),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final konfirmasiPasswordField = TextFormField(
      autofocus: false,
      controller: KonfirmasiPasswordEditingController,
      obscureText: _obscureText2,
      onSaved: (value) {
        KonfirmasiPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key, color: Colors.black),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText2 = !_obscureText2;
            });
          },
          child: Icon(_obscureText2 ? Icons.visibility : Icons.visibility_off),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Konfirmasi Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: "00C853".toColor(),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(25, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          Get.to(HomeScreen());
        },
        child: Text("SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_outlined, color: "00C853".toColor()),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 160,
                            height: 160,
                            padding: EdgeInsets.all(0),
                            child: Image(
                              image: AssetImage("assets/timun.png"),
                            ),
                          ),
                          SizedBox(height: 10),
                          namaDepanField,
                          SizedBox(height: 10),
                          namaBelakangField,
                          SizedBox(height: 10),
                          emailField,
                          SizedBox(height: 10),
                          passwordField,
                          SizedBox(height: 10),
                          konfirmasiPasswordField,
                          SizedBox(height: 10),
                          signUpButton,
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
