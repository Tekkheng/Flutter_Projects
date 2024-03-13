import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/new_item.dart';

class NewItemScreen extends StatelessWidget {
  const NewItemScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add New Item')),
      ),
      body: const NewItem(),
    );
  }
}
