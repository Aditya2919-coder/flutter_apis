import 'package:get/get.dart';
import '../../services/delete_api/delete_api.dart';

class DeleteController extends GetxController {
  final DeleteApiService _apiService = DeleteApiService();

  final String deleteControllerId = 'delete_controller';
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> deletePhoto(int id) async {
    try {
      _isLoading = true;
      update([deleteControllerId]);

      await _apiService.deleteRequest(
        endpoint: "/photos/$id",
      );

    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      update([deleteControllerId]);
    }
  }
}
