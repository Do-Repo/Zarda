import 'package:flutter/material.dart';
import 'package:zarda_app/main.dart';

import '../../views/articlepage.dart';

class Card1 extends StatelessWidget {
  const Card1(
      {Key? key,
      required this.index,
      required this.title,
      required this.subtitle,
      required this.images})
      : super(key: key);
  final int index;
  final String title, subtitle, images;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => ArticlePage(
                  tag: index.toString(),
                ))));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, top: 10),
        height: 300,
        width: 250,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Stack(children: [
            Hero(
              tag: index.toString(),
              child: Image.asset(
                images,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                subtitle: Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.8)
                  ])),
            )
          ]),
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: const Offset(5, 5),
                blurRadius: 7,
                spreadRadius: 1,
              )
            ]),
      ),
    );
  }
}
