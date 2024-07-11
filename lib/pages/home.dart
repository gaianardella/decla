library;
import 'package:decla/pages/outfit_generator.dart';
import 'package:decla/pages/manage_closet.dart';
import 'package:decla/pages/declutter_closet.dart';
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
      // bottomNavigationBar: const BottomNavigation(),
    );
  }
}

Widget _buildUI(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_functionsButton(context)],
    ),
  );
}

Widget _functionsButton(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildFunctionButton(
        context,
        'Outfit Generator',
        'assets/images/outfit-generator.jpg',
        const Color.fromRGBO(247, 185, 43, 1),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OutfitGenerator()),
          );
        },
      ),
      const SizedBox(height: 20),
      _buildFunctionButton(
        context,
        'Manage Closet',
        'assets/images/manage2.jpg',
        const Color.fromRGBO(151, 71, 255, 1),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ManageCloset()),
          );
        },
      ),
      const SizedBox(height: 20),
      _buildFunctionButton(
        context,
        'Declutter Closet',
        'assets/images/declutter.jpg',
        const Color.fromRGBO(64, 135, 237, 1),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DeclutterCloset()),
          );
        },
      ),
      const SizedBox(height: 20),
      _buildFunctionButton(
        context,
        'Schedule an Outfit',
        'assets/images/schedule.jpg',
        const Color.fromARGB(255, 51, 202, 74),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DeclutterCloset()),
          );
        },
      ),
    ],
  );
}

Widget _buildFunctionButton(BuildContext context, String title,
    String imagePath, Color overlayColor, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 360,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: overlayColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Center(
            child: Text(
              title,
              style: const TextStyle(
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
  );
}
