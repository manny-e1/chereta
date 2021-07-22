import 'package:flutter/material.dart';
import 'package:shopping_cart/constants/textWidgets.dart';

import 'ownerListTile.dart';

class ItemDetail extends StatelessWidget {
  final String title, ownerName, ownerAvatar, description;

  const ItemDetail(
      {Key? key,
      required this.title,
      required this.ownerName,
      required this.ownerAvatar,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kItemNameTextStyle,
        ),
        SizedBox(
          height: 15,
        ),
        CustomListTile(name: ownerName, avatar: ownerAvatar),
        SizedBox(
          height: 15,
        ),
        Text("Description", style: kItemNameTextStyle),
        SizedBox(
          height: 15,
        ),
        Text(description),
      ],
    );
  }
}
