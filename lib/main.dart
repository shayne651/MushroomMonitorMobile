import 'package:flutter/material.dart';
import 'package:mushroom_monitor_mobile/menu/Menu.dart';
import 'grow/check_grow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
           title: Text("Mushroom Monitor"),
          ),
          body: CheckGrowScreen(),
          drawer: Menu(),
      )
    );
  }
}