import 'package:shopping_cart/api/item.api.dart';
import 'package:shopping_cart/models/item.model.dart';

class ItemRepository {
  final ItemDataProvider itemProvider;

  ItemRepository({required this.itemProvider});

  Future<Item> getItem() async {
    return await itemProvider.getItem();
  }
}
