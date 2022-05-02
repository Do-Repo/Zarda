import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              style: BorderStyle.solid,
              color: Theme.of(context).primaryColor,
              width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price: ",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            Text(
              "30" + " DNT" + "",
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
