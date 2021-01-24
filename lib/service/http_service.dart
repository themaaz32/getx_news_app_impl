import 'package:dio/dio.dart';

abstract class HttpService{
  void init();

  Future<Response> getRequest(String url);
}