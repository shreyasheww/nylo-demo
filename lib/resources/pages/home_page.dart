import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/post_model.dart';
import 'package:flutter_app/app/networking/api_service.dart';
import 'package:flutter_app/bootstrap/extensions.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/widgets/gap.dart';
import 'package:flutter_app/resources/widgets/reusable_widget.dart';
import '/app/controllers/home_controller.dart';
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


  List<PostModel>? post;
  
  @override
  init() async {

    post = await api<ApiService>((request) => request.fetchPost());

    setState(() {
    });
    // TODO: implement init
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
                  value: widget.controller.darkMode,
                  onChanged: (value) {
                    widget.controller.darkMode = value;
                    NyTheme.set(context,
                        id: getEnv(widget.controller.darkMode == true
                            ? 'DARK_THEME_ID'
                            : 'LIGHT_THEME_ID'));
                    setState(() {});
                  }),
              Text("${widget.controller.darkMode == true ? "Dark" : "Light"} Mode"),
            ],
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          child: SafeAreaWidget(
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
                          position: widget.controller.randomPositionSlider.nextInt(4),
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
                          position: widget.controller.randomPositionAdBanner.nextInt(4),
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
                              position: widget.controller.randomPositionCategory.nextInt(4),
                              width: MediaQuery.of(context).size.width * .14,
                              height: MediaQuery.of(context).size.height * .08,
                              isOven: true,
                            ),
                            Text("".toString().toRandom(5))
                                .medium(context)
                                .copyWith(
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600))
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
                      Text("latest Post")
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


                if(post != null && post!.isNotEmpty)
                for (int i = 0; i < post!.length; i++)
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(post![i].title.toString(), style: TextStyle(color: Colors.black),),
                        SizedBox(height: 5),
                        Divider(color: Colors.grey),
                        SizedBox(height: 5),
                        Text(post![i].body.toString(), style: TextStyle(color: Colors.black),),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
