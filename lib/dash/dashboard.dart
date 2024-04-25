import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mushroom_monitor_mobile/menu/Menu.dart';
import 'package:mushroom_monitor_mobile/models/FullGrow.dart';
import 'package:http/http.dart' as http;

import '../grow/api_service.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _CreateDashState createState() => _CreateDashState();
}

class _CreateDashState extends State<DashboardScreen> {
  late Future<FullGrow> _fullGrowFuture;

  @override
  void initState() {
    super.initState();
    _fullGrowFuture = _fetchFullGrow("test");
  }

  Future<FullGrow> _fetchFullGrow(String name) async {
    final response =
        await http.get(Uri.parse('http://localhost:7891/grow/full/$name'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return FullGrow.fromJson(jsonDecode(response.body));
    } else {
      // If the server returns an error response, throw an exception
      throw Exception('Failed to load full grow');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<FullGrow>(
          future: _fullGrowFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading...'); // Placeholder text while fetching data
            } else if (snapshot.hasError) {
              return Text(snapshot.error
                  .toString()); // Error message if data fetching fails
            } else {
              return Text(snapshot.data!.growName); // Display the fetched data
            }
          },
        ),
      ),
      drawer: Menu(),
      body: FutureBuilder<FullGrow>(
        future: _fullGrowFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Placeholder while fetching data
          } else if (snapshot.hasError) {
            return Text(snapshot.error
                .toString()); // Error message if data fetching fails
          } else {
            final fullGrow = snapshot.data!;
            return Column(
              children: [
                TextFormField(
                  initialValue: fullGrow.growName,
                  decoration: InputDecoration(
                    labelText: 'Grow Name',
                  ),
                  readOnly: true,
                ),
                TextFormField(
                  initialValue: fullGrow.stageName,
                  decoration: InputDecoration(
                    labelText: 'Stage Name',
                  ),
                  readOnly: true,
                ),
                TextFormField(
                  initialValue: fullGrow.mushroomName,
                  decoration: InputDecoration(
                    labelText: 'Mushroom Name',
                  ),
                  readOnly: true,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
