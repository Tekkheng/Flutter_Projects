import 'package:flutter/material.dart';

class MealItemsTrait extends StatelessWidget {
  const MealItemsTrait({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 2,
        ),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ],
    );
  }
}
