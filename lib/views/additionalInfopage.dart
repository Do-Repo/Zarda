import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zarda_app/main.dart';
import 'package:zarda_app/models/business.dart';
import 'package:zarda_app/models/user.dart';
import 'package:zarda_app/services/authService.dart';

class AdditionalInfo extends StatefulWidget {
  const AdditionalInfo({Key? key}) : super(key: key);

  @override
  State<AdditionalInfo> createState() => _AdditionalInfoState();
}

class _AdditionalInfoState extends State<AdditionalInfo> {
  bool switchValue = false;
  final _formKey = GlobalKey<FormState>();
  final _businessController = TextEditingController();
  final _nameController = TextEditingController();
  UserData ud = UserData(name: "", accountType: 0);
  BusinessData bd = BusinessData(name: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text("Additional info",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(label: Text("Name")),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field required";
                  }
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Client account",
                    style: TextStyle(
                        fontSize: 18,
                        color: (switchValue)
                            ? Colors.black
                            : Theme.of(context).primaryColor),
                  ),
                  Switch(
                      value: switchValue,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                        });
                      }),
                  Text(
                    "Business account",
                    style: TextStyle(
                        fontSize: 18,
                        color: (!switchValue)
                            ? Colors.black
                            : Theme.of(context).primaryColor),
                  ),
                ],
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 200),
                firstChild: TextFormField(
                  controller: _businessController,
                  validator: (value) {
                    if (switchValue) {
                      if (value == null || value.isEmpty) {
                        return "Field required";
                      }
                    }
                  },
                  decoration:
                      const InputDecoration(label: Text("Business name")),
                ),
                secondChild: Container(),
                crossFadeState: (switchValue)
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: TextButton(
                  child: const Text(
                    "Continue shopping",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    ud.accountType = (switchValue) ? 1 : 0;
                    ud.name = _nameController.text;
                    final user = Provider.of<User?>(context, listen: false);
                    await FirebaseFirestore.instance
                        .collection("userData")
                        .doc(user!.uid)
                        .set(ud.toJson());
                    if (switchValue) {
                      bd.name = _businessController.text;
                      await FirebaseFirestore.instance
                          .collection("businesses")
                          .doc()
                          .set(bd.toJson());
                    }
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Skeleton()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
