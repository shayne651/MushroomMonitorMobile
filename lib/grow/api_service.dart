import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mushroom_monitor_mobile/models/FullGrow.dart';

class ApiService {
  static Future<List<dynamic>> fetchMushrooms() async {
    final response =
        await http.get(Uri.parse('http://localhost:7891/mushroom'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch mushrooms: ${response.statusCode}');
    }
  }

  static Future<List<dynamic>> fetchStages(String mushroomId) async {
    final response =
        await http.get(Uri.parse('http://localhost:7891/stage/$mushroomId'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch stages');
    }
  }

  static Future<void> postGrow(
      String name, String mushroomId, String stageId) async {
    final response = await http.post(
      Uri.parse('http://localhost:7891/grow'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Name': name,
        'Mushroom': mushroomId,
        'Stage': stageId,
      }),
    );
    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle error
    }
  }

  static Future<FullGrow> fetchFullGrow(String name) async {
    final response =
        await http.get(Uri.parse('http://localhost:7891/grow/full/$name'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch full grow');
    }
  }
}
