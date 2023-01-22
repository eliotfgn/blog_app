import 'package:blog/models/user_request.dart';
import 'package:blog/screens/login_screen.dart';
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
  bool _loading = false;
  bool _hidePassword = true;

  _register(String email, String username, String password) async {
    print('registering');
    setState(() {
      _loading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
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
        _loading = false;
      });
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
                      child:
                          Image.asset("assets/images/register-page-image.png"),
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
                            controller: _usernameController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: 'Enter your username',
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
                        _register(
                          _emailController.text,
                          _usernameController.text,
                          _passwordController.text,
                        );
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
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Already have an account? Sign in",
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
