import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EmergenceService {
  static Future<bool> Authen(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };
    print('debug....');
    print(authData);
    try {
      final http.Response response = await http.post(
          Uri.parse('http://10.28.129.163/api/logins/authen'),
          body: json.encode(authData),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
          });

      print(response);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return bool.parse(response.body);
      }
    } catch (err) {
      print(err);
    }

    // if (response.statusCode == 200) {
    //   print(json.decode(response.body));
    //   //String token = json.decode(response.body)['access_token'];
    //   //String code = json.decode(response.body)['code'];
    //   //if (code == "200") {

    //   return true;
    //   // }
    // }
    return false;
  }

  static Future<bool> Regis(String pid,String email, String password) async {
    final Map<String, dynamic> authData = {
      'pid': pid,
      'email': email,
      'password': password,
    };
    print('debug....');
    print(authData);
    try {
      final http.Response response = await http.post(
          Uri.parse('http://10.28.129.163/api/UserManagement/Regis'),
          body: json.encode(authData),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
          });

      print(response);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return bool.parse(response.body);
      }
    } catch (err) {
      print(err);
    }

    // if (response.statusCode == 200) {
    //   print(json.decode(response.body));
    //   //String token = json.decode(response.body)['access_token'];
    //   //String code = json.decode(response.body)['code'];
    //   //if (code == "200") {

    //   return true;
    //   // }
    // }
    return false;
  }
}


