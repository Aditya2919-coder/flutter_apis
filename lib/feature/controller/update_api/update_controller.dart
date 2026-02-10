import 'package:get/get.dart';

import '../../services/update_api/update_api.dart';

class UpdateController extends GetxController {
  final UpdateApiService _apiService = UpdateApiService();

  final String updateControllerId = 'update_controller';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> updatePhoto({
    required int id,
    required String title,
  }) async {
    try {
      _isLoading = true;
      update([updateControllerId]);

      final response = await _apiService.patchRequest(
        endpoint: "/photos/$id",
        body: {
          "title": title,
        },
      );

      print("Update response: $response");

    } catch (e) {
      print("Update error: $e");
    } finally {
      _isLoading = false;
      update([updateControllerId]);
    }
  }
}
