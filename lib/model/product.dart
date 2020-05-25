import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String title;
  final String description;
  // final String imageUrl;
  final List<dynamic> images;
  final double price;
  final DateTime expectedDate;
  final DateTime createdDate;
  final DateTime modifiedDate;
  final bool isActive;
  final String userId;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    // @required this.imageUrl,
    @required this.images,
     this.price,
    this.expectedDate,
    this.createdDate,
    this.modifiedDate,
    this.isActive = true,
     this.userId
  });
}