part of 'bid_bloc.dart';

abstract class BidEvent extends Equatable {
  const BidEvent();

  @override
  List<Object> get props => [];
}

class PlaceBid extends BidEvent {
  final Bid bid;
  final String itemID;
  PlaceBid({required this.bid, required this.itemID});

  @override
  List<Object> get props => [bid, itemID];
}

class HighestBidLoad extends BidEvent {
  @override
  List<Object> get props => [];
}
