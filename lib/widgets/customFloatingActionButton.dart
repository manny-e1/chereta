import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({required this.iconData, required this.heroTag});
  final IconData iconData;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: FloatingActionButton(
        backgroundColor: Colors.blueGrey[600],
        onPressed: () {},
        child: Icon(iconData, size: 20),
        heroTag: heroTag,
      ),
    );
  }
}
