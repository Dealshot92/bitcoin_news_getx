import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitcoin News'),
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          return Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: controller.newsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      controller.newsList[index].title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      controller.newsList[index].description,
                    ),
                    onTap: () {
                      // Handle onTap event
                    },
                  );
                },
              );
            }
          });
        },
      ),
    );
  }
}
