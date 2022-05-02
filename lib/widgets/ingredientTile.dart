import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  const IngredientTile({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          SizedBox(width: 10),
          Text(name)
        ],
      ),
    );
  }
}
