import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_animations/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
