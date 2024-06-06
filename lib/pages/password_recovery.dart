import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:decla/widgets/rounded_circular_button.dart';
import 'package:decla/widgets/rounded_text_form_field.dart';
import 'package:decla/widgets/google_apple.dart';
import 'package:flutter/gestures.dart';
import 'package:decla/pages/login_page.dart';

class PasswordRecovery extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(
      children: [_header(context), _emailForm(context)],
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.15,
        bottom: MediaQuery.of(context).size.height * 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Password Recovery",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          // SizedBox(height: 30),
          // Text(
          //   "Enter your email",
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 15,
          //   ),
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }

  Widget _emailForm(BuildContext context) {
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
              // _bottomButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formFields(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 22.0), // Add padding to the left
            child: Text(
              "Enter your email",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: RoundedTextFormField(
                prefixIcon: Icons.email_outlined, hintText: "Email Address"),
          ),
          SizedBox(height: 20), // Adding 16 pixels of vertical space
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.60,
              height: MediaQuery.of(context).size.height * 0.05,
              child: RoundedCircularButton(
                text: "Reset Password",
              ),
            ),
          ),
          SizedBox(height: 20), // Adding 16 pixels of vertical space
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LoginPage()), // Ensure LoginPage is correctly imported
              );
            },
            child: Center(
              child: Text(
                "Return to login",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

//   Widget _bottomButtons(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 30),
//           child: GestureDetector(
//             onTap: () {
//               // Navigator.push(
//               // context,
//               // MaterialPageRoute(builder: (context) => SecondPage()),
//               // );
//             },
//             child: RichText(
//               text: TextSpan(
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w600,
//                   color: Color.fromRGBO(0, 62, 101, 1),
//                 ),
//                 children: [
//                   TextSpan(text: "Return to "),
//                   TextSpan(
//                     text: "login",
//                     style: TextStyle(
//                       decoration: TextDecoration.underline,
//                       color: Color.fromRGBO(0, 148, 240, 1),
//                     ),
//                     recognizer: TapGestureRecognizer()
//                       ..onTap = () {
//                         // Handle "Sign Up" link tap
//                         Navigator.push(
//                           context, // Pass the BuildContext from the widget tree
//                           MaterialPageRoute(builder: (context) => LoginPage()),
//                         );
//                       },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
}

// // class SecondPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Second Page'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             Navigator.pop(context); // Go back to the previous page
// //           },
// //           child: const Text('Go Back'),
// //         ),
// //       ),
// //     );
// //   }
// // }
