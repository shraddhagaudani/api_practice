import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'controller.dart';
class PostScreen extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: Obx(() => ListView.builder(
        itemCount: controller.posts.length + (controller.hasMore.value ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < controller.posts.length) {
            return ListTile(
              title: Text(controller.posts[index]['title']),
              subtitle: Text(controller.posts[index]['body']),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.fetchPosts,
        child: Icon(Icons.add),
      ),
    );
  }
}
