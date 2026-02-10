import 'package:http/http.dart' as http;

import '../../core/constants/api_constants.dart';

class  DeleteApiService {
  final http.Client _client = http.Client();

  Future<void> deleteRequest({
    required String endpoint,
  }) async {
    try {
      final url = Uri.parse(ApiConstants.photoUrl + endpoint);
      final response = await _client.delete(url);

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw "Delete Failed";
      }
    } catch (e) {
      throw "Network Error: $e";
    }
  }
}
