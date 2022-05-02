import 'package:flutter/material.dart';
import 'package:zarda_app/widgets/verticalLine.dart';

class ShortCutTitle extends StatelessWidget {
  const ShortCutTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        verticalLine(context, 20.0),
        SizedBox(
          width: 5,
        ),
        Text(title,
            style: TextStyle(
              letterSpacing: -0.7,
              wordSpacing: 1,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            )),
        Spacer(),
        TextButton(
          child: Text(
            'view all',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary, fontSize: 14),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
