import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class UserController {
  Future<User> fetchUser() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
