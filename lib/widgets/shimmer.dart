import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'category.dart';
import 'customFloatingActionButton.dart';
import 'itemDetail.dart';

class ItemLoadingShimmer extends StatelessWidget {
  const ItemLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 8.0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 15,
                  child: Category(text: ""),
                ),
                Positioned(
                  left: 0,
                  bottom: 20,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent[700],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5.0),
                          child: Container(
                            width: 50,
                          ),
                        ),
                      ),
                      CustomFloatingActionButton(
                          iconData: Icons.favorite_outline, heroTag: "fBtn1"),
                      CustomFloatingActionButton(
                          iconData: Icons.ios_share_outlined, heroTag: "fBtn2"),
                      CustomFloatingActionButton(
                          iconData: Icons.messenger_outline_outlined,
                          heroTag: "fBtn3"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmptyContainer(width: 80),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(width: 10),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          EmptyContainer(width: 50),
                          SizedBox(width: 5),
                          EmptyContainer(width: 80),
                        ]),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                EmptyContainer(width: 80),
                SizedBox(
                  height: 15,
                ),
                EmptyContainer(width: double.infinity),
                EmptyContainer(width: double.infinity),
                EmptyContainer(width: double.infinity)
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}

class EmptyContainer extends StatelessWidget {
  final double width;

  const EmptyContainer({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(

        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[300]!,
          child: Container(
        color: Colors.grey[400],
        height: 10,
        width: width,
      ),
    );
  }
}

class BidLoadingShimmer extends StatelessWidget {
  const BidLoadingShimmer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: MediaQuery.of(context).size.height / 7,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                EmptyContainer(width: 50),
                                SizedBox(
                                  height: 5,
                                ),
                                EmptyContainer(width: 70),
                              ],
                            ),
                          ),
                          EmptyContainer(width: 80)
                        ],
                      ),
                    );
  }
}
