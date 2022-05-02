import 'package:flutter/material.dart';

import '../services/authService.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String email = "", password = "", password2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Email address"),
                ),
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field required";
                  }
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(label: Text("Password")),
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field required";
                  }
                  if (value.length < 8) {
                    return "Password must be atleast 8 characters";
                  }
                },
              ),
              TextFormField(
                obscureText: true,
                decoration:
                    const InputDecoration(label: Text("Verify Password")),
                onChanged: (value) {
                  password2 = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field required";
                  }
                  if (value.length < 8) {
                    return "Password must be atleast 8 characters";
                  }
                  if (value != password) {
                    return "Passwords don't match";
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Row(
                              children: [
                                CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor),
                                const SizedBox(width: 10),
                                const Text('Creating account'),
                              ],
                            )),
                          );
                          await AuthService().signUp(email, password);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    widget.tabController.animateTo(0);
                  },
                  child: const Text("Already have an account? Sign in now!"))
            ],
          ),
        ),
      ),
    );
  }
}
