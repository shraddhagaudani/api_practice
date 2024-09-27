import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import '../newshelper/news_helper.dart';
import '../newsmodel/news_model.dart';

class NewsController extends GetxController {
  TextEditingController searchtTextEditingController = TextEditingController();
  Rx<NewsModel?> alldata = Rx<NewsModel?>(null);

  RxBool isloading = false.obs;

  // late Future<NewsModel?> alldata;

  @override
  void onInit() {
    fetchData(search: "business");
    super.onInit();
  }

  fetchData({required String search}) async {
    try {
      isloading.value = true;
      alldata.value = await NewsHelper.newsHelper.fetchNewsData(searchCategory: search);
      update();
    } catch (e) {
      // Handle error (optional)
      alldata.value = null; // or handle the error state
      update();
    } finally {
      isloading.value = false;
      update();
    }
    // update();
  }

  search() {
    String query = searchtTextEditingController.text.trim();

    if (query.isNotEmpty) {
      fetchData(search: query);
    } else {
      isloading.value  = true;
      fetchData(search: "business");
    }
    update();
  }
}
