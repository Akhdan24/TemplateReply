import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';
import 'package:ulangfirebase/registration_screen.dart';
import 'package:ulangfirebase/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email, required password, required BuildContext}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for that email");
      }
    }
    return user;
  }

  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Container(
                    width: 160,
                    height: 160,
                    padding: EdgeInsets.all(5),
                    child: Image(
                      image: AssetImage("assets/timun.png"),
                    ),
                  ),
                  // Text(
                  //   "Sign Up Now",
                  //   style: GoogleFonts.poppins().copyWith(
                  //       fontSize: 20,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.w400),
                  // ),
                  //SizedBox(height: 5),
                  // Text(
                  //   "Please fill the details and create account",
                  //   style: GoogleFonts.poppins().copyWith(
                  //       fontSize: 15,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.w400),
                  // ),
                  // SizedBox(height: 10),
                  // TextField(
                  //   keyboardType: TextInputType.name,
                  //   decoration: const InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     hintText: "Full Name",
                  //     hintStyle: TextStyle(color: Colors.black26),
                  //     prefixIcon: Icon(
                  //       Icons.perm_identity_outlined,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black26),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    obscureText: _obscureText,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.key, color: Colors.black),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black26),
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //    child: Text("Password must atleast 6 character",
                  //        style: GoogleFonts.poppins().copyWith(
                  //            fontSize: 13,
                  //            color: Colors.black26,
                  //            fontWeight: FontWeight.w400)),
                  // ),
                  SizedBox(height: 150),
                  Container(
                    width: double.infinity,
                    child: RawMaterialButton(
                      fillColor: "00C853".toColor(),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      onPressed: () async {
                        User? user = await loginUsingEmailPassword(
                            email: emailController.text,
                            password: passwordController.text,
                            BuildContext: context);
                        print(user);
                        if (user != null) {
                          Get.to(RegistrationScreen());
                        }
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Already have an account ?",
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 12,
                            color: Colors.black45,
                            fontWeight: FontWeight.w400)),
                    Text(" Log In",
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ]),
                  // Column(children: [
                  //   // Text("Or connect with",
                  //   //     style: GoogleFonts.poppins().copyWith(
                  //   //         fontSize: 13,
                  //   //         color: Colors.black45,
                  //   //         fontWeight: FontWeight.w400)),
                  // ]),
                  //SizedBox(height: 25),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         child: Image.asset('assets/google.png',
                  //             width: 60, height: 60),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 25,
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         child: Image.asset('assets/twitter.png',
                  //             width: 60, height: 60),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 25,
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Container(
                  //         child: Image.asset('assets/facebook.png',
                  //             width: 60, height: 60),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
