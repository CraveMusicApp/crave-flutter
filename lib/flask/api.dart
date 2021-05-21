import 'dart:convert';
import 'dart:async';
import 'package:crave/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<String> apiRequest() async {
  AuthService userProfile = new AuthService();
  Map data = {'user_name': userProfile.getDisplayName()};
  var jsonData = jsonEncode(data);
  //var url = "http://10.0.2.2:5000"; // android
  var url = "http://127.0.0.1:5000"; //ios
  debugPrint('should be username $jsonData');
  debugPrint('should be username $data');
  var response = await http.post(Uri.parse(url + "/user"), body: jsonData);
}

Future<String> songInfoRequest(
    String likeStatus, String songName, String songGenre) async {
  Map dataSong = {
    'likeStatus': likeStatus,
    'songName': songName,
    'songGenre': songGenre
  };

  var jsonDataSong = jsonEncode(dataSong);
  //var url = "http://10.0.2.2:5000"; //android
  var url = "http://127.0.0.1:5000"; //ios
  var response =
      await http.post(Uri.parse(url + "/songData"), body: jsonDataSong);
}

