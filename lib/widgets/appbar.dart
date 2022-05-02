import 'package:flutter/material.dart';
import 'package:zarda_app/services/authService.dart';
import 'package:zarda_app/views/shoppingCartpage.dart';

AppBar HomeAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Text(""),
    actions: [
      IconButton(
          onPressed: () {
            AuthService().signOut();
          },
          icon: const Icon(Icons.logout)),
      IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CartPage()));
          },
          icon: const Icon(Icons.shopping_cart_outlined))
    ],
  );
}
