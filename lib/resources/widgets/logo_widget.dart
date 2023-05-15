import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo(
      {Key? key, this.height, this.width})
      : super(key: key);
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.green.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}