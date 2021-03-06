import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx/controller/news_controller.dart';
import 'package:news_getx/model/news_model.dart';

class Technology extends GetWidget {
  @override
  NewsController controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getData("technology"),
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
                    child: data.articles![index].urlToImage != null
                        ? Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 150,
                                child: Image.network(
                                  '${data.articles![index].urlToImage}',
                                  fit: BoxFit.fill,
                                ),
                              ),
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
                          )
                        : Container(),
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
