import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx/controller/news_controller.dart';
import 'package:news_getx/model/news_model.dart';

class Sports extends GetWidget {
  @override
  NewsController controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getData("sports"),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            newsArticles data = snapshot.data;
            return ListView.builder(
                itemCount: data.articles!.length,
                itemBuilder: (context, int index) {
                  return Card(
                    elevation: 10,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        data.articles![index].urlToImage != null
                            ? SizedBox(
                                width: double.infinity,
                                height: 150,
                                child: Image.network(
                                  '${data.articles![index].urlToImage}',
                                  fit: BoxFit.fill,
                                ),
                              )
                            : const Text(""),
                        Text(
                          "${data.articles![index].title}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        Text(
                          "${data.articles![index].description}",
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
