import 'dart:math';
import 'package:flutter/material.dart';
import 'package:decla/pages/chosen_outfit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const OutfitGenerator());
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
        body: const OutfitList(),
        // bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class OutfitList extends StatefulWidget {
  const OutfitList({super.key});

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

  void _rotateAllImages(List<String> upperImages, List<String> lowerImages,
      List<String> footwearImages) {
    final random = Random();
    setState(() {
      upperIndex = random.nextInt(upperImages.length);
      lowerIndex = random.nextInt(lowerImages.length);
      footwearIndex = random.nextInt(footwearImages.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([upperImages, lowerImages, footwearImages]),
      builder: (context, AsyncSnapshot<List<List<String>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading images'));
        } else if (!snapshot.hasData ||
            snapshot.data!.any((list) => list.isEmpty)) {
          return const Center(child: Text('No images available'));
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
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () => _rotateAllImages(
                          upperImages, lowerImages, footwearImages),
                      style: ButtonStyle(
                        shape:
                            WidgetStateProperty.all<RoundedRectangleBorder>(
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
                    ),
                  ),
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
                            builder: (context) => ChosenOutfit(
                              upperImage: upperImages[upperIndex],
                              lowerImage: lowerImages[lowerIndex],
                              footwearImage: footwearImages[footwearIndex],
                            ),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        shape:
                            WidgetStateProperty.all<RoundedRectangleBorder>(
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
