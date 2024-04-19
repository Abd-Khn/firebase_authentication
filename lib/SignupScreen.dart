import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController =
      TextEditingController(); //Variable to pass the values from textfield
  var passController =
      TextEditingController(); //Variable to pass the values from textfield

  // Putting an instance in firebase_auth to get
  // all the functionalities of firebase authentication
  // with email and password
  var firebase_auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Firebase",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              style: GoogleFonts.poppins(fontSize: 16),
              textInputAction: TextInputAction.none,
              obscureText: false,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                fillColor: Colors.black26,
                filled: true,
                prefixIcon: Icon(
                  Icons.alternate_email,
                  size: 18,
                  color: Color(0xFF280137),
                ),
                hintText: "Email",
                hintStyle: GoogleFonts.poppins(),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passController,
              style: GoogleFonts.poppins(fontSize: 16),
              textInputAction: TextInputAction.none,
              obscureText: true,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                fillColor: Colors.black26,
                filled: true,
                prefixIcon: Icon(
                  Icons.password,
                  size: 18,
                  color: Color(0xFF280137),
                ),
                hintText: "Password",
                hintStyle: GoogleFonts.poppins(),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text.toString();
                String password = passController.text.toString();

                try {
                  firebase_auth
                      .createUserWithEmailAndPassword(
                          email: email, password: password)
                      .then((UserCredential userCredential) {
                    // print(" ${userCredential.user.toString()}");
                    // print(" ${userCredential.credential!.signInMethod}");
                  });
                } catch (e) {
                  print("Error ${e.toString()}");
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(2000, 50),
                backgroundColor: Colors.blue, // Background color
                padding: EdgeInsets.symmetric(
                    horizontal: 50, vertical: 15), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
