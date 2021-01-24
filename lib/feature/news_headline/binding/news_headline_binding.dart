import 'package:get/get.dart';
import 'package:getx_news_app_impl/core/repository/news_repo_impl.dart';
import 'package:getx_news_app_impl/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(NewsRepoImpl());
    Get.put(NewsHeadlineController());
  }

}