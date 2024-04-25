import 'package:flutter/material.dart';
import 'package:mushroom_monitor_mobile/menu/Menu.dart';
import 'api_service.dart';

class CreateGrow extends StatefulWidget {
  @override
  _CreateGrowState createState() => _CreateGrowState();
}

class _CreateGrowState extends State<CreateGrow> {
  String? _selectedMushroom;
  String? _selectedStage;
  String _name = '';
  List<dynamic> _mushrooms = [];
  List<dynamic> _stages = [];
  bool _stagesDropdownEnabled = false;

  @override
  void initState() {
    super.initState();
    _fetchMushrooms();
  }

  Future<void> _fetchMushrooms() async {
    _mushrooms = await ApiService.fetchMushrooms();
  }

  Future<void> _fetchStages(String? mushroomId) async {
    if (mushroomId != null) {
      _stages = await ApiService.fetchStages(mushroomId);
      setState(() {
        _stagesDropdownEnabled = true; // Enable the stages dropdown
      });
    }
  }

  Future<void> _postData() async {
    if (_name.isNotEmpty && _selectedMushroom != null && _selectedStage != null) {
      await ApiService.postGrow(_name, _selectedMushroom!, _selectedStage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Grow'),
      ),
      drawer: Menu(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedMushroom,
              hint: Text('Select Mushroom'),
              items: _mushrooms.map((mushroom) {
                return DropdownMenuItem<String>(
                  value: mushroom['MushroomID'].toString(),
                  child: Text(mushroom['Name']),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedMushroom = value!;
                  _fetchStages(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedStage,
              hint: Text('Select Stage'),
              items: _stagesDropdownEnabled ? _stages.map((stage) {
                return DropdownMenuItem<String>(
                  value: stage['StageID'].toString(),
                  child: Text(stage['Name']),
                );
              }).toList() : null,
              onChanged: (value) {
                setState(() {
                  _selectedStage = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _name.isNotEmpty && _selectedMushroom != null && _selectedStage != null ? _postData : null,
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}