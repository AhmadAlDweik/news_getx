import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;
import 'package:news_getx/model/news_model.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 0.obs;
  getData(String category) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=0c728a6e20b64e41beeec0b341dcfe41');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        return newsArticles.fromJson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('error', e.toString());
      }
    }
  }
}
