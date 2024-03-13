import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/data.dart';

final meals = Provider((ref) => mealsData);
