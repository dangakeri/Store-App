import 'package:flutter/material.dart';

class StoreModel {
  final String title;
  final String description;
  final Image image;
  StoreModel({
    required this.title,
    required this.description,
    required this.image,
  });
  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
        title: json['title'],
        description: json['description'],
        image: json['image']);
  }
}
