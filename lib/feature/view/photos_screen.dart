import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/photos_controller.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PhotosController>(
        init: PhotosController(),
        id: "photos_controller", 
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.photos.isEmpty) {
            return const Center(
              child: Text("No photos found"),
            );
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
                        fit: BoxFit.cover,
                       
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
