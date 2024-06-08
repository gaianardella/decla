import 'package:flutter/material.dart';

class SidebarNavigation extends StatefulWidget {
  const SidebarNavigation({Key? key}) : super(key: key);

  @override
  _SidebarNavigationState createState() => _SidebarNavigationState();
}

class _SidebarNavigationState extends State<SidebarNavigation> {
  bool _isEditingProfile = false;
  String _selectedSex = 'Male'; // Define _selectedSex as a field

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
            SizedBox(height: 25), // Add space at the top
            Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 25),
                    if (_isEditingProfile)
                      Text(
                        'Profile Editing',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isEditingProfile = !_isEditingProfile;
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
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                          'assets/images/avatar.png'),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Divider(color: Colors.white, thickness: 1),
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
                                    backgroundImage:
                                        AssetImage('assets/images/avatar.png'),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
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
                            SizedBox(height: 10),
                            Center(
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Full name:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
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
                                        decoration: InputDecoration(
                                          hintText: 'Enter your full name',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'Sex:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 10),
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
                                      Text(
                                        'Male',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(width: 20),
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
                                      Text(
                                        'Female',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
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
              SizedBox(height: 10),
              Divider(color: Colors.white, thickness: 1),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: Icon(Icons.notification_add),
                title: Text('Push Notification'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: Icon(Icons.language),
                title: Text('Language'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: Icon(Icons.help),
                title: Text('Help'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: Icon(Icons.rule),
                title: Text('Terms os use'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: Icon(Icons.policy),
                title: Text('Privacy Policy'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: Icon(Icons.verified),
                title: Text('Version'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                iconColor: Colors.red,
                textColor: Colors.red,
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 10),
              Divider(color: Colors.white, thickness: 1),
            ],
          ],
        ),
      ),
    );
  }
}
