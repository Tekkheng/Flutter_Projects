import 'package:shopping/data/category.dart';
import 'package:shopping/models/category.dart';
import 'package:shopping/models/grocery.dart';

final groceryItems = [
  GroceryModel(
    id: 'a',
    name: 'Milk',
    quantity: 1,
    category: categories[Categories.dairy]!,
  ),
  GroceryModel(
    id: 'b',
    name: 'Bananas',
    quantity: 5,
    category: categories[Categories.fruit]!,
  ),
  GroceryModel(
    id: 'c',
    name: 'Beef Steak',
    quantity: 1,
    category: categories[Categories.meat]!,
  ),
];
