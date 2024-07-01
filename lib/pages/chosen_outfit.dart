import 'package:flutter/material.dart';
import 'package:decla/widgets/bottom_navigation.dart';

class ChosenOutfit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: Text('Your Outfit'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutfitItem(
            imagePath: 'assets/images/top.png',
            onRotate: () {},
          ),
          OutfitItem(
            imagePath: 'assets/images/skirt.png',
            onRotate: () {},
          ),
          OutfitItem(
            imagePath: 'assets/images/shoes.png',
            onRotate: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class OutfitItem extends StatelessWidget {
  final String imagePath;
  final VoidCallback onRotate;

  OutfitItem({required this.imagePath, required this.onRotate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: Color.fromRGBO(183, 183, 183, 1), width: 2),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(10, 0, 0, 0).withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
