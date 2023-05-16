import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../model/post_model.dart';

/*
|--------------------------------------------------------------------------
| ApiService
| -------------------------------------------------------------------------
| Define your API endpoints

| Learn more https://nylo.dev/docs/4.x/networking
|--------------------------------------------------------------------------
*/

class ApiService extends BaseApiService {
  ApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  @override
  final interceptors = {
    if (getEnv('APP_DEBUG') == true)
      PrettyDioLogger: PrettyDioLogger()
  };

  Future fetchTestData() async {
    return await network(
      request: (request) => request.get("/endpoint-path"),
    );
  }

  Future<List<PostModel>?> fetchPost() async {
    return await network<List<PostModel>>(
        request: (request) => request.get("/posts"),
        handleSuccess: (Response response) { // response - Dio Response object
          dynamic data = response.data;
          print("response_data=> ${data.toString()}");
          return List.from(data)
              .map((json) => PostModel.fromJson(json))
              .toList();
        }
    );
  }
}
