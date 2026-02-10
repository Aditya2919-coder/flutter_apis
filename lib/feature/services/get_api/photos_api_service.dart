import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';

class PhotosApiService {
  final http.Client _client = http.Client();

  Future<T> getRequest<T>({
    required String endpoint,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final url = Uri.parse(ApiConstants.photoUrl + endpoint);
      final response = await _client.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return fromJson(jsonData);
      } else {
        throw "Failed to load data";
      }
    } catch (e) {
      throw "Network Error: $e";
    }
  }
}
