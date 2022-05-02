import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zarda_app/widgets/cards/card2.dart';

import '../widgets/cards/card3.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Icon(Icons.shopping_cart_outlined),
            Text(
              " My Cart",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Theme.of(context).primaryColor,
            endIndent: 280,
            thickness: 2,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Card3(index: index),
              itemBuilder: (context, index) => SizedBox(height: 10),
              itemCount: 1 + 1,
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Theme.of(context).primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "Total: ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "40 DNT",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Proceed to payout",
                        style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).primaryColor),
                      )),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
