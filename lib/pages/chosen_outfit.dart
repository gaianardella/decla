import 'package:flutter/material.dart';
import 'package:decla/widgets/bottom_navigation.dart';

class ChosenOutfit extends StatelessWidget {
  final String upperImage;
  final String lowerImage;
  final String footwearImage;

  const ChosenOutfit({
    super.key,
    required this.upperImage,
    required this.lowerImage,
    required this.footwearImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: const Text('Your Outfit'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutfitItem(
            imageUrl: upperImage,
          ),
          OutfitItem(
            imageUrl: lowerImage,
          ),
          OutfitItem(
            imageUrl: footwearImage,
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class OutfitItem extends StatelessWidget {
  final String imageUrl;

  const OutfitItem({super.key, required this.imageUrl});

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
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: const Color.fromRGBO(183, 183, 183, 1), width: 2),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(10, 0, 0, 0).withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
