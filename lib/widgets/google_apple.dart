import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;

  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55, // Set a fixed width for the square tile
      height: 55, // Set a fixed height for the square tile
      child: SvgPicture.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
