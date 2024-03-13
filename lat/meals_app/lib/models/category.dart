import 'package:flutter/material.dart';

class CategoryModel {
  const CategoryModel(
      {required this.id, required this.title, this.color = Colors.amber});
  final String id, title;
  final Color color;
}
