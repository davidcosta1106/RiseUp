import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rise_up2/models/users.dart';

class FetchDataUsers {
  //GET users
  static Future<List<Users>> getUsers() async {
    Iterable iterable;
    List<Users> users;

    const url = 'http://10.0.2.2:7014/api/Users';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    iterable = json.decode(response.body);
    users = List<Users>.from(iterable.map((e) => Users.fromJson(e)));
    return users;
  }

  //PUT Users
  static Future<void> putUsers(Users users) async {
    const apiUrl = 'http://10.0.2.2:7014/api/Users/';
    final updateUrl = apiUrl + users.idUser.toString();

    final body = {
      'id_user': users.idUser.toString(),
      'user_name_': users.username.toString(),
      'e_mail': users.email.toString(),
      'pass_word': users.email.toString(),
    };

    final response = await http.put(
      Uri.parse(updateUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    if (response.statusCode == 204) {
      print('Mission deleted successfully.');
    } else {
      print('Failed to delete mission. Status code: ${response.statusCode}');
    }
  }

  //DELETE Users
  static Future<void> deleteUser(int idUser) async {
    const apiUrl = 'http://10.0.2.2:7014/api/Users/';
    final deleteUrl = apiUrl + idUser.toString();

    final response = await http.delete(
      Uri.parse(deleteUrl),
    );

    if (response.statusCode == 204) {
      print('Mission deleted successfully.');
    } else {
      print('Failed to delete mission. Status code: ${response.statusCode}');
    }
  }
}
