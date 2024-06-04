import 'package:flutter/material.dart';
import 'package:decla/widgets/bottom_navigation.dart';

class OutfitGenerator extends StatelessWidget {
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
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(95, 0, 250, 1).withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 15,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15.0), // Set your desired border radius
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(95, 0, 250, 1),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.all(20),
                      ),
                    ),
                    child: Icon(Icons.refresh, color: Colors.white),
                  )),
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(255, 46, 46, 1).withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 15,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15.0), // Set your desired border radius
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(255, 46, 46, 1),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(20),
                    ),
                  ),
                  child: Icon(Icons.favorite, color: Colors.white),
                ),
              ),
            ],
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
            decoration: BoxDecoration(
              color: Colors.white, // White background color
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Color.fromRGBO(183, 183, 183, 1),
                width: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(10, 0, 0, 0).withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.only(right: 15),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
              child: Icon(Icons.rotate_right, color: Colors.black),
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
          IconButton(
            icon: Icon(Icons.rotate_right, color: Colors.transparent),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
