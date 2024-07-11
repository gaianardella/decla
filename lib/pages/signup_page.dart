import 'package:decla/pages/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:decla/pages/home.dart';
import 'package:decla/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:decla/widgets/rounded_circular_button.dart';
import 'package:decla/widgets/rounded_text_form_field.dart';
import 'package:decla/widgets/google_apple.dart';
import 'package:flutter/gestures.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  String? errorMessage = '';
  bool isLoading = false;

  Future<void> createUserWithEmailAndPassword() async {
    final name = _controllerName.text.trim();
    final email = _controllerEmail.text.trim();
    final password = _controllerPassword.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showErrorDialog('All fields are required');
      return;
    }

    if (!isEmailValid(email)) {
      _showErrorDialog('Invalid email format');
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      User? user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user != null) {
        debugPrint('User signed up successfully: ${user.email}');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        _showErrorDialog('User is null after sign up');
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

  bool isEmailValid(String email) {
    // Regular expression for basic email validation
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(email);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
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
  void dispose() {
    super.dispose();
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
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
      children: [_header(context), _signupForm(context)],
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
              "Sign Up",
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

  Widget _signupForm(BuildContext context) {
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
            _signupWidth(context),
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
              prefixIcon: Icons.person,
              hintText: "Name",
              controller: _controllerName),
          const SizedBox(height: 16), // Adding 16 pixels of vertical space
          RoundedTextFormField(
              prefixIcon: Icons.email_outlined,
              hintText: "Email",
              controller: _controllerEmail),
          const SizedBox(height: 16),
          RoundedTextFormField(
              prefixIcon: Icons.lock_outline,
              hintText: "Password",
              obsecureText: true,
              controller: _controllerPassword),
          const SizedBox(height: 20), // Adding 16 pixels of vertical space
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.07,
            child: RoundedCircularButton(
              text: "Sign Up",
              onPressed:
                  createUserWithEmailAndPassword, //printControllerValues,
            ),
          ),
          const SizedBox(height: 16),
          if (errorMessage != null && errorMessage!.isNotEmpty)
            Text(
              errorMessage!,
              style: const TextStyle(color: Colors.red),
            ), // Adding 16 pixels of vertical space
        ],
      ),
    );
  }

  Widget _signupWidth(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10.0), // Add space from the top
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Or Sign Up With',
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
            },
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(0, 62, 101, 1),
                ),
                children: [
                  const TextSpan(text: "Already have an account? "),
                  TextSpan(
                    text: "Login",
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(0, 148, 240, 1),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle "Sign Up" link tap
                        Navigator.push(
                          context, // Pass the BuildContext from the widget tree
                          MaterialPageRoute(builder: (context) => const LoginPage()),
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

