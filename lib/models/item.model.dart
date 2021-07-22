import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Item extends Equatable {
  Item(
      {required this.id,
      required this.title,
      required this.coverImage,
      required this.description,
      required this.deadline,
      required this.owner});

  final Map<String, dynamic> owner;
  final String id, title, description, deadline, coverImage;

  @override
  List<Object> get props =>
      [id, title, description, deadline, coverImage, owner];

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['_id'],
        title: json['title'],
        description: json['description'],
        owner: json['owner'],
        deadline: json['deadline'],
        coverImage: json['coverImage']);
  }
  @override
  String toString() =>
      'Post { id:$id, owner:$owner, title: $title, deadline: $deadline, coverImage: $coverImage }';
}
