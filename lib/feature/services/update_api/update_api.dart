import 'dart:convert';
import 'package:demo_project/feature/core/constants/api_constants.dart';
import 'package:demo_project/feature/models/get_api/photos_model.dart';
import 'package:http/http.dart' as http;

class UpdateApiService {
  // final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<PhotosModel> patchRequest({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    final response = await http.patch(
      Uri.parse(ApiConstants.photoUrl + endpoint),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Update failed");
    }
  }
}
