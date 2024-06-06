import 'package:flutter/material.dart';
import 'package:decla/pages/home.dart';

class DeclutterCloset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Declutter Closet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

void navigateToHome(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
    (Route<dynamic> route) => false,
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> items = [
    {'image': 'assets/images/top.png', 'label': 'Nice skirt 1'},
    {'image': 'assets/images/skirt.png', 'label': 'Nice skirt 2'},
    {'image': 'assets/images/skirt.png', 'label': 'Nice top 1'},
    {'image': 'assets/images/shoes.png', 'label': 'blue shoes'},
    {'image': 'assets/images/skirt.png', 'label': 'Pink shoes'},
    {'image': 'assets/images/top.png', 'label': 'Pink shoes'},
    {'image': 'assets/images/skirt.png', 'label': 'Pink shoes'},
    {'image': 'assets/images/top.png', 'label': 'Pink shoes'},
  ];

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  String _selectedChip = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            navigateToHome(
                context); // Navigate back to the home screen using the navigateToHome function
          },
        ),
        title: Text("Items you don\'t use"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All'),
                  SizedBox(width: 8),
                  _buildFilterChip('top'),
                  SizedBox(width: 8),
                  _buildFilterChip('bottom'),
                  SizedBox(width: 8),
                  _buildFilterChip('shoes'),
                  SizedBox(width: 8),
                  // Add more FilterChips as needed
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        4.0), // Match the Card's border radius if any
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(176, 176, 176, 0.2),
                        spreadRadius: -6,
                        blurRadius: 10,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                            width: 80,
                            child: Image.asset(
                              items[index]['image']!,
                              fit: BoxFit.cover,
                            )),
                        title: Text(items[index]['label']!),
                        trailing: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                8.0), // Set border radius for the container
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(176, 176, 176, 1),
                                spreadRadius: -6,
                                blurRadius: 15,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(255, 120, 120, 1),
                                Color.fromRGBO(255, 46, 46, 1)
                              ], // Set gradient colors
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.delete_outline,
                                color: Colors
                                    .white), // Set white color for the icon
                            onPressed: () => _deleteItem(index),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 0,
            blurRadius: 8,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: _selectedChip == label ? Colors.white : Colors.black,
          ),
        ),
        selected: _selectedChip == label,
        onSelected: (selected) {
          setState(() {
            _selectedChip = selected ? label : '';
          });
        },
        selectedColor: Color.fromRGBO(0, 219, 146, 1),
        backgroundColor: Colors.white,
        checkmarkColor: Colors.white,
        side: BorderSide
            .none, // Optional: makes the checkmark more visible on green background
      ),
    );
  }
}
