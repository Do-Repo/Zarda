import 'package:flutter/material.dart';

class OrderNow extends StatelessWidget {
  const OrderNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              Text(
                "Add to cart",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ))),
    );
  }
}
