import 'package:flutter/material.dart';
import 'package:zarda_app/views/articlepage.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticlePage(tag: 'Card3-$index')));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              child: SizedBox(
                  width: 70,
                  height: 70,
                  child: Image.asset("assets/images/Pizza.jpg")),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pizza 4 Saisons",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Price: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text("20 Dnt")
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Quantity: ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text("2")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
