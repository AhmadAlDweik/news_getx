import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx/controller/news_controller.dart';
import 'package:news_getx/model/news_model.dart';
import 'package:news_getx/view/widget/health.dart';
import 'package:news_getx/view/widget/sports.dart';
import 'package:news_getx/view/widget/technology.dart';

class HomePage extends GetWidget {
  NewsController controller1 = Get.put(NewsController());
  List<Widget> screen = [
    Sports(),
    Technology(),
    Health(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        centerTitle: true,
      ),
      bottomNavigationBar: GetX<NewsController>(
        builder: (controller) => BottomNavigationBar(
            selectedItemColor: Colors.red,
            currentIndex: controller.currentIndex.value,
            onTap: (val) {
              controller.currentIndex.value = val;
            },
            items: const [
              BottomNavigationBarItem(
                label: "Sports",
                icon: Icon(Icons.sports),
              ),
              BottomNavigationBarItem(
                label: "Technology",
                icon: Icon(Icons.developer_board),
              ),
              BottomNavigationBarItem(
                label: "Health",
                icon: Icon(Icons.health_and_safety),
              )
            ]),
      ),
      body: Obx(
        () => screen[controller1.currentIndex.value],
      ),
    );
  }
}
