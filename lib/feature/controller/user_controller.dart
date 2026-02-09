import 'package:get/get.dart';

import '../core/exceptions/api_exceptions.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';
import '../core/constants/api_constants.dart';

class UserController extends GetxController {
  final ApiService _apiService = ApiService();

  // widget build key
  static const String userControllerId = 'user_controller';

  List<UserModel> _users = [];

  // getters
  List<UserModel> get users => _users;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  /// Fetch users from API
  Future<void> fetchUsers() async {
    try {
      _isLoading = true;
      update([userControllerId]);

      final List<UserModel> response =
          await _apiService.getRequest<List<UserModel>>(
        endpoint: ApiConstants.userEndpoint,
        fromJson: (json) {
          if (json is List) {
            return json.map((e) => UserModel.fromJson(e)).toList();
          } else {
            throw Exception('Invalid JSON format');
          }
        },
      );

      _users = response;
    } catch (e) {
      print("Unexpected Error: $e");
    } finally {
      _isLoading = false;
      update([userControllerId]);
    }
  }
}
