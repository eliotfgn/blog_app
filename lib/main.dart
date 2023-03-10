import 'dart:io';

import 'package:blog/screens/create_task_screen.dart';
import 'package:blog/screens/home_screen.dart';
import 'package:blog/screens/login_screen.dart';
import 'package:blog/screens/notifications_screen.dart';
import 'package:blog/screens/register_screen.dart';
import 'package:blog/services/storage_service.dart';
import 'package:blog/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/tasks_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
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
        CreateTaskScreen.routeName: (context) => CreateTaskScreen(),
        NotificationsScreen.routeName: (context) => const NotificationsScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
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
