import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:spotify/spotify.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

final clientId = "a781065aa43c4c2ab857b4fbf62ce15b";
final clientSecret = "b3ee26185733482b87167134eea96e7b";
final url = "https://accounts.spotify.com/authorize";

Map params = {
  'clientId': clientId,
};
Uri outgoingUri = new Uri(
    scheme: 'http',
    host: 'accounts.spotify.com',
    path: 'authorize',
    queryParameters: params);

Future<bool> requestAuth() async {
  print(outgoingUri);
  try {
    final response = await FlutterWebAuth.authenticate(
        url: outgoingUri.toString(), callbackUrlScheme: 'Crave');
    debugPrint('artistData: $response');
    return true;
  } on PlatformException catch (e) {
    debugPrint('ERROR: $e');
    return false;
  }
}

Future<bool> loadSpotifyArtist() async {
  final credentials = SpotifyApiCredentials(clientId, clientSecret);
  final spotify = SpotifyApi(credentials);
  try {
    final artist = await spotify.artists.get('0OdUWJ0sBjDrqHygGUXeCF');
    debugPrint('artistData: $artist');
    return true;
  } on PlatformException catch (e) {
    debugPrint('ERROR: $e');
    return false;
  }
}
