import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child:ListView(
        children:[
          DrawerHeader(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage("https://i.pinimg.com/1200x/c9/19/2e/c9192eb573b0b721c5a0bab6def82fbf.jpg"),
                ),
              SizedBox(height: 10),
              Text(
                'Testing User',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
              ),
            ],
          )),
          ListTile(
            leading: Icon(Icons.home, color: const Color.fromARGB(255, 55, 54, 54)),
            title: Text('Home', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              context.go('/home'); // Navigate to Home
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: const Color.fromARGB(255, 55, 54, 54)),
            title: Text('Profile', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
            onTap: () {
              Navigator.pop(context); 
              context.go('/profile'); // Navigate to Login
            },
          ),
        ]
      )
    ) ;
  }
}