import 'package:flutter_app/app/model/post_model.dart';
import 'package:flutter_app/app/networking/dio/base_api_service.dart';
import '/app/networking/api_service.dart';


final Map<Type, dynamic> modelDecoders = {
  List<PostModel>: (data) => List.from(data).map((json) => PostModel.fromJson(json)).toList(),

};



final Map<Type, BaseApiService> apiDecoders = {

  ApiService: ApiService(),

  // ...
};
