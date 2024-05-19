import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/age.dart';

class AgeController {
  Future<Age> fetchAge(String dob) async {
    final response =
        await http.get(Uri.parse('https://dummyapi.io/agecalculator?dob=$dob'));

    if (response.statusCode == 200) {
      return Age.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to calculate age');
    }
  }
}
