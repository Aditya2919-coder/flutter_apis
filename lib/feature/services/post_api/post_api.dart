import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/constants/api_constants.dart';

class PostApi {
  final http.Client _client = http.Client();
  
  Future<Map<String, dynamic>> postRequest({
  required String endpoint,
  required Map<String, dynamic> body,
}) async {
  try {
    final url = Uri.parse(ApiConstants.photoUrl + endpoint);

    final response = await _client.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw "Failed to create photo";
    }
  } catch (e) {
    throw "Network Error: $e";
  }
}

}