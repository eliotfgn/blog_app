import 'package:flutter/material.dart';

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

  _register(String email, String username, String password) async {
    // var data = await UserService.register(email, username, password);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: Padding(
          padding: const EdgeInsets.all(15),
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
                      keyboardType: TextInputType.text,
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
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _register(
                    _emailController.text,
                    _usernameController.text,
                    _passwordController.text,
                  );
                },
                child: const Text("Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
