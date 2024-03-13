import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { work, traveling, sd, dd }

const uuid = Uuid();

final iconCategory = {
  Category.work: Icons.work,
  Category.traveling: Icons.airplanemode_active,
};

final formatter = DateFormat.yMd();

class ExpenseModels {
  ExpenseModels({
    required this.title,
    required this.price,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String title, id;
  final double price;
  final DateTime date;
  final Category category;

  String get formatDate {
    return formatter.format(date);
  }
}
