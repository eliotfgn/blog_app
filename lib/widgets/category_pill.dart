import 'package:flutter/material.dart';

class CategoryPill extends StatefulWidget {
  final String category;
  final bool isSelected;

  const CategoryPill(
      {Key? key, required this.category, required this.isSelected})
      : super(key: key);

  @override
  State<CategoryPill> createState() => _CategoryPillState();
}

class _CategoryPillState extends State<CategoryPill> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: widget.isSelected ? Colors.green : Colors.grey[500],
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
        child: Text(widget.category,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            )),
      ),
    );
  }
}
