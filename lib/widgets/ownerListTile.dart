import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String name, avatar;

  CustomListTile({Key? key, required this.name, required this.avatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          child: Image(
            image: NetworkImage(avatar),
          ),
        ),
        SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("owner",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              )),
          SizedBox(width: 5),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ]),
      ],
    );
  }
}
