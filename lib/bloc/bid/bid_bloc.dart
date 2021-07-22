import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/models/bid.model.dart';
import 'package:shopping_cart/repository/bid.repo.dart';

part 'bid_event.dart';
part 'bid_state.dart';

class BidBloc extends Bloc<BidEvent, BidState> {
  final BidRepository bidRepository;
  BidBloc({required this.bidRepository}) : super(BidInitial());

  @override
  Stream<BidState> mapEventToState(
    BidEvent event,
  ) async* {
    if (event is HighestBidLoad) {
      yield BidInitial();
      try {
        final bid = await bidRepository.getHighestBid();
        yield HighestBidLoadedState(bid: bid);
      } catch (e) {
        yield BidFailureState(message: "$e");
      }
    }
    if (event is PlaceBid) {
      try {
        await bidRepository.createBid(event.bid, event.itemID);
        final bid = await bidRepository.getHighestBid();
        yield HighestBidLoadedState(bid: bid);
      } catch (e) {
        yield BidFailureState(message: "$e");
      }
    }
  }
}
