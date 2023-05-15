import 'package:flutter/material.dart';

class ReusableWidget extends StatefulWidget {
  ReusableWidget({Key? key, this.height, this.width, required this.position,required this.isOven}) : super(key: key);

  final double? height;
  final double? width;
  final int position;
  bool isOven = false;


  @override
  State<ReusableWidget> createState() => _ReusableWidgetState();
}

class _ReusableWidgetState extends State<ReusableWidget> {

  List<Color> arrColorList = [
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.red.shade100,
    Colors.yellow.shade100,
    Colors.brown.shade100
  ];

  BoxDecoration containerShape = BoxDecoration(
      color: Colors.green.shade100,
      borderRadius: BorderRadius.circular(8),
  );

  @override
  void initState() {
    // TODO: implement initState

    if(widget.isOven){
      containerShape = BoxDecoration(
          color: arrColorList[widget.position],
          shape: BoxShape.circle
      );
    } else {
      containerShape = BoxDecoration(
          color: arrColorList[widget.position],
          borderRadius: BorderRadius.circular(8),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      width: widget.width ?? 200,
      height: widget.height ?? 200,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: containerShape,
    );
  }
}
