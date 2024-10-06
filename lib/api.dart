import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://reqres.in/api/login';

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Successfully logged in
      var data = jsonDecode(response.body);
      print('Login successful: ${data}');
      // You can handle the successful response here
    } else {
      // Handle error
      print('Login failed: ${response.body}');
    }
  }
}
