import 'package:decla/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Declutter Closet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DeclutterCloset(),
    );
  }
}

class DeclutterCloset extends StatelessWidget {
  const DeclutterCloset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Declutter Closet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

void navigateToHome(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const HomeScreen()),
    (Route<dynamic> route) => false,
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Map<String, String>>> itemsFuture;
  List<Map<String, String>> items = [];

  @override
  void initState() {
    super.initState();
    // Initialize to fetch all items initially
    itemsFuture = fetchAllItems();
  }

  Future<List<Map<String, String>>> fetchAllItems() async {
    List<Map<String, String>> fetchedItems = [];

    try {
      final ListResult resultUpper =
          await FirebaseStorage.instance.ref('images/upper').list();
      final ListResult resultLower =
          await FirebaseStorage.instance.ref('images/lower').list();
      final ListResult resultFootwear =
          await FirebaseStorage.instance.ref('images/footwear').list();

      fetchedItems.addAll(await _fetchItemsFromResult(resultUpper, 'upper'));
      fetchedItems.addAll(await _fetchItemsFromResult(resultLower, 'lower'));
      fetchedItems
          .addAll(await _fetchItemsFromResult(resultFootwear, 'footwear'));
    } catch (e) {
      print('Error fetching items from Firebase Storage: $e');
    }

    return fetchedItems;
  }

  Future<List<Map<String, String>>> _fetchItemsFromResult(
      ListResult result, String category) async {
    List<Map<String, String>> fetchedItems = [];

    for (Reference ref in result.items) {
      try {
        final String downloadURL = await ref.getDownloadURL();
        String fileName = ref.name.split('/').last;
        String label =
            fileName.split('_').first; // Extract label from file name
        fetchedItems.add({
          'fullPath': ref.fullPath, // Store full path for deletion
          'image': downloadURL,
          'label': label,
          'category': category, // Store category for filtering
        });
      } catch (e) {
        print('Error fetching item: $e');
      }
    }

    return fetchedItems;
  }

  void _deleteItem(int index) async {
    final String fullPath = items[index]['fullPath']!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                try {
                  final Reference itemRef =
                      FirebaseStorage.instance.ref().child(fullPath);
                  await itemRef.delete();
                  Navigator.of(context).pop();
                  setState(() {
                    items.removeAt(index);
                  });
                } catch (e) {
                  print("Error deleting item: $e");
                  // Handle deletion error (e.g., show error message)
                }
              },
            ),
          ],
        );
      },
    );
  }

  String _selectedChip = 'All';

  void _filterItems(String category) {
    setState(() {
      _selectedChip = category;
      if (category == 'All') {
        itemsFuture = fetchAllItems(); // Refresh all items
      } else {
        itemsFuture = fetchItemsByCategory(category);
      }
    });
  }

  Future<List<Map<String, String>>> fetchItemsByCategory(
      String category) async {
    List<Map<String, String>> filteredItems =
        items.where((item) => item['category'] == category).toList();
    return filteredItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text("Items you don't use"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All'),
                  const SizedBox(width: 8),
                  _buildFilterChip('upper'),
                  const SizedBox(width: 8),
                  _buildFilterChip('lower'),
                  const SizedBox(width: 8),
                  _buildFilterChip('footwear'),
                  const SizedBox(width: 8),
                  // Add more FilterChips as needed
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, String>>>(
              future: itemsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  items = snapshot.data!; // Update items with fetched data
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(176, 176, 176, 0.2),
                              spreadRadius: -6,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Center(
                            child: ListTile(
                              leading: SizedBox(
                                width: 80,
                                child: Image.network(
                                  items[index]['image']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(items[index]['label']!),
                              trailing: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(176, 176, 176, 1),
                                      spreadRadius: -6,
                                      blurRadius: 15,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromRGBO(255, 120, 120, 1),
                                      Color.fromRGBO(255, 46, 46, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.delete_outline,
                                      color: Colors.white),
                                  onPressed: () => _deleteItem(index),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
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
            offset: const Offset(0, 0),
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
          _filterItems(selected ? label : 'All');
        },
        selectedColor: const Color.fromRGBO(0, 219, 146, 1),
        backgroundColor: Colors.white,
        checkmarkColor: Colors.white,
        side: BorderSide.none,
      ),
    );
  }
}
