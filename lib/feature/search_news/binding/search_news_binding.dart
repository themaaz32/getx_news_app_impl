import 'package:get/get.dart';
import 'package:getx_news_app_impl/feature/search_news/controller/search_news_controller.dart';

class SearchNewsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }

}