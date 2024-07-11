import 'package:flutter/material.dart';
class RoundedTextFormField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obsecureText;
  final TextEditingController controller;

  const RoundedTextFormField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    this.obsecureText = false,
    required this.controller,
  });

  @override
  _RoundedTextFormFieldState createState() => _RoundedTextFormFieldState();
}

class _RoundedTextFormFieldState extends State<RoundedTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(67, 71, 77, 0.08),
              spreadRadius: 10,
              blurRadius: 40,
              offset: Offset(0, 12))
        ],
      ),
      child: Center(
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: TextFormField(
            obscureText: widget.obsecureText,
            controller: widget.controller, // Assign the passed controller
            decoration: InputDecoration(
              prefixIcon: Icon(
                widget.prefixIcon,
                color: Colors.blue,
              ),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(131, 143, 160, 100),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
