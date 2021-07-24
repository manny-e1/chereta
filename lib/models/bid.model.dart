import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Bid extends Equatable {
  Bid({this.id, required this.bidder, required this.amount});

  final String? id;
  final num amount;
  final Map<String, dynamic> bidder;

  @override
  List<Object> get props => [id!, bidder, amount];

  factory Bid.fromJson(Map<String, dynamic> json) {
    return Bid(id: json['_id'], bidder: json['bidder'], amount: json['amount']);
  }
}
