// import 'package:flutter/material.dart';
// import 'package:decla/pages/home.dart';
// import 'package:decla/pages/add_item.dart';

// class ManageCloset extends StatelessWidget {
//   const ManageCloset({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Manage Closet',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }

// void navigateToHome(BuildContext context) {
//   Navigator.pushAndRemoveUntil(
//     context,
//     MaterialPageRoute(builder: (context) => const HomePage()),
//     (Route<dynamic> route) => false,
//   );
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final List<Map<String, String>> items = [
//     {'image': 'assets/images/top.png', 'label': 'Nice skirt 1'},
//     {'image': 'assets/images/skirt.png', 'label': 'Nice skirt 2'},
//     {'image': 'assets/images/skirt.png', 'label': 'Nice top 1'},
//     {'image': 'assets/images/shoes.png', 'label': 'blue shoes'},
//     {'image': 'assets/images/skirt.png', 'label': 'Pink shoes'},
//     {'image': 'assets/images/top.png', 'label': 'Pink shoes'},
//     {'image': 'assets/images/skirt.png', 'label': 'Pink shoes'},
//     {'image': 'assets/images/top.png', 'label': 'Pink shoes'},
//   ];

//   void _deleteItem(int index) {
//     setState(() {
//       items.removeAt(index);
//     });
//   }

//   String _selectedChip = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             navigateToHome(
//                 context); // Navigate back to the home screen using the navigateToHome function
//           },
//         ),
//         title: const Text('Your Outfit'),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   _buildFilterChip('All'),
//                   const SizedBox(width: 8),
//                   _buildFilterChip('top'),
//                   const SizedBox(width: 8),
//                   _buildFilterChip('bottom'),
//                   const SizedBox(width: 8),
//                   _buildFilterChip('shoes'),
//                   const SizedBox(width: 8),
//                   // Add more FilterChips as needed
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   height: 120,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                         4.0), // Match the Card's border radius if any
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color.fromRGBO(176, 176, 176, 0.2),
//                         spreadRadius: -6,
//                         blurRadius: 10,
//                         offset: Offset(0, 0), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Card(
//                     color: Colors.white,
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 8.0, horizontal: 16.0),
//                     child: Center(
//                       child: ListTile(
//                         leading: SizedBox(
//                             width: 80,
//                             child: Image.asset(
//                               items[index]['image']!,
//                               fit: BoxFit.cover,
//                             )),
//                         title: Text(items[index]['label']!),
//                         trailing: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(
//                                 8.0), // Set border radius for the container
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Color.fromRGBO(176, 176, 176, 1),
//                                 spreadRadius: -6,
//                                 blurRadius: 15,
//                                 offset:
//                                     Offset(0, 0), // changes position of shadow
//                               ),
//                             ],
//                             gradient: const LinearGradient(
//                               colors: [
//                                 Color.fromRGBO(255, 120, 120, 1),
//                                 Color.fromRGBO(255, 46, 46, 1)
//                               ], // Set gradient colors
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                           ),
//                           child: IconButton(
//                             icon: const Icon(Icons.delete_outline,
//                                 color: Colors
//                                     .white), // Set white color for the icon
//                             onPressed: () => _deleteItem(index),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SizedBox(
//               width: double.infinity, // Set the desired width
//               height: 50, // Set the desired height
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AddItem()),
//                   );
//                 },
//                 icon: const Icon(Icons.add),
//                 label: const Text(
//                   'Add More Items',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromRGBO(58, 0, 207, 1),
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius:
//                         BorderRadius.circular(8.0), // Set border radius
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFilterChip(String label) {
//     return Container(
//       height: 40,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             spreadRadius: 0,
//             blurRadius: 8,
//             offset: const Offset(0, 0), // changes position of shadow
//           ),
//         ],
//       ),
//       child: FilterChip(
//         label: Text(
//           label,
//           style: TextStyle(
//             color: _selectedChip == label ? Colors.white : Colors.black,
//           ),
//         ),
//         selected: _selectedChip == label,
//         onSelected: (selected) {
//           setState(() {
//             _selectedChip = selected ? label : '';
//           });
//         },
//         selectedColor: const Color.fromRGBO(0, 219, 146, 1),
//         backgroundColor: Colors.white,
//         checkmarkColor: Colors.white,
//         side: BorderSide
//             .none, // Optional: makes the checkmark more visible on green background
//       ),
//     );
//   }
// }
////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:decla/pages/home.dart';
import 'package:decla/pages/add_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Declutter Closet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ManageCloset(),
    );
  }
}

class ManageCloset extends StatelessWidget {
  const ManageCloset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manage Closet',
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
    MaterialPageRoute(builder: (context) => const HomePage()),
    (Route<dynamic> route) => false,
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Map<String, String>>> itemsFuture;

  List<Map<String, String>> items = []; // List to hold fetched items

  @override
  void initState() {
    super.initState();
    // Initialize future to fetch all items
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

    for (Reference file in result.items) {
      try {
        final String downloadURL = await file.getDownloadURL();
        String fileName = file.name.split('/').last;
        // Assuming your file names are structured like 'label_image.png'
        String label =
            fileName.split('_').first; // Extract label from file name
        fetchedItems.add({
          'fullPath': file.fullPath, // Store full path for deletion
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
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
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
            navigateToHome(
                context); // Navigate back to the home screen using the navigateToHome function
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
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No items found.'));
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity, // Set the desired width
              height: 50, // Set the desired height
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddItem()),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text(
                  'Add More Items',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(58, 0, 207, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ),
                ),
              ),
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
            offset: const Offset(0, 0), // changes position of shadow
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
        selectedColor: const Color.fromRGBO(0, 219, 146, 1),
        backgroundColor: Colors.white,
        checkmarkColor: Colors.white,
        side: BorderSide
            .none, // Optional: makes the checkmark more visible on green background
      ),
    );
  }
}
