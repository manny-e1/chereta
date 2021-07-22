import 'package:shopping_cart/api/bid.api.dart';
import 'package:shopping_cart/models/bid.model.dart';

class BidRepository {
  final BidDataProvider bidProvider;

  BidRepository({required this.bidProvider});

  Future<String> createBid(Bid bid, String itemID) async {
    return await bidProvider.createBid(bid, itemID);
  }

  Future<Bid> getHighestBid() async {
    return await bidProvider.getHighestBid();
  }
}
