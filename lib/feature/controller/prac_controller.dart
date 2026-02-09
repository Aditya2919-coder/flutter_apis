import 'package:demo_project/feature/core/constants/api_constants.dart';
import 'package:demo_project/feature/services/prac_api_service.dart';
import 'package:get/get.dart';

import '../models/prac_model.dart';

class PracController extends GetxController {
  final PracApiService _apiService = PracApiService();

  final String pracControllerId = 'prac_controller';
  List<PracModel> pracModels = [];
  bool isLoading = false;

  // getters
  List<PracModel> get getPracModels => pracModels;
  bool get getIsLoading => isLoading;

  @override
  void onInit() {
    super.onInit();
    fetchPracModels();
  }

  Future<void> fetchPracModels() async {
    try {
      isLoading = true;
      update([pracControllerId]);
      final List<PracModel> response = await _apiService
          .getRequest<List<PracModel>>(
            endpoint: ApiConstants.pracEndpoint,
            fromJson: (json) {
              if (json is List) {
                return json.map((e) => PracModel.fromJson(e)).toList();
              } else {
                throw Exception('Invalid JSON format');
              }
            },
          );
      pracModels = response;
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading = false;
      update([pracControllerId]);
    }
  }
}
