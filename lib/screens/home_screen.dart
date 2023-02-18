import 'package:blog/models/new_task.dart';
import 'package:blog/services/task_service.dart';
import 'package:blog/widgets/stat_card.dart';
import 'package:blog/widgets/stat_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text(
            "ToDo",
            style: StyleConstants.appBarTitle,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: const BottomNavigation(0),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(
                        "Create, organise and follow your tasks in one place.",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.clip,
                            height: 1.4),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          Image.asset("assets/images/home-hero.png"),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2))),
                  child: Text(
                    "Your stats",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                Row(
                  children: const [
                    Expanded(
                      child: StatCard(
                        title: "Total tasks",
                        value: 17,
                      ),
                    ),
                    Expanded(
                      child: StatCard(
                        title: "Completed tasks",
                        value: 5,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const StatTile(
                  title: "Not started",
                  value: 5,
                ),
                const SizedBox(
                  height: 25,
                ),
                const StatTile(
                  title: "Pending",
                  value: 4,
                ),
                const SizedBox(
                  height: 25,
                ),
                const StatTile(
                  title: "Lately completed",
                  value: 8,
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ));
  }
}
