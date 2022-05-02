import 'dart:math';

import 'package:flutter/material.dart';

class IngredientsTab extends StatelessWidget {
  const IngredientsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "Ingredients",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      children: [
        LimitedBox(
          maxHeight: 200,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [],
            ),
          ),
        )
      ],
    );
  }
}
