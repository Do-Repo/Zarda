import 'package:flutter/material.dart';
import 'package:zarda_app/services/authService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = "", password = "";

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
                    return 'Field is required';
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
                      return 'Field is required';
                    }
                  }),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text("Trouble signing in?")),
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
                              const Text('Signing in'),
                            ],
                          )),
                        );
                        await AuthService().signIn(email, password);
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
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    widget.tabController.animateTo(1);
                  },
                  child: const Text("Don't have an account? Sign up now!"))
            ],
          ),
        ),
      ),
    );
  }
}
