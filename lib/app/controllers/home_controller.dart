import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller.dart';

class HomeController extends Controller {
  @override
  construct(BuildContext context) {
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
