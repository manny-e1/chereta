import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shopping_cart/constants/url.dart';
import 'package:shopping_cart/models/item.model.dart';

class ItemDataProvider {
  final http.Client httpClient;

  ItemDataProvider({required this.httpClient});

  Future<Item> getItem() async {
    final response = await httpClient.get(
      Uri.parse('$kUrl/items'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
