import 'package:demo_project/feature/controller/delete_api/delete_controller.dart';
import 'package:demo_project/feature/controller/post_api/post_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/get_api/photos_controller.dart';
import '../../controller/update_api/update_controller.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DeleteController deleteController = Get.put(DeleteController());
    final UpdateController updateController = Get.put(UpdateController());
    final PostApiController postApiController = Get.put(PostApiController());

    return Scaffold(
      body: GetBuilder<PhotosController>(
        init: PhotosController(),
        id: "photos_controller",
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.photos.isEmpty) {
            return const Center(child: Text("No photos found"));
          }

          return GridView.builder(
            itemCount: controller.photos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final photo = controller.photos[index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.network(
                        photo.thumbnailUrl.toString(),
                        height: 100,
                        width: 100,
                      ),

                      const SizedBox(height: 5),
                      Text("Album: ${photo.albumId}"),
                      Flexible(
                        child: Text(
                          photo.title.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                deleteController.deletePhoto(photo.id!);
                              },
                            ),
                          ),

                          Expanded(
                            child: IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                updateController.updatePhoto(
                                  id: photo.id!,
                                  title: "Updated title",
                                );
                              },
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              postApiController.postPhoto(
                                title: "New Photo",
                                url: "https://via.placeholder.com/600/92c952",
                                thumbnailUrl: "https://via.placeholder.com/150/92c952",
                              );
                            },
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
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
