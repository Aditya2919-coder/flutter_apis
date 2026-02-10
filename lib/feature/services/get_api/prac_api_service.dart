import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/constants/api_constants.dart';

class PracApiService {
  final http.Client _client = http.Client();

 Future<T> getRequest<T>({
  required String endpoint,
  required T Function(dynamic json) fromJson,
}) async {
  try {
    final url = Uri.parse('${ApiConstants.pracUrl}$endpoint');

    final response = await _client.get(url);
    return _handleResponse(response, fromJson);
  } catch (e) {
    throw "Network Error: ${e.toString()}";
  }
}

  T _handleResponse<T>(
    http.Response response,
    T Function(dynamic json) fromJson,
  ) {
    // _validstatusCode(response.statusCode, response.body);

    if (response.statusCode == 304 || response.body.isEmpty) {
      return fromJson(null);
    }

    try {
      final jsonData = jsonDecode(response.body);
      return fromJson(jsonData);
    } catch (e) {
      throw "Data Parsing Error: ${e.toString()}";
    }
  }

  // void _validstatusCode(int statusCode, String responseBody) {
  //   if (statusCode >= 200 && statusCode < 360) {
  //     return;
  //   }
  //   String errorMessage = ' An error occurred';
  //   switch (statusCode) {
  //     case 400:
  //       errorMessage = ' Bad Request';
  //       break;
  //     case 401:
  //       errorMessage = ' Unauthorized';
  //       break;
  //     case 403:
  //       errorMessage = ' Forbidden';
  //       break;
  //     case 404:
  //       errorMessage = ' Not Found';
  //       break;
  //     case 500:
  //       errorMessage = ' Internal Server Error';
  //       break;
  //     default:
  //       errorMessage = ' Unexpected Error';
  //   }

    // throw ServerException(
    //   message: errorMessage,
    //   statusCode: statusCode,
    //   response: responseBody,
    // );
  }

  // Map<String, String> _defaultHeaders() {
  //   return {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Accept': 'application/json',
  //   };
  // }

