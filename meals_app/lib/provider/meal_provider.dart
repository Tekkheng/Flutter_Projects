import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/data.dart';

final mealProvider = Provider((ref) => mealsData);
// final mealProvider = Provider(
//   (ref) {
//     return mealsData;
//   },
// );
