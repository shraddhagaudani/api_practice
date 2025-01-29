import 'package:get/get.dart';

import 'api_services/api_services.dart';

class PostController extends GetxController {
  final ApiService _apiService = ApiService();
  var posts = <dynamic>[].obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  int start = 0;
  final int limit = 10;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    if (isLoading.value || !hasMore.value) return;
    isLoading.value = true;

    try {
      final newPosts = await _apiService.fetchPosts(start, limit);
      if (newPosts.isNotEmpty) {
        posts.addAll(newPosts);
        start += limit;
      } else {
        hasMore.value = false;
      }
    } catch (e) {
      hasMore.value = false;
    }

    isLoading.value = false;
  }
}
