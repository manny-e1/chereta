import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:shopping_cart/bloc/Item/item_bloc.dart';
import 'package:shopping_cart/bloc/bid/bid_bloc.dart';
import 'package:shopping_cart/widgets/bottomSheet.dart';
import 'package:shopping_cart/widgets/category.dart';
import 'package:shopping_cart/widgets/customFloatingActionButton.dart';
import 'package:shopping_cart/widgets/itemDetail.dart';
import 'package:shopping_cart/widgets/shimmer.dart';

class BidDetailScreen extends StatelessWidget {
  BidDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String itemID = '';
    return Scaffold(
      backgroundColor: Color(0xFFF6EEE0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: BlocBuilder<ItemBloc, ItemState>(
                  builder: (context, state) {
                    if (state is ItemFailureState) {
                      return Text('${state.message}');
                    }
                    if (state is ItemInitial) {
                      return Center(
                        child: ItemLoadingShimmer(),
                      );
                    }
                    if (state is ItemLoadedState) {
                      final item = state.item;
                      itemID = item.id;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height / 1.8,
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    image: NetworkImage(item.coverImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                left: 15,
                                child: Category(text: "Art"),
                              ),
                              Positioned(
                                left: 0,
                                bottom: 20,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.greenAccent[700],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 5.0),
                                        child: CountdownTimer(
                                          endTime: DateTime.parse(item.deadline)
                                              .millisecondsSinceEpoch,
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    CustomFloatingActionButton(
                                        iconData: Icons.favorite_outline,
                                        heroTag: "fBtn1"),
                                    CustomFloatingActionButton(
                                        iconData: Icons.ios_share_outlined,
                                        heroTag: "fBtn2"),
                                    CustomFloatingActionButton(
                                        iconData:
                                            Icons.messenger_outline_outlined,
                                        heroTag: "fBtn3"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ItemDetail(
                              title: item.title,
                              ownerName: item.owner["fullName"],
                              ownerAvatar: item.owner["avatar"],
                              description: item.description),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
              BlocBuilder<BidBloc, BidState>(
                builder: (context, state) {
                  if (state is BidFailureState) {
                    return Text('${state.message}');
                  }
                  if (state is BidInitial) {
                    return 
                      BidLoadingShimmer();
                  }
                  if (state is HighestBidLoadedState) {
                    final bid = state.bid;
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
                                Text(
                                  "Current Bid",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${bid.amount} ETH",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) => TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                ),
                                child: Text(
                                  "Place a bid",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () async {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return CustomBottomSheet(itemID: itemID);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
