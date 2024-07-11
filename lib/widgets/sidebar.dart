import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:decla/pages/login_page.dart';

class SidebarNavigation extends StatefulWidget {
  const SidebarNavigation({Key? key}) : super(key: key);

  @override
  _SidebarNavigationState createState() => _SidebarNavigationState();
}

class _SidebarNavigationState extends State<SidebarNavigation> {
  bool _isEditingProfile = false;
  String _selectedSex = 'Male'; // Define _selectedSex as a field
  bool _isChangesConfirmed = false; // Track if changes are confirmed
  User? _currentUser; // Track the current user
  TextEditingController _nameController = TextEditingController();
  File? _image; // Track the selected image file
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
    _nameController.text = _currentUser?.displayName ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _saveProfileChanges() async {
    String newName = _nameController.text.trim();
    if (newName.isEmpty) {
      // Handle empty name input if needed
      return;
    }

    try {
      // Update display name
      await _currentUser?.updateDisplayName(newName);

      // Update profile picture if a new image was selected
      if (_image != null) {
        String fileName = path.basename(_image!.path);
        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child('profile_images/$fileName');
        await firebaseStorageRef.putFile(_image!);
        String downloadURL = await firebaseStorageRef.getDownloadURL();
        await _currentUser?.updatePhotoURL(downloadURL);
      }

      await _currentUser?.reload();
      _currentUser = FirebaseAuth.instance.currentUser;

      if (mounted) {
        setState(() {
          _isChangesConfirmed = true;
          _isEditingProfile = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
      }
    } catch (e) {
      print('Error updating profile: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: $e')),
        );
      }
    }
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
                          _nameController.text =
                              _currentUser?.displayName ?? '';
                          _image = null; // Reset selected image
                        });
                      },
                      child: Column(
                        children: [
                          if (_isEditingProfile)
                            Center(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: _getImageFromGallery,
                                    child: Container(
                                      height: 102,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 37, 37, 37),
                                          width: 3,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: _image != null
                                            ? FileImage(_image!)
                                            : _currentUser?.photoURL != null
                                                ? NetworkImage(
                                                    _currentUser!.photoURL!)
                                                : AssetImage(
                                                        'assets/images/avatar.png')
                                                    as ImageProvider,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
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
                                        controller: _nameController,
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
                                  ElevatedButton(
                                    onPressed: _saveProfileChanges,
                                    child: const Text('Save Changes'),
                                  ),
                                  if (_isChangesConfirmed)
                                    const Padding(
                                      padding: EdgeInsets.all(16.0),
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
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: _currentUser?.photoURL !=
                                            null
                                        ? NetworkImage(_currentUser!.photoURL!)
                                        : AssetImage('assets/images/avatar.png')
                                            as ImageProvider,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  _currentUser?.displayName ?? 'Sofia Nardi',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
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
                  _logout(context);
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

  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    } catch (e) {
      print("Error logging out: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to log out: $e')),
        );
      }
    }
  }
}
