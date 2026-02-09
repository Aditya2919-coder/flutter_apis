import 'package:demo_project/feature/view/photos_screen.dart';
import 'package:demo_project/feature/view/todo_screen.dart';
import 'package:demo_project/feature/view/users_screen.dart';
import 'package:demo_project/utils/constant/local_storage_key_string.dart';
import 'package:go_router/go_router.dart';
import '../../feature/view/prac_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: LocalStorageKeyString.appNavKey,
    initialLocation: AppRoutes.photosScreen,
    routes: [
      GoRoute(
        path: AppRoutes.userScreen,
        builder: (context, state) {
          return UsersScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.todoScreen,
        builder: (context, state) {
          return TodoScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.pracScreen,
        builder: (context, state) {
          return PracScreen();
        },
      ),
       GoRoute(
        path: AppRoutes.photosScreen,
        builder: (context, state) {
          return PhotosScreen();
        },
      ),
    ],
  );
}
