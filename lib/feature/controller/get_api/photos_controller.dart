import 'package:demo_project/feature/services/get_api/photos_api_service.dart';
import 'package:get/get.dart';

import '../../models/get_api/photos_model.dart';

class PhotosController extends GetxController {
  final PhotosApiService _apiService = PhotosApiService();

  final String photosControllerId = 'photos_controller';

  List<PhotosModel> _photos = [];
  bool _isLoading = false;

  List<PhotosModel> get photos => _photos;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    fetchRequest();
  }

  Future<void> fetchRequest() async {
    try {
      _isLoading = true;
      update([photosControllerId]);

      final List<PhotosModel> response =
          await _apiService.getRequest<List<PhotosModel>>(
        endpoint: "/photos",
        fromJson: (json) {
          return (json as List)
              .map((e) => PhotosModel.fromJson(e))
              .toList();
        },
      );

      _photos = response;
      _isLoading = false;
      update([photosControllerId]);
    } catch (e) {
      _isLoading = false;
      update([photosControllerId]);
    }
  }
}
