import 'package:flutter/material.dart';
import 'package:decla/widgets/bottom_navigation.dart';
import 'package:decla/pages/chosen_outfit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(OutfitGenerator());
}

class OutfitGenerator extends StatelessWidget {
  const OutfitGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: OutfitList(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class OutfitList extends StatefulWidget {
  @override
  _OutfitListState createState() => _OutfitListState();
}

class _OutfitListState extends State<OutfitList> {
  late Future<List<String>> upperImages;
  late Future<List<String>> lowerImages;
  late Future<List<String>> footwearImages;

  int upperIndex = 0;
  int lowerIndex = 0;
  int footwearIndex = 0;

  @override
  void initState() {
    super.initState();
    upperImages = _loadImages('upper');
    lowerImages = _loadImages('lower');
    footwearImages = _loadImages('footwear');
  }

  Future<List<String>> _loadImages(String category) async {
    List<String> imageUrls = [];
    final ListResult result =
        await FirebaseStorage.instance.ref('images/$category').listAll();
    final List<Reference> allFiles = result.items;

    for (Reference file in allFiles) {
      final String downloadURL = await file.getDownloadURL();
      imageUrls.add(downloadURL);
    }
    return imageUrls;
  }

  void _rotateImage(String category, int length) {
    setState(() {
      switch (category) {
        case 'upper':
          upperIndex = (upperIndex + 1) % length;
          break;
        case 'lower':
          lowerIndex = (lowerIndex + 1) % length;
          break;
        case 'footwear':
          footwearIndex = (footwearIndex + 1) % length;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([upperImages, lowerImages, footwearImages]),
      builder: (context, AsyncSnapshot<List<List<String>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading images'));
        } else {
          final upperImages = snapshot.data![0];
          final lowerImages = snapshot.data![1];
          final footwearImages = snapshot.data![2];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutfitItem(
                imageUrl: upperImages[upperIndex],
                onRotate: () => _rotateImage('upper', upperImages.length),
              ),
              const SizedBox(height: 20), // Add space between items
              OutfitItem(
                imageUrl: lowerImages[lowerIndex],
                onRotate: () => _rotateImage('lower', lowerImages.length),
              ),
              const SizedBox(height: 20), // Add space between items
              OutfitItem(
                imageUrl: footwearImages[footwearIndex],
                onRotate: () => _rotateImage('footwear', footwearImages.length),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(95, 0, 250, 1)
                                .withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 15,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Set your desired border radius
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(95, 0, 250, 1),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
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
                          color: const Color.fromRGBO(255, 46, 46, 1)
                              .withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 15,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChosenOutfit()),
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // Set your desired border radius
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(255, 46, 46, 1),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(20),
                        ),
                      ),
                      child: const Icon(Icons.favorite, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}

class OutfitItem extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onRotate;

  const OutfitItem({super.key, required this.imageUrl, required this.onRotate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                offset: const Offset(0, 0),
              ),
            ],
          ),
          margin: const EdgeInsets.only(right: 15),
          child: ElevatedButton(
            onPressed: onRotate,
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
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color.fromRGBO(183, 183, 183, 1), width: 2),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(10, 0, 0, 0).withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 15,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



///////////////////////////////////////////////////////////////////////////////
///
///import 'package:flutter/material.dart';
// import 'package:decla/widgets/bottom_navigation.dart';
// import 'package:decla/pages/chosen_outfit.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(OutfitGenerator());
// }

// class OutfitGenerator extends StatelessWidget {
//   const OutfitGenerator({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context); // Go back to the previous page
//             },
//           ),
//           title: const Text('Your Outfit'),
//           centerTitle: true,
//         ),
//         body: OutfitList(),
//         bottomNavigationBar: const BottomNavigation(),
//       ),
//     );
//   }
// }

// class OutfitList extends StatefulWidget {
//   @override
//   _OutfitListState createState() => _OutfitListState();
// }

// class _OutfitListState extends State<OutfitList> {
//   late Future<List<String>> upperImages;
//   late Future<List<String>> lowerImages;
//   late Future<List<String>> footwearImages;

//   int upperIndex = 0;
//   int lowerIndex = 0;
//   int footwearIndex = 0;

//   Map<String, int> imagePoints = {};

//   @override
//   void initState() {
//     super.initState();
//     upperImages = _loadImages('upper');
//     lowerImages = _loadImages('lower');
//     footwearImages = _loadImages('footwear');
//   }

//   Future<List<String>> _loadImages(String category) async {
//     List<String> imageUrls = [];
//     final ListResult result =
//         await FirebaseStorage.instance.ref('images/$category').listAll();
//     final List<Reference> allFiles = result.items;

//     for (Reference file in allFiles) {
//       final String downloadURL = await file.getDownloadURL();
//       imageUrls.add(downloadURL);
//       imagePoints[downloadURL] = 0; // Initialize points for each image
//     }
//     return imageUrls;
//   }

//   void _rotateImage(String category, int length) {
//     setState(() {
//       switch (category) {
//         case 'upper':
//           upperIndex = (upperIndex + 1) % length;
//           break;
//         case 'lower':
//           lowerIndex = (lowerIndex + 1) % length;
//           break;
//         case 'footwear':
//           footwearIndex = (footwearIndex + 1) % length;
//           break;
//       }
//     });
//   }

//   void _decreasePoints(String imageUrl) {
//     setState(() {
//       imagePoints[imageUrl] = (imagePoints[imageUrl] ?? 0) - 1;
//     });
//   }

//   void _increasePoints(String imageUrl) {
//     setState(() {
//       imagePoints[imageUrl] = (imagePoints[imageUrl] ?? 0) + 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Future.wait([upperImages, lowerImages, footwearImages]),
//       builder: (context, AsyncSnapshot<List<List<String>>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error loading images'));
//         } else {
//           final upperImages = snapshot.data![0];
//           final lowerImages = snapshot.data![1];
//           final footwearImages = snapshot.data![2];

//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               OutfitItem(
//                 imageUrl: upperImages[upperIndex],
//                 points: imagePoints[upperImages[upperIndex]] ?? 0,
//                 onRotate: () {
//                   _rotateImage('upper', upperImages.length);
//                   _decreasePoints(upperImages[upperIndex]);
//                 },
//                 onLike: () {
//                   _increasePoints(upperImages[upperIndex]);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const ChosenOutfit()),
//                   );
//                 },
//               ),
//               const SizedBox(height: 20), // Add space between items
//               OutfitItem(
//                 imageUrl: lowerImages[lowerIndex],
//                 points: imagePoints[lowerImages[lowerIndex]] ?? 0,
//                 onRotate: () {
//                   _rotateImage('lower', lowerImages.length);
//                   _decreasePoints(lowerImages[lowerIndex]);
//                 },
//                 onLike: () {
//                   _increasePoints(lowerImages[lowerIndex]);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const ChosenOutfit()),
//                   );
//                 },
//               ),
//               const SizedBox(height: 20), // Add space between items
//               OutfitItem(
//                 imageUrl: footwearImages[footwearIndex],
//                 points: imagePoints[footwearImages[footwearIndex]] ?? 0,
//                 onRotate: () {
//                   _rotateImage('footwear', footwearImages.length);
//                   _decreasePoints(footwearImages[footwearIndex]);
//                 },
//                 onLike: () {
//                   _increasePoints(footwearImages[footwearIndex]);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const ChosenOutfit()),
//                   );
//                 },
//               ),
//               const SizedBox(height: 20),
//             ],
//           );
//         }
//       },
//     );
//   }
// }

// class OutfitItem extends StatelessWidget {
//   final String imageUrl;
//   final int points;
//   final VoidCallback onRotate;
//   final VoidCallback onLike;

//   const OutfitItem({
//     super.key,
//     required this.imageUrl,
//     required this.points,
//     required this.onRotate,
//     required this.onLike,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(100),
//             border: Border.all(
//               color: const Color.fromRGBO(183, 183, 183, 1),
//               width: 0.5,
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color.fromARGB(10, 0, 0, 0).withOpacity(0.1),
//                 spreadRadius: 0,
//                 blurRadius: 15,
//                 offset: const Offset(0, 0),
//               ),
//             ],
//           ),
//           margin: const EdgeInsets.only(right: 15),
//           child: ElevatedButton(
//             onPressed: onRotate,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.white,
//               shape: const CircleBorder(),
//               padding: const EdgeInsets.all(20),
//             ),
//             child: const Icon(Icons.rotate_right, color: Colors.black),
//           ),
//         ),
//         Container(
//           width: 120,
//           height: 120,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(imageUrl),
//               fit: BoxFit.cover,
//             ),
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(
//                 color: const Color.fromRGBO(183, 183, 183, 1), width: 2),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color.fromARGB(10, 0, 0, 0).withOpacity(0.1),
//                 spreadRadius: 0,
//                 blurRadius: 15,
//                 offset: const Offset(0, 0),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(width: 10),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Points: $points'),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: onLike,
//               style: ElevatedButton.styleFrom(
//                 shape: CircleBorder(),
//                 padding: EdgeInsets.all(15),
//                 primary: Colors.red, // Button color
//               ),
//               child: const Icon(Icons.favorite, color: Colors.white),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

