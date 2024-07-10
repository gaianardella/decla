import 'package:decla/pages/manage_closet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.checkCircle,
              color: Colors.green,
              size: 50,
            ),
            const SizedBox(height: 20),
            const Text(
              'Item Added Successfully!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigate to the OutfitGenerator function
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageCloset()),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(172, 124, 250, 1),
                          Color.fromRGBO(158, 118, 246, 1),
                          Color.fromRGBO(96, 55, 201, 1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Back to closet',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
