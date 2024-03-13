import "package:flutter/material.dart";

class CategoryModel {
  const CategoryModel(
      {required this.title, required this.id, this.color = Colors.amber});
  final String id,title;
  final Color color;
}
