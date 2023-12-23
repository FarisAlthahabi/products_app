import 'package:dio/dio.dart';

abstract class BaseUrl {
  Dio dio = Dio();
  String getPhonesUrl = 'https://dummyjson.com/products';
  String addPhoneUrl = 'https://dummyjson.com/products/add';
}
