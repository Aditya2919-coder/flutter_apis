import 'package:demo_project/feature/controller/get_api/prac_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PracScreen extends StatelessWidget {
  const PracScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: PracController(),
        id: PracController().pracControllerId,
        builder: (controller) {
          if (controller.getIsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.getPracModels.isEmpty) {
            return Center(child: Text("No data found"));
          }
          return GridView.builder(
            itemCount: controller.getPracModels.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              
            ),
            itemBuilder: (context, index) {
              final pracmodel = controller.getPracModels[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(pracmodel.id.toString().substring(0)),
                    ),
                    title: Text(pracmodel.title.toString()),
                    subtitle: Text(pracmodel.body.toString()),
                    
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
