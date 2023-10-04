import 'dart:convert';
import 'package:e_joint_mobile/models/menu_items.dart';
import 'package:http/http.dart' as http;

Future<List<MenuItem>> fetchMenuItems() async {
  final response =
      await http.get(Uri.parse('http://127.0.0.1:8000/api/menuitems/'));

  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((data) => MenuItem.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occurred!');
  }
}
