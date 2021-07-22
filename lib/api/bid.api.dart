import 'dart:convert';
import 'dart:io';
import 'package:shopping_cart/constants/url.dart';
import 'package:shopping_cart/models/bid.model.dart';
import 'package:http/http.dart' as http;

class BidDataProvider {
  final http.Client httpClient;

  BidDataProvider({required this.httpClient});
  Future<String> createBid(Bid bid, String itemID) async {
    final body = <String, String>{
      "name": bid.bidder["name"],
      "amount": bid.amount.toString(),
      "item": itemID
    };
    final request = http.MultipartRequest('POST', Uri.parse('$kUrl/bids'));
    request.files
        .add(await http.MultipartFile.fromPath('avatar', bid.bidder["avatar"]));
    request.fields.addAll(body);
    final response = await request.send();
    if (response.statusCode == 201) {
      return response.toString();
    } else {
      throw Exception(response);
    }
  }

  Future<Bid> getHighestBid() async {
    final response = await httpClient.get(
      Uri.parse('$kUrl/bids/highest'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return Bid.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
