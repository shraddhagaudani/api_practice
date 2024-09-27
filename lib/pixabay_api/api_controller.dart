import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api_helper.dart';
import 'api_model.dart';

class ApiController extends GetxController {
  final TextEditingController searchTextEditingController = TextEditingController();
  // late Future<ApiModel?> alldata;

  Rx<ApiModel?> alldata = Rx<ApiModel?>(null);

  @override
  void onInit() {
    fetchData("flower");
  // alldata =   ApiHelper.apiHelper.fetchAllData(Search: "flower");
    super.onInit();

  }

  void fetchData(String search) async {
    try {
      alldata.value = await ApiHelper.apiHelper.fetchAllData(Search: search);
      update();
    } catch (e) {
      // Handle error (optional)
      alldata.value = null; // or handle the error state
      update();
    }
    update();
  }

  void search() {
    final query = searchTextEditingController.text.trim();
    if (query.isNotEmpty) {
      fetchData(query);
    } else {
      fetchData("flower"); // default search
    }
    update();
  }

}
