import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zarda_app/models/user.dart';
import 'package:zarda_app/services/dbService.dart';
import 'package:zarda_app/views/addProductpage.dart';
import 'package:zarda_app/widgets/cards/card1.dart';
import 'package:zarda_app/widgets/cards/card2.dart';
import 'package:zarda_app/widgets/shortCutTitle.dart';
import 'package:zarda_app/widgets/welcomeCard.dart';

var titles = [
  "Pizza 4 Saisons",
  "Plat Tounsi",
  "Poisson Rouge",
  "Hamburger",
  "Baguette"
];

var subtitles = ["10 KM", "15 KM", "30 KM", "120 KM", "150 KM"];

var subtitles2 = [
  "Delicious pizza overal the best you've ever had",
  "Plat Tounsi like you've never had before, only one way out",
  "Poisson Rouge out of the best seas in the Middle-East",
  "American Hamburger live you've never had before",
  "French Baguette straight out of Paris most famous bakery"
];

var images = [
  "assets/images/Pizza.jpg",
  "assets/images/tounsi.png",
  "assets/images/poisson.jpg",
  "assets/images/165384.jpg",
  "assets/images/baguettte.jpg",
];

class Homepage extends StatelessWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserData?>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: (userData != null && userData.accountType == 1)
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => AddProductPage())));
              },
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.add),
            )
          : const SizedBox(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
            child: WelcomeCard(
              name: (userData == null) ? "" : userData.name,
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ShortCutTitle(title: "Near you"),
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            SizedBox(width: (index == 0) ? 8 : 16),
                        separatorBuilder: (context, i) => Card1(
                              index: i,
                              title: titles[i],
                              subtitle: subtitles[i],
                              images: images[i],
                            ),
                        itemCount: 5 + 1),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ShortCutTitle(title: "Recommended"),
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5 + 1,
                    itemBuilder: (context, index) => SizedBox(height: 10),
                    separatorBuilder: (context, index) => Card2(
                      index: index,
                      title: titles[index],
                      subtitle: subtitles2[index],
                      image: images[index],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
