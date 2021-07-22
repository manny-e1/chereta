import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_cart/models/item.model.dart';
import 'package:shopping_cart/repository/item.repo.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository;
  ItemBloc({required this.itemRepository}) : super(ItemInitial());

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    if (event is ItemLoad) {
      try {
        final item = await itemRepository.getItem();
        yield ItemLoadedState(item: item);
      } catch (e) {
        yield ItemFailureState(message: "$e");
      }
    }
  }
}
