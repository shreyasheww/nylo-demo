import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  Gap({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: height ?? 0.0,
      width: width ?? 0.0,
    );
  }
}
