import 'package:flutter/material.dart';
import '../controllers/age_controller.dart';
import '../models/age.dart';

class AgeView extends StatefulWidget {
  @override
  _AgeViewState createState() => _AgeViewState();
}

class _AgeViewState extends State<AgeView> {
  final AgeController _controller = AgeController();
  final TextEditingController _dobController = TextEditingController();
  Future<Age>? _futureAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Age Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _dobController,
              decoration: InputDecoration(labelText: 'Enter Date of Birth (YYYY-MM-DD)'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _futureAge = _controller.fetchAge(_dobController.text);
                });
              },
              child: Text('Calculate Age'),
            ),
            _futureAge == null
                ? Container()
                : FutureBuilder<Age>(
                    future: _futureAge,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final age = snapshot.data!;
                        return Text('Age: ${age.years} years, ${age.months} months, ${age.days} days');
                      } else {
                        return Text('No data found');
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
