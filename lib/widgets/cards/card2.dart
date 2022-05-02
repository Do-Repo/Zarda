import 'package:flutter/material.dart';
import 'package:zarda_app/views/articlepage.dart';

class Card2 extends StatelessWidget {
  const Card2(
      {Key? key,
      required this.index,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);
  final int index;
  final String title, subtitle, image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticlePage(tag: 'card2-$index')));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(offset: Offset(2, 2), blurRadius: 2, color: Colors.grey)
            ]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              child: SizedBox(
                width: 70,
                height: 70,
                child: Hero(
                    tag: 'card2-$index',
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                ))
          ],
        ),
      ),
    );
  }
}
