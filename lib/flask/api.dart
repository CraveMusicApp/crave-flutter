import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:crave/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<String> apiRequest() async {
  AuthService userProfile = new AuthService();
  Map data = {'user_name': userProfile.getDisplayName()};
  var jsonData = jsonEncode(data);
  var jsonResponse = null;
  var url = "http://10.0.2.2:5000"; // android
  // var url = "http://127.0.0.1:5000"; //ios
  debugPrint('should be username $jsonData');
  debugPrint('should be username $data');
  var response = await http.post(Uri.parse(url + "/test"), body: jsonData);
}
