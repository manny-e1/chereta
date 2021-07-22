part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemLoadedState extends ItemState {
  final Item item;
  ItemLoadedState({required this.item});
  @override
  List<Object> get props => [item];
}

class ItemFailureState extends ItemState {
  final String message;
  ItemFailureState({required this.message});
}
