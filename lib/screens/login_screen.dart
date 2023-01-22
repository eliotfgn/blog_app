import 'dart:io';

import 'package:blog/models/auth_models.dart';
import 'package:blog/screens/register_screen.dart';
import 'package:blog/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;
  bool _loading = false;

  _login(String email, String password) async {
    LoginRequest request = LoginRequest(email, password);
    setState(() {
      _loading = true;
    });

    LoginResponse? res;
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _loading = false;
    });

    try {
      res = await UserService.signin(request);
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'An error occurred!',
          textColor: Colors.blue,
          backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Center(
                      child: Text(
                        "Welcome back!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 40),
                      child: Image.asset("assets/images/login-page-image.png"),
                    ),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: 'Enter your email address',
                                filled: true,
                                fillColor: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _hidePassword,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              hintStyle: const TextStyle(color: Colors.black),
                              hintText: 'Enter your password',
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _hidePassword = !_hidePassword;
                                  });
                                },
                                icon: _hidePassword
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _login(_emailController.text, _passwordController.text);
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                      child: const Text(
                        "Don't have an account? Sign up",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              _loading
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black12,
                      child: Center(
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                          child:
                              const SpinKitFoldingCube(color: Colors.blueGrey),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
