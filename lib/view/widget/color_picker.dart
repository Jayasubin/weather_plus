import 'package:flutter/material.dart';
import 'package:weather_plus/util/constants.dart';
import 'package:weather_plus/view/widget/single_color.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 300,
        width: 250,
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          children: getChildren(),
        ),
      ),
    );
  }

  List<Widget> getChildren() {
    List<Widget> children = [];

    for (Color color in colorSelection) {
      children.add(SingleColor(color: color));
    }

    return children;
  }
}
