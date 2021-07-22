part of 'bid_bloc.dart';

abstract class BidState extends Equatable {
  const BidState();

  @override
  List<Object> get props => [];
}

class BidInitial extends BidState {}

class HighestBidLoadedState extends BidState {
  final Bid bid;
  HighestBidLoadedState({required this.bid});
  @override
  List<Object> get props => [bid];
}

class BidCreationSucessState extends BidState {}

class BidFailureState extends BidState {
  final String message;
  BidFailureState({required this.message});
}
