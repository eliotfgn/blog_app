import 'package:blog/models/user_request.dart';
import 'package:blog/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  _register(String email, String username, String password) async {
    print('registering');
    _isLoading = true;
    RegisterRequest payload = RegisterRequest(
      email: email,
      username: username,
      password: password,
    );
    var res;
    try {
      res = await UserService.register(payload);
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'An unexpected problem occurs!',
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }

    if (res != null) {
      Fluttertoast.showToast(msg: 'You have been registered');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              const Text(
                "Welcome back!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          hintText: "Enter your email",
                          fillColor: Color(0xfff5f5f5),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          hintText: "Enter your username",
                          fillColor: Color(0xfff5f5f5),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          hintText: "Enter your password",
                          fillColor: Color(0xfff5f5f5),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: _isLoading
                    ? const SpinKitPulse(
                        color: Colors.red,
                      )
                    : null,
              ),
              ElevatedButton(
                onPressed: () {
                  _register(
                    _emailController.text,
                    _usernameController.text,
                    _passwordController.text,
                  );
                },
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
