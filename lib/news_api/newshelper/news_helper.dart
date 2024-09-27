import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../newsmodel/news_model.dart';

class NewsHelper {
  NewsHelper._();

  static final NewsHelper newsHelper = NewsHelper._();

  Future<NewsModel?> fetchNewsData({required String searchCategory}) async {
    try {

      print("start");

      String baseurl =
          "https://newsapi.org/v2/top-headlines?country=us&category=$searchCategory&apiKey=5c7c744100a640389d3823a7896ddb4c";

      http.Response res = await http.get(Uri.parse(baseurl));

      if (res.statusCode == 200) {
        String data = res.body;

        Map decodedData = jsonDecode(data);

        NewsModel newsModel = NewsModel.fromMap(data: decodedData);

        print("end");
        return newsModel;
      } else {
        print(
          'API call failed: ${res.statusCode}',
        );
      }

    } on Exception catch (e) {
             print(e.toString());

    }
  }
}
