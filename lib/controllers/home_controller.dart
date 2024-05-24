import 'package:get/get.dart';

import '../models/news_model.dart';
import '../services/http_service.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var newsList = List<News>.empty().obs;
  final HttpService httpService = HttpService();

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      var response = await httpService.fetchBitcoinNews();
      if (response.statusCode == 200) {
        var data = response.body;
        newsList.value = newsFromJson(data);
      } else {
        throw Exception('Failed to load Bitcoin news');
      }
    } finally {
      isLoading(false);
    }
  }
}
