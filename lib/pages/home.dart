// import 'package:decla/pages/outfit_generator.dart';
// import 'package:decla/pages/manage_closet.dart';
// import 'package:decla/pages/declutter_closet.dart';
// import 'package:flutter/material.dart';
// import 'package:decla/widgets/sidebar.dart';
// import 'package:decla/widgets/bottom_navigation.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
//       appBar: AppBar(
//         title: const Text(
//           'Home Page',
//           style: TextStyle(fontSize: 18),
//         ),
//         backgroundColor: const Color.fromRGBO(176, 222, 250, 1),
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               iconSize: 40,
//               icon: const Icon(Icons.menu),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//             );
//           },
//         ),
//       ),
//       drawer: const SidebarNavigation(),
//       body: _buildUI(context),
//       bottomNavigationBar: const BottomNavigation(),
//     );
//   }
// }

// Widget _buildUI(BuildContext context) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [_functionsButton(context)],
//   );
// }

// Widget _functionsButton(BuildContext context) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Container(
//         width: 360, // Adjust the size of the rectangle
//         height: 165,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10), // Add border radius
//         ),
//         child: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: const DecorationImage(
//                   image: AssetImage(
//                       'assets/images/outfit-generator.jpg'), // Add your background image
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.circular(10), // Add border radius
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 color: const Color.fromRGBO(247, 185, 43, 1)
//                     .withOpacity(0.8), // Add color overlay with opacity
//                 borderRadius:
//                     BorderRadius.circular(10), // Add same border radius
//               ),
//             ),
//             const Center(
//               child: Text(
//                 'Outfit Generator',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   shadows: [
//                     Shadow(
//                       blurRadius: 4.0,
//                       color: Color.fromARGB(50, 0, 0, 0),
//                       offset: Offset(0, 4.0),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Center(
//               child: InkWell(
//                 //A rectangular area of a Material that responds to touch.
//                 onTap: () {
//                   // Navigate to the OutfitGenerator function
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const OutfitGenerator()),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),

//       const SizedBox(height: 20), // Adjust the space between shapes
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: 170, // Adjust the size of the squares
//             height: 170,
//             child: Stack(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     image: const DecorationImage(
//                       image: AssetImage(
//                           'assets/images/manage.jpg'), // Add your background image
//                       fit: BoxFit.cover,
//                     ),
//                     borderRadius:
//                         BorderRadius.circular(10), // Add border radius
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: const Color.fromRGBO(151, 71, 255, 1)
//                         .withOpacity(0.8), // Add color overlay with opacity
//                     borderRadius:
//                         BorderRadius.circular(10), // Add same border radius
//                   ),
//                 ),
//                 const Center(
//                   child: Text(
//                     'Manage Closet',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       shadows: [
//                         Shadow(
//                           blurRadius: 4.0,
//                           color: Color.fromARGB(50, 0, 0, 0),
//                           offset: Offset(0, 4.0),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: InkWell(
//                     //A rectangular area of a Material that responds to touch.
//                     onTap: () {
//                       // Navigate to the OutfitGenerator function
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const ManageCloset()),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 20),
//           // Adjust the space between squares
//           GestureDetector(
//             onTap: () {
//               // Handle tap action here
//             },
//             child: SizedBox(
//               width: 170,
//               height: 170,
//               child: Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       image: const DecorationImage(
//                         image: AssetImage(
//                             'assets/images/stat.jpg'), // Add your background image
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius:
//                           BorderRadius.circular(10), // Add border radius
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: const Color.fromRGBO(64, 135, 237, 1)
//                           .withOpacity(0.8), // Add color overlay with opacity
//                       borderRadius:
//                           BorderRadius.circular(10), // Add same border radius
//                     ),
//                   ),
//                   const Center(
//                     child: Text(
//                       'Declutter Closet',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         shadows: [
//                           Shadow(
//                             blurRadius: 4.0,
//                             color: Color.fromARGB(50, 0, 0, 0),
//                             offset: Offset(0, 4.0),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: InkWell(
//                       //A rectangular area of a Material that responds to touch.
//                       onTap: () {
//                         // Navigate to the OutfitGenerator function
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const DeclutterCloset()),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ],
//   );
// }
////////////////////////////////////
import 'package:decla/pages/outfit_generator.dart';
import 'package:decla/pages/manage_closet.dart';
import 'package:decla/pages/declutter_closet.dart';
import 'package:flutter/material.dart';
import 'package:decla/widgets/sidebar.dart';
import 'package:decla/widgets/bottom_navigation.dart';

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
<<<<<<< HEAD
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
            Center(
              child: InkWell(
                //A rectangular area of a Material that responds to touch.
                onTap: () {
                  // Navigate to the OutfitGenerator function
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OutfitGenerator()),
                  );
                },
              ),
            ),
          ],
        ),
=======
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
>>>>>>> 255eff3006bd05907e23f2a71de8d62d4ebbf2e5
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
        Color.fromARGB(255, 51, 202, 74),
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
<<<<<<< HEAD
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
                    color: const Color.fromRGBO(151, 71, 255, 1)
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
                Center(
                  child: InkWell(
                    //A rectangular area of a Material that responds to touch.
                    onTap: () {
                      // Navigate to the OutfitGenerator function
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ManageCloset()),
                      );
                    },
                  ),
                ),
              ],
=======
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
>>>>>>> 255eff3006bd05907e23f2a71de8d62d4ebbf2e5
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
