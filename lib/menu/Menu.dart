import 'package:flutter/material.dart';
import 'package:mushroom_monitor_mobile/dash/dashboard.dart';
import 'package:mushroom_monitor_mobile/grow/create_grow.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Mushroom Monitor'),
          ),
          ListTile(
            title: Text("Dashboard"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
            },
          ),
          ListTile(
            title: Text("Create New Grow"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CreateGrow()),
              );
            },
          ),
          ListTile(
            title: Text("Create New Mushroom"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CreateGrow()),
              );
            },
          ),
          ListTile(
            title: Text("Create New Stage"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CreateGrow()),
              );
            },
          ),
          ListTile(
            title: Text("View Automation Devices"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CreateGrow()),
              );
            },
          ),
        ],
      ),
    );
  }
}
