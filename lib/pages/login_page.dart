import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:decla/widgets/rounded_circular_button.dart';
import 'package:decla/widgets/rounded_text_form_field.dart';
import 'package:decla/widgets/google_apple.dart';
import 'package:flutter/gestures.dart';
import 'package:decla/pages/signup_page.dart';

class LoginPage extends StatelessWidget {
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
              prefixIcon: Icons.email_outlined, hintText: "Email Address"),
          SizedBox(height: 16), // Adding 16 pixels of vertical space
          RoundedTextFormField(
            prefixIcon: Icons.lock_outline,
            hintText: "Password",
            obsecureText: true,
          ),
          SizedBox(height: 20), // Adding 16 pixels of vertical space
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.07,
            child: RoundedCircularButton(
              text: "Sign In",
            ),
          ),
          SizedBox(height: 16), // Adding 16 pixels of vertical space
          Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.blue, fontSize: 15),
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

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
