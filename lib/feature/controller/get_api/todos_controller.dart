import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/get_api/todos_model.dart';
import '../../services/get_api/todos_api_screen.dart';

class TodosController extends GetxController {
  final TodosApiService _apiService = TodosApiService();

  static const String todosControllerId = 'todos_controller';

  List<Todo> _todos = [];
  bool _isLoading = false;

  List<Todo> get todos => _todos;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future<void> fetchTodos() async { 
    try {
      _isLoading = true;
      update([todosControllerId]);
      final TodosModel response = await _apiService.getReques<TodosModel>(
        fromJson: (json) {
          return TodosModel.fromJson(json);
        },
      );
      _todos = response.todos ?? []; 
    } 
     catch (e) {
      print("Unexpected error: $e");
    } finally {
      _isLoading = false;
      update([todosControllerId]);
    }
  }
}
