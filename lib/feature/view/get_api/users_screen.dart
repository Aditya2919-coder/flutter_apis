import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../controller/get_api/user_controller.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(title: const Text('Users'), elevation: 0),
      body: GetBuilder<UserController>(
        id: UserController.userControllerId,
        init: userController,
        builder: (a) {
          if (a.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (a.users.isEmpty) {
            return const Center(child: Text("No users found"));
          }
          return ListView.builder(
            itemCount: a.users.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(a.users[index].name[0]),
                      ),
                      title: Text(a.users[index].name),
                      subtitle: Text(a.users[index].email),
                      
                    ),
                    
                  ).paddingAll(20),
                  Text(a.users[index].username),
                  Text(a.users[index].website)
                ],
                
              );
            },
          );
        },
      ),
    );
  }
}
