import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:flutter_app/resources/widgets/gap.dart';
import 'package:flutter_app/resources/widgets/reusable_widget.dart';
import '/app/controllers/home_controller.dart';
import '/bootstrap/helpers.dart';
import '/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';

import '../extension/random_string.dart';

class HomePage extends NyStatefulWidget {
  final HomeController controller = HomeController();
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends NyState<HomePage> {
  bool _darkMode = false;
  Random _randomPositionSlider = Random();
  Random _randomPositionAdBanner = Random();
  Random _randomPositionCategory = Random();

  @override
  init() async {
    super.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Row(
            children: [
              Switch(
                  value: _darkMode,
                  onChanged: (value) {
                    _darkMode = value;
                    NyTheme.set(context,
                        id: getEnv(_darkMode == true
                            ? 'DARK_THEME_ID'
                            : 'LIGHT_THEME_ID'));
                    setState(() {});
                  }),
              Text("${_darkMode == true ? "Dark" : "Light"} Mode"),
            ],
          )
        ],
      ),
      body: SafeAreaWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /// Slider

            SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 20; i++)
                    ReusableWidget(
                      position: _randomPositionSlider.nextInt(4),
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.height * .22,
                      isOven: false,
                    ),
                ],
              ),
            ),

            /// advertisement banner
            SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 20; i++)
                    ReusableWidget(
                      position: _randomPositionAdBanner.nextInt(4),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .12,
                      isOven: false,
                    ),
                ],
              ),
            ),

            /// Space
            Gap(
              height: 10,
            ),

            /// category list
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Category")
                      .medium(context)
                      .copyWith(
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600))
                      .setColor(context, (color) => Colors.grey),
                  Text("View More")
                      .medium(context)
                      .copyWith(
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600))
                      .setColor(context, (color) => Colors.grey),
                ],
              ),
            ),

            /// category item
            SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 20; i++)
                    Column(
                      children: [
                        ReusableWidget(
                          position: _randomPositionCategory.nextInt(4),
                          width: MediaQuery.of(context).size.width * .14,
                          height: MediaQuery.of(context).size.height * .08,
                          isOven: true,
                        ),
                        Text("".toString().toRandom(5))
                            .medium(context)
                            .copyWith(
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600))
                            .setColor(
                                context, (color) => Colors.brown.shade300),
                      ],
                    ),
                ],
              ),
            ),

            Gap(
              height: 10,
            ),





            /// product list
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Products")
                      .medium(context)
                      .copyWith(
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600))
                      .setColor(context, (color) => Colors.grey),
                  Text("View More")
                      .medium(context)
                      .copyWith(
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600))
                      .setColor(context, (color) => Colors.grey),
                ],
              ),
            ),

            /// product item
            SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [

                  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index){
                    return Container(

                    );
                  }),


                  for (int i = 0; i < 20; i++)
                    Column(
                      children: [
                        ReusableWidget(
                          position: _randomPositionCategory.nextInt(4),
                          width: MediaQuery.of(context).size.width * .14,
                          height: MediaQuery.of(context).size.height * .08,
                          isOven: true,
                        ),
                        Text("".toString().toRandom(5))
                            .medium(context)
                            .copyWith(
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600))
                            .setColor(
                            context, (color) => Colors.brown.shade300),
                      ],
                    ),
                ],
              ),
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Divider(),
                Container(
                  height: 170,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      color: ThemeColor.get(context).surfaceBackground,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 9,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      MaterialButton(
                        child: Text(
                          "MaterialButton_1".tr().capitalize(),
                        )
                            .large(context)
                            .setColor(context, (color) => color.surfaceContent),
                        onPressed: widget.controller.onTapDocumentation,
                      ),
                      Divider(
                        height: 0,
                      ),
                      MaterialButton(
                        child: Text(
                          "MaterialButton_2",
                        )
                            .large(context)
                            .setColor(context, (color) => color.surfaceContent),
                        onPressed: widget.controller.onTapGithub,
                      ),
                      Divider(
                        height: 0,
                      ),
                      MaterialButton(
                        child: Text(
                          "MaterialButton_3".tr().capitalize(),
                        )
                            .large(context)
                            .setColor(context, (color) => color.surfaceContent),
                        onPressed: widget.controller.onTapChangeLog,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Framework Version: $nyloVersion",
                ).medium(context).setColor(context, (color) => Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
