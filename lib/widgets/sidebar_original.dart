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
                decoration: const BoxDecoration(
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
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
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
                        child: const Icon(
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
                    title: const Text('Terms os use'),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
