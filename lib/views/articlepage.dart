import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zarda_app/widgets/ingredientsTab.dart';
import 'package:zarda_app/widgets/priceCard.dart';

import '../widgets/bookmarkIcon.dart';
import '../widgets/addToCart.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key, required this.tag}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
  final String tag;
}

class _ArticlePageState extends State<ArticlePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        bottom: true,
        top: false,
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            Expanded(
                child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  elevation: 5,
                  pinned: true,
                  expandedHeight: 290,
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Hero(
                          tag: widget.tag,
                          child: Image.asset(
                            "assets/images/165384.jpg",
                            fit: BoxFit.cover,
                          ))),
                  actions: <Widget>[
                    const SizedBox(width: 15),
                    CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.white.withOpacity(0.7),
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(Icons.arrow_back_ios_sharp,
                            size: 18, color: Colors.grey[900]),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.white.withOpacity(0.7),
                      child: IconButton(
                        icon: Icon(Icons.share,
                            size: 18, color: Colors.grey[900]),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 15)
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: <Widget>[
                                    Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground),
                                        child: AnimatedPadding(
                                          duration:
                                              Duration(milliseconds: 1000),
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 5,
                                              bottom: 5),
                                          child: Text(
                                            "fast food",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )),
                                    Spacer(),
                                    BookmarkIcon(
                                      iconSize: 22,
                                      scaffoldKey: scaffoldKey,
                                      iconColor: Colors.blueGrey,
                                      normalIconColor: Colors.grey,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                const Text(
                                  "Hamburger",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.6,
                                      wordSpacing: 1),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.time_solid,
                                      color: Colors.grey[400],
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "2 days ago",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                  endIndent: 280,
                                  thickness: 2,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porttitor augue dolor, ultrices vulputate lorem vestibulum eu. Nullam luctus interdum volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porttitor augue dolor, ultrices vulputate lorem vestibulum eu. Nullam luctus interdum volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porttitor augue dolor, ultrices vulputate lorem vestibulum eu. Nullam luctus interdum volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porttitor augue dolor, ultrices vulputate lorem vestibulum eu. Nullam luctus interdum volutpat. "),
                                ),
                                IngredientsTab(),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    PriceCard(),
                                    SizedBox(width: 10),
                                    Flexible(child: OrderNow()),
                                  ],
                                ),
                                const SizedBox(height: 15)
                              ]))
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
