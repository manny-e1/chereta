import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/api/bid.api.dart';
import 'package:shopping_cart/api/item.api.dart';
import 'package:shopping_cart/repository/bid.repo.dart';
import 'package:shopping_cart/repository/item.repo.dart';
import 'package:shopping_cart/screens/bidDetailScreen.dart';
import 'package:http/http.dart' as http;

import 'bloc/Item/item_bloc.dart';
import 'bloc/bid/bid_bloc.dart';

void main() {
  final BidRepository bidRepo =
      BidRepository(bidProvider: BidDataProvider(httpClient: http.Client()));
  final ItemRepository itemRepository =
      ItemRepository(itemProvider: ItemDataProvider(httpClient: http.Client()));
  runApp(MyApp(
    bidRepo: bidRepo,
    itemRepo: itemRepository,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({required this.bidRepo, required this.itemRepo});
  final BidRepository bidRepo;
  final ItemRepository itemRepo;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BidRepository>(create: (context) => bidRepo),
        RepositoryProvider<ItemRepository>(create: (context) => itemRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  BidBloc(bidRepository: bidRepo)..add(HighestBidLoad())),
          BlocProvider(
              create: (context) =>
                  ItemBloc(itemRepository: itemRepo)..add(ItemLoad())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(
                  color: Colors.white,
                  brightness: Brightness.light,
                  iconTheme: IconThemeData(color: Colors.black),
                  actionsIconTheme: IconThemeData(color: Colors.black),
                  elevation: 0)),
          home: BidDetailScreen(),
        ),
      ),
    );
  }
}
