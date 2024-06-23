import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project2b/Models/EMG.dart';
import 'package:project2b/Models/Hospital.dart';
import 'package:project2b/Models/Illness.dart';
import 'package:project2b/Models/Patient.dart';
import 'package:project2b/Models/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

// String URL = "http://10.0.2.2:5224";
String URL = "http://183.88.240.114";
//String URL = "http://Localhost:5224";

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
          Uri.parse(URL + '/api/logins/authen'),
          body: json.encode(authData),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
          });

      print(response);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        bool? isAuthen = json.decode(response.body)['isAuthen'];

        if (isAuthen == true) {
          print("ok");
          String? token = json.decode(response.body)['token'].toString();
          Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
          final SharedPreferences prefs = await _prefs;
          prefs.setString("token", token);
          return true;
        }
        return bool.parse(response.body);
      }
    } catch (err) {
      print(err);
    }

    return false;
  }

  static Future<bool> Regis(
      String ID_number, String email, String password) async {
    final Map<String, dynamic> authData = {
      'ID_number': ID_number,
      'email': email,
      'password': password,
    };
    print('debug....');
    print(authData);
    try {
      final http.Response response = await http.post(
          Uri.parse(URL + '/api/UserManagement/Regis'),
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

    return false;
  }

  static Future<bool> PatientInfo(Patient model) async {
    final Map<String, dynamic> authData = {
      'User_ID': 0,
      'First_name': model.First_name,
      'Last_name': model.Last_name,
      'Nickname': model.Nickname,
      'Birthdate': model.Birthdate,
      'Gender': model.Gender,
      'Age': model.Age,
      'Weight': model.Weight,
      'Height': model.Height,
      'card_ID': model.card_ID,
      'Drug_allergy': model.Drug_allergy,
      'Food_allergy': model.Food_allergy,
      'Congennital_disease': model.Congennital_disease,
      'Adress': model.Adress,
      'Tel': model.Tel,
      'Emergency_phone_number1': model.Emergency_phone_number1,
      'relate_name1': model.relate_name1,
      'relation1': model.relation1,
      'Emergency_phone_number2': model.Emergency_phone_number2,
      'relate_name2': model.relate_name2,
      'relation2': model.relation2,
    };
    print('debug....');
    print(authData);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    try {
      final http.Response response = await http.post(
          Uri.parse(URL + '/api/UserManagement/Patient_Info'),
          body: json.encode(authData),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Authorization': 'Bearer $token'
          });

      print(response);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return bool.parse(response.body);
      }
    } catch (err) {
      print(err);
    }

    return false;
  }

  static Future<Profile> GetPatient() async {
    final Map<String, dynamic> authData = {
      'User_ID': 1,
    };
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print('debug....');
    print(authData);
    final http.Response response = await http.post(
        Uri.parse(URL + '/api/UserManagement/GetPatient'),
        body: json.encode(authData),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer $token'
        });

    print(response);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return Profile.fromJson(json.decode(response.body));
    }

    return Profile();
  }

  static Future<bool> UploadPicture(String image) async {
    final Map<String, dynamic> authData = {'User_ID': 1, 'image': image};
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print('debug....');
    print(authData);
    final http.Response response = await http.post(
        Uri.parse(URL + '/api/UserManagement/UploadPicture'),
        body: json.encode(authData),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer $token'
        });

    print(response);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return bool.parse(response.body);
    }
    return false;
  }

  static Future<List<Hospital>> GetHos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    final Map<String, dynamic> authData = {
      'Hospitalname': "",
    };
    // final Map<String, dynamic> authData = {
    //   'User_ID': 1,
    // };

    print('debug....GetPatient');
    print(authData);

    final http.Response response = await http.post(
        Uri.parse(URL + '/api/UserManagement/GetHos'),
        body: json.encode(authData),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer $token'
        });

    print(response);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      List list = json.decode(response.body);
      return list.map((m) => Hospital.fromJson(m)).toList();
      //return Hospital.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  static Future<bool> EMG_CallREQ(EMG model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    final Map<String, dynamic> authData = {
      'UserID': 1,
      'CardNumber': model.CardNumber,
      'Illness': model.Illness,
      'ContactNumber': model.ContactNumber,
      'latitude': model.latitude,
      'longitude': model.longitude,
      //'Image': model.Image,
    };
    print('debug....');
    print(authData);
    try {
      final http.Response response = await http.post(
          Uri.parse(URL + '/api/UserManagement/EMG_CallREQ'),
          body: json.encode(authData),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Authorization': 'Bearer $token'
          });

      print(response);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return bool.parse(response.body);
      }
    } catch (err) {
      print(err);
    }

    return false;
  }

  static Future<List<Illness>> GetIll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print('debug....GetPatient');
    // print(authData);
    final http.Response response = await http.post(
        Uri.parse(URL + '/api/UserManagement/GetIll'),
        body: json.encode({}),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer $token'
        });

    print(response);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      List list = json.decode(response.body);
      return list.map((m) => Illness.fromJson(m)).toList();
      //return Hospital.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
