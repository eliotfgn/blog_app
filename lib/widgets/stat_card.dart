import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatCard extends StatefulWidget {
  const StatCard({Key? key}) : super(key: key);

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "17",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 36,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            "Total tasks",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Text("Jan 11 - Feb 11")
        ],
      ),
    );
  }
}
