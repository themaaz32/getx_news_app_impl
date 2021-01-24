import 'package:get/get.dart';
import 'package:getx_news_app_impl/core/model/article.dart';
import 'package:getx_news_app_impl/core/model/news_response_model.dart';
import 'package:getx_news_app_impl/core/repository/news_repo.dart';
import 'package:getx_news_app_impl/service/http_service.dart';
import 'package:getx_news_app_impl/service/http_service_impl.dart';

class NewsRepoImpl implements NewsRepo{

  HttpService _httpService;

  NewsRepoImpl(){
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>> getNewsHeadline() async{
    // TODO: implement getNewsHeadline

    try {
       final response = await _httpService.getRequest("/v2/top-headlines?country=us");

       final parsedResponse = NewsResponse.fromJson(response.data);

       return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>> getSearchedNews(String query) async{
    // TODO: implement getSearchedNews
    try {
      final response = await _httpService.getRequest("/v2/everything?q=$query");

      final parsedResponse = NewsResponse.fromJson(response.data);

      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

}