import 'package:flutter/material.dart';

class SidebarNavigation extends StatelessWidget {
  const SidebarNavigation({super.key});

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
            Builder(builder: (context) {
              return DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 102,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color.fromARGB(255, 37, 37, 37),
                                  width: 3,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Sofia Nardi',
                              style: TextStyle(
                                color: Color.fromRGBO(39, 39, 39, 1),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            Container(
              child: Column(
                children: [
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
