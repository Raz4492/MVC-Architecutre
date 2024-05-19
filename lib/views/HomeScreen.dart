import 'package:flutter/material.dart';
import 'package:user_info_age_calculator/views/age_view.dart';
import 'package:user_info_age_calculator/views/user_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter MVC Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserView()), // Navigate to user view
                );
              },
              child: Text('User Info'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AgeView()), // Navigate to age view
                );
              },
              child: Text('Age Calculator'),
            ),
          ],
        ),
      ),
    );
  }
}
