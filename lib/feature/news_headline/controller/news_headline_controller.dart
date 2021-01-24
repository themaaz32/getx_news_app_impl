import 'package:get/get.dart';
import 'package:getx_news_app_impl/core/repository/news_repo.dart';
import 'package:getx_news_app_impl/core/repository/news_repo_impl.dart';
import 'package:getx_news_app_impl/core/model/article.dart';

class NewsHeadlineController extends GetxController{
  NewsRepo _newsRepo;

  NewsHeadlineController(){
    _newsRepo = Get.find<NewsRepoImpl>();
    loadNewsLine();
  }

  RxBool isLoading = false.obs;

  RxList<Article> articles;

  loadNewsLine() async{

    showLoading();

    final result = await _newsRepo.getNewsHeadline();

    hideLoading();

    if(result!= null){
      articles = result.obs;
    }else{
      print("No data recieved");
    }
  }

  showLoading(){
    isLoading.toggle();
  }

  hideLoading(){
    isLoading.toggle();
  }
}