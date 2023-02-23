import 'package:blog/screens/home_screen.dart';
import 'package:blog/screens/login_screen.dart';
import 'package:blog/screens/register_screen.dart';
import 'package:blog/services/storage_service.dart';
import 'package:blog/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/tasks_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.routeName,
      //initialRoute: StorageService.isAuthenticated()
      //    ? HomeScreen.routeName
      //    : LoginScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        TasksScreen.routeName: (context) => const TasksScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: createMaterialColor(const Color(0xfff459507))),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "AvenirNext",
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
