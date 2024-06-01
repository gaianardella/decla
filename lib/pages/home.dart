import 'package:flutter/material.dart';
import 'package:decla/widgets/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: const Color.fromRGBO(176, 222, 250, 1),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              iconSize: 40,
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const SidebarNavigation(),
      body: _buildUI(context),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }
}

Widget _buildUI(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [_functionsButton(context)],
  );
}

Widget _functionsButton(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 360, // Adjust the size of the rectangle
        height: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Add border radius
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/images/outfit-generator.jpg'), // Add your background image
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10), // Add border radius
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(247, 185, 43, 1)
                    .withOpacity(0.8), // Add color overlay with opacity
                borderRadius:
                    BorderRadius.circular(10), // Add same border radius
              ),
            ),
            const Center(
              child: Text(
                'Outfit Generator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Color.fromARGB(50, 0, 0, 0),
                      offset: Offset(0, 4.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 20), // Adjust the space between shapes
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 170, // Adjust the size of the squares
            height: 170,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/manage.jpg'), // Add your background image
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                        BorderRadius.circular(10), // Add border radius
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(151, 71, 255, 1)
                        .withOpacity(0.8), // Add color overlay with opacity
                    borderRadius:
                        BorderRadius.circular(10), // Add same border radius
                  ),
                ),
                const Center(
                  child: Text(
                    'Manage Closet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0),
                          offset: Offset(0, 4.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20), // Adjust the space between squares
          Container(
            width: 170,
            height: 170,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/stat.jpg'), // Add your background image
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                        BorderRadius.circular(10), // Add border radius
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(64, 135, 237, 1)
                        .withOpacity(0.8), // Add color overlay with opacity
                    borderRadius:
                        BorderRadius.circular(10), // Add same border radius
                  ),
                ),
                const Center(
                  child: Text(
                    'ُStats',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0),
                          offset: Offset(0, 4.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _bottomNavigationBar(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(10, 0, 0, 0).withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 8,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Profile',
        ),
      ],
    ),
  );
}
