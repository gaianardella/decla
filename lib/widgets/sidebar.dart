// import 'package:flutter/material.dart';

// class SidebarNavigation extends StatefulWidget {
//   const SidebarNavigation({super.key});

//   @override
//   _SidebarNavigationState createState() => _SidebarNavigationState();
// }

// class _SidebarNavigationState extends State<SidebarNavigation> {
//   bool _isEditingProfile = false;
//   String _selectedSex = 'Male'; // Define _selectedSex as a field

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromRGBO(172, 124, 250, 1),
//               Color.fromRGBO(158, 118, 246, 1),
//               Color.fromRGBO(96, 55, 201, 1),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             const SizedBox(height: 25), // Add space at the top
//             Stack(
//               children: [
//                 Positioned(
//                   top: 0,
//                   right: 0,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Icon(
//                       Icons.close,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 25),
//                     if (_isEditingProfile)
//                       const Text(
//                         'Profile Editing',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                       ),
//                     const SizedBox(height: 10),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _isEditingProfile = !_isEditingProfile;
//                         });
//                       },
//                       child: Column(
//                         children: [
//                           if (_isEditingProfile)
//                             Center(
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     height: 102,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: const Color.fromARGB(
//                                             255, 37, 37, 37),
//                                         width: 3,
//                                       ),
//                                     ),
//                                     child: const CircleAvatar(
//                                       radius: 50,
//                                       backgroundImage: AssetImage(
//                                           'assets/images/avatar.png'),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 10),
//                                   const Text(
//                                     'Edit',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   const Divider(color: Colors.white, thickness: 1),
//                                 ],
//                               ),
//                             )
//                           else
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   height: 102,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     border: Border.all(
//                                       color:
//                                           const Color.fromARGB(255, 37, 37, 37),
//                                       width: 3,
//                                     ),
//                                   ),
//                                   child: const CircleAvatar(
//                                     radius: 50,
//                                     backgroundImage:
//                                         AssetImage('assets/images/avatar.png'),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 10),
//                                 const Text(
//                                   'Sofia Nardi',
//                                   style: TextStyle(
//                                     // color: Color.fromRGBO(39, 39, 39, 1),
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           if (_isEditingProfile) ...[
//                             const SizedBox(height: 10),
//                             Center(
//                               child: Column(
//                                 // crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Full name:',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                       height:
//                                           8), // Add some space between the text and the form field
//                                   Container(
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.6,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 8.0),
//                                       child: TextFormField(
//                                         // Your form field widget goes here
//                                         decoration: const InputDecoration(
//                                           hintText: 'Enter your full name',
//                                           hintStyle:
//                                               TextStyle(color: Colors.grey),
//                                           border: InputBorder.none,
//                                         ),
//                                         style: const TextStyle(color: Colors.black),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),
//                                   const Text(
//                                     'Sex:',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 10),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Radio<String>(
//                                         value: 'Male',
//                                         groupValue: _selectedSex,
//                                         onChanged: (String? value) {
//                                           setState(() {
//                                             _selectedSex = value!;
//                                           });
//                                         },
//                                         activeColor: Colors.white,
//                                       ),
//                                       const Text(
//                                         'Male',
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       const SizedBox(width: 20),
//                                       Radio<String>(
//                                         value: 'Female',
//                                         groupValue: _selectedSex,
//                                         onChanged: (String? value) {
//                                           setState(() {
//                                             _selectedSex = value!;
//                                           });
//                                         },
//                                         activeColor: Colors.white,
//                                       ),
//                                       const Text(
//                                         'Female',
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             if (!_isEditingProfile) ...[
//               // Other list tiles here
//               const SizedBox(height: 10),
//               const Divider(color: Colors.white, thickness: 1),
//               ListTile(
//                 iconColor: Colors.white,
//                 textColor: Colors.white,
//                 leading: const Icon(Icons.notification_add),
//                 title: const Text('Push Notification'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 iconColor: Colors.white,
//                 textColor: Colors.white,
//                 leading: const Icon(Icons.language),
//                 title: const Text('Language'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 iconColor: Colors.white,
//                 textColor: Colors.white,
//                 leading: const Icon(Icons.help),
//                 title: const Text('Help'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 iconColor: Colors.white,
//                 textColor: Colors.white,
//                 leading: const Icon(Icons.rule),
//                 title: const Text('Terms os use'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 iconColor: Colors.white,
//                 textColor: Colors.white,
//                 leading: const Icon(Icons.policy),
//                 title: const Text('Privacy Policy'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 iconColor: Colors.white,
//                 textColor: Colors.white,
//                 leading: const Icon(Icons.verified),
//                 title: const Text('Version'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 iconColor: Colors.red,
//                 textColor: Colors.red,
//                 leading: const Icon(Icons.logout),
//                 title: const Text('Logout'),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               const SizedBox(height: 10),
//               const Divider(color: Colors.white, thickness: 1),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SidebarNavigation extends StatefulWidget {
  const SidebarNavigation({Key? key}) : super(key: key);

  @override
  _SidebarNavigationState createState() => _SidebarNavigationState();
}

class _SidebarNavigationState extends State<SidebarNavigation> {
  bool _isEditingProfile = false;
  String _selectedSex = 'Male'; // Define _selectedSex as a field
  bool _isChangesConfirmed = false; // Track if changes are confirmed

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(172, 124, 250, 1),
              Color.fromRGBO(158, 118, 246, 1),
              Color.fromRGBO(96, 55, 201, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(height: 25), // Add space at the top
            Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),
                    if (_isEditingProfile)
                      const Text(
                        'Profile Editing',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isEditingProfile = !_isEditingProfile;
                          _isChangesConfirmed = false; // Reset confirmation
                        });
                      },
                      child: Column(
                        children: [
                          if (_isEditingProfile)
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    height: 102,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 37, 37, 37),
                                        width: 3,
                                      ),
                                    ),
                                    child: const CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                          'assets/images/avatar.png'),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Divider(
                                      color: Colors.white, thickness: 1),
                                ],
                              ),
                            )
                          else
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 102,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 37, 37, 37),
                                      width: 3,
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        AssetImage('assets/images/avatar.png'),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Sofia Nardi',
                                  style: TextStyle(
                                    // color: Color.fromRGBO(39, 39, 39, 1),
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          if (_isEditingProfile) ...[
                            const SizedBox(height: 10),
                            Center(
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Full name:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          8), // Add some space between the text and the form field
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: TextFormField(
                                        // Your form field widget goes here
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your full name',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Sex:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Radio<String>(
                                        value: 'Male',
                                        groupValue: _selectedSex,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _selectedSex = value!;
                                          });
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
                                        'Male',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      const SizedBox(width: 20),
                                      Radio<String>(
                                        value: 'Female',
                                        groupValue: _selectedSex,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _selectedSex = value!;
                                          });
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
                                        'Female',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isChangesConfirmed = true;
                                });
                              },
                              child: const Text('Confirm Changes'),
                            ),
                            if (_isChangesConfirmed)
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Changes confirmed!',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (!_isEditingProfile) ...[
              // Other list tiles here
              const SizedBox(height: 10),
              const Divider(color: Colors.white, thickness: 1),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(Icons.notification_add),
                title: const Text('Push Notification'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(Icons.help),
                title: const Text('Help'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(Icons.rule),
                title: const Text('Terms of Use'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(Icons.policy),
                title: const Text('Privacy Policy'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(Icons.verified),
                title: const Text('Version'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.red,
                textColor: Colors.red,
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.white, thickness: 1),
            ],
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sidebar Navigation Example'),
        ),
        drawer: SidebarNavigation(),
        body: const Center(
          child: Text('Main Content'),
        ),
      ),
    ),
  );
}
