import 'package:flutter/services.dart';
import 'package:spotify/spotify.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

final clientId = "a781065aa43c4c2ab857b4fbf62ce15b";
final clientSecret = "b3ee26185733482b87167134eea96e7b";
final url = "https://accounts.spotify.com/authorize";
final redirectUri = 'crave.app://callback';

Uri outgoingUri = new Uri(
    scheme: 'http',
    host: 'accounts.spotify.com',
    path: 'authorize',
    queryParameters: {
      'client_id': clientId,
      'redirect_uri': redirectUri,
      'response_type': 'code'
    });

Future<bool> requestAuth() async {
  try {
    final response = await FlutterWebAuth.dauthenticate(
        url: outgoingUri.toString(), callbackUrlScheme: 'crave.app');
    final parsedUri = Uri.parse(response);
    debugPrint('Response: $parsedUri');

    return true;
  } on PlatformException catch (e) {
    debugPrint('ERROR: $e');
    return false;
  }
}

