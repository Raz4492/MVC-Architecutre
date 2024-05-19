import 'package:flutter/material.dart';
import '../controllers/age_controller.dart';
import '../models/age.dart';

class AgeView extends StatelessWidget {
  final AgeController _controller = AgeController();
  final TextEditingController _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Age Calculator')),
      body: Column(
        children: [
          TextField(
            controller: _dobController,
            decoration:
                InputDecoration(labelText: 'Enter Date of Birth (YYYY-MM-DD)'),
          ),
          ElevatedButton(
            onPressed: () {
              _controller.fetchAge(_dobController.text);
            },
            child: Text('Calculate Age'),
          ),
          FutureBuilder<Age>(
            future: _controller.fetchAge(_dobController.text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                return Text('Age: ${snapshot.data!.age}');
              } else {
                return Center(child: Text('No data found'));
              }
            },
          ),
        ],
      ),
    );
  }
}
