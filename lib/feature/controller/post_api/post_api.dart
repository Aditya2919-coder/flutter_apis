import 'package:get/get_state_manager/get_state_manager.dart';

import '../../services/post_api/post_api.dart';

class PostApiController extends GetxController{
  final PostApi _apiService = PostApi();

  final String postApiControllerId = 'post_api_controller';
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> postPhoto({
    required String title,
    required String url,
    required String thumbnailUrl,
  }) async {
    try {
      _isLoading = true;
      update([postApiControllerId]);

      final response = await _apiService.postRequest(
        endpoint: "/photos",
        body: {
          "title": title,
          "url": url,
          "thumbnailUrl": thumbnailUrl,
        },
      );

      print("Post response: $response");

    } catch (e) {
      print("Post error: $e");
    } finally {
      _isLoading = false;
      update([postApiControllerId]);
    }
  }
}