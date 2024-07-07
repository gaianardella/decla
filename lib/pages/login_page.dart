import 'package:decla/pages/password_recovery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:decla/widgets/rounded_circular_button.dart';
import 'package:decla/widgets/rounded_text_form_field.dart';
import 'package:decla/widgets/google_apple.dart';
import 'package:flutter/gestures.dart';
import 'package:decla/pages/signup_page.dart';
import 'package:decla/pages/home.dart';
import 'dart:developer';
import 'package:decla/pages/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _auth = AuthService(); // Create an AuthService instance

  String? errorMessage = '';
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  // void printControllerValues() {
  //   debugPrint("Name: ${_name.text}");
  //   debugPrint("Email: ${_email.text}");
  //   debugPrint("Password: ${_password.text}");
  // }

  //name = admin
  //email = admin@admin.com
  //password = admin12
  Future<void> signInWithEmailAndPassword() async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      setState(() {
        errorMessage = 'All fields are required';
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
      if (user != null) {
        debugPrint('User signed in successfully: ${user.email}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        _showErrorDialog('User is null after sign in');
        debugPrint('User is null after sign in');
      }
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(e.message ?? 'An error occurred');
      debugPrint(
          'Error: ${e.message}'); // Print the error message for debugging
    } catch (e) {
      _showErrorDialog('An unknown error occurred');
      debugPrint('Error: $e'); // Print the error for debugging
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(
      children: [_header(context), _loginForm(context)],
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
      color: const Color.fromRGBO(176, 222, 250, 1),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.10,
        bottom: MediaQuery.of(context).size.height * 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
          ),
          Image.asset(
            "assets/images/my-bg.png",
            width: MediaQuery.of(context).size.width * 0.50,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.70,
      child: Form(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _formFields(context),
            _loginWidth(context),
            _bottomButtons(context),
          ],
        ),
      )),
    );
  }

  Widget _formFields(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedTextFormField(
              prefixIcon: Icons.email_outlined,
              hintText: "Email Address",
              controller: _email),
          SizedBox(height: 16), // Adding 16 pixels of vertical space
          RoundedTextFormField(
              prefixIcon: Icons.lock_outline,
              hintText: "Password",
              obsecureText: true,
              controller: _password),
          SizedBox(height: 20), // Adding 16 pixels of vertical space
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.07,
            child: RoundedCircularButton(
              text: "Sign In",
              onPressed: signInWithEmailAndPassword, //printControllerValues,
            ),
          ),
          SizedBox(height: 16), // Adding 16 pixels of vertical space
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PasswordRecovery()), // Ensure LoginPage is correctly imported
              );
            },
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginWidth(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40.0), // Add space from the top
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Or Login With',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 62, 101, 1),
            ),
          ),
          SizedBox(height: 10), // Add some spacing between the title and tiles
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(imagePath: 'assets/images/google.svg'),
              SizedBox(width: 25),
              SquareTile(imagePath: 'assets/images/apple.svg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomButtons(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(0, 62, 101, 1),
                ),
                children: [
                  TextSpan(text: "Don't have an account? "),
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(0, 148, 240, 1),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle "Sign Up" link tap
                        Navigator.push(
                          context, // Pass the BuildContext from the widget tree
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Second Page'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context); // Go back to the previous page
//           },
//           child: const Text('Go Back'),
//         ),
//       ),
//     );
//   }
// }
