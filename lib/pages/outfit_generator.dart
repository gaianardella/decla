import 'package:flutter/material.dart';
import 'package:decla/widgets/bottom_navigation.dart';
import 'package:decla/pages/chosen_outfit.dart';

class OutfitGenerator extends StatelessWidget {
  const OutfitGenerator({super.key});

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
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromRGBO(95, 0, 250, 1).withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Set your desired border radius
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all<Color>(
                        const Color.fromRGBO(95, 0, 250, 1),
                      ),
                      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(20),
                      ),
                    ),
                    child: const Icon(Icons.refresh, color: Colors.white),
                  )),
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(255, 46, 46, 1).withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 15,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChosenOutfit()),
                    );
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15.0), // Set your desired border radius
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromRGBO(255, 46, 46, 1),
                    ),
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(20),
                    ),
                  ),
                  child: const Icon(Icons.favorite, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class OutfitItem extends StatelessWidget {
  final String imagePath;
  final VoidCallback onRotate;

  const OutfitItem({super.key, required this.imagePath, required this.onRotate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // White background color
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: const Color.fromRGBO(183, 183, 183, 1),
                width: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(10, 0, 0, 0).withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            margin: const EdgeInsets.only(right: 15),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              child: const Icon(Icons.rotate_right, color: Colors.black),
            ),
          ),
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
          const IconButton(
            icon: Icon(Icons.rotate_right, color: Colors.transparent),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
