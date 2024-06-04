import 'package:flutter/material.dart';

class ManageCloset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manage Closet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
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
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {},
        ),
        title: Text('Category', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
                  _buildFilterChip('bottom cloth'),
                  SizedBox(width: 8),
                  _buildFilterChip('shoes'),
                  SizedBox(width: 8),
                  _buildFilterChip('top'),
                  SizedBox(width: 8),
                  _buildFilterChip('bottom'),
                  // Add more FilterChips as needed
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: Image.asset(items[index]['image']!),
                    title: Text(items[index]['label']!),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteItem(index),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add More Items'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return FilterChip(
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
      selectedColor: Colors.green,
      backgroundColor: Colors.white,
      checkmarkColor: Colors
          .white, // Optional: makes the checkmark more visible on green background
    );
  }
}
