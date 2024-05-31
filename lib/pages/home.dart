import 'package:flutter/material.dart';

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
      drawer: _buildDrawer(context),
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

Widget _buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.contact_mail),
          title: Text('Contact'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
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
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/outfit-generator.jpg'), // Add your background image
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10), // Add border radius
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 185, 43, 1)
                    .withOpacity(0.8), // Add color overlay with opacity
                borderRadius:
                    BorderRadius.circular(10), // Add same border radius
              ),
            ),
            Center(
              child: Text(
                'Outfit Generator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),

      SizedBox(height: 20), // Adjust the space between shapes
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 170, // Adjust the size of the squares
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // Add border radius
              color: const Color.fromARGB(255, 255, 11, 11)
                  .withOpacity(0.5), // Add color overlay
            ),
          ),
          SizedBox(width: 20), // Adjust the space between squares
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // Add border radius
              color: const Color.fromARGB(255, 255, 11, 11)
                  .withOpacity(0.5), // Add color overlay
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _bottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.contact_mail),
        label: 'Contact',
      ),
    ],
  );
}
