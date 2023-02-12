import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatCard extends StatefulWidget {
  final String title;
  final int value;

  const StatCard({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(-3, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            widget.value.toString(),
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 62,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("Jan 11 - Feb 11")
        ],
      ),
    );
  }
}
