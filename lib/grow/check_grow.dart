import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../dash/dashboard.dart';
import '../grow/create_grow.dart';

class CheckGrowScreen extends StatefulWidget {
  @override
  _CheckGrowScreenState createState() => _CheckGrowScreenState();
}

class _CheckGrowScreenState extends State<CheckGrowScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkGrow();
  }

  Future<void> _checkGrow() async {
    final response = await http.get(Uri.parse('http://localhost:7891/grows'));
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CreateGrow()),
        );
      }
    } else {
      print('Failed to load grows');
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mushroom Monitor'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text('Checking your grows...'),
      ),
    );
  }
}
