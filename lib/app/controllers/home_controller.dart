import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_app/app/model/post_model.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'controller.dart';

class HomeController extends Controller {

  bool darkMode = false;
  Random randomPositionSlider = Random();
  Random randomPositionAdBanner = Random();
  Random randomPositionCategory = Random();



  @override
  construct(BuildContext context) async {
    super.construct(context);
  }

  onTapDocumentation() async {
    print("click");
  }

  onTapGithub() async {
    print("click");
  }

  onTapChangeLog() async {
    print("click");
  }
}
