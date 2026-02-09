// class ApiExceptions implements Exception {
//   final String message;
//   final int? statusCode;
//   final String? response;

//   ApiExceptions({required this.message, this.statusCode, this.response});

//   @override
//   String toString() =>
//       'ApiExceptions: $message (Status code: $statusCode, Response: $response)';
// }

// class NetworkException extends ApiExceptions {
//   NetworkException({super.message = 'Network error occurred'});
// }

// class ServerException extends ApiExceptions {
//   ServerException({
//     required super.message,
//     required int super.statusCode,
//     super.response,
//   });
// }

// class ParseException extends ApiExceptions {
//   ParseException({super.message = 'Error parsing data'});
// }
