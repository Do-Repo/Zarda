import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zarda_app/models/user.dart';
import 'package:zarda_app/services/authService.dart';
import 'package:zarda_app/services/dbService.dart';

import 'package:zarda_app/theme.dart';
import 'package:zarda_app/views/addProductpage.dart';
import 'package:zarda_app/views/additionalInfopage.dart';
import 'package:zarda_app/views/bookmarkpage.dart';
import 'package:zarda_app/views/homepage.dart';
import 'package:zarda_app/views/logInpage.dart';
import 'package:zarda_app/views/searchpage.dart';
import 'package:zarda_app/views/signUppage.dart';
import 'package:zarda_app/widgets/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeModel().lightTheme,
        debugShowCheckedModeBanner: false,
        home: const Wrapper(),
      ),
    );
  }
}

class Skeleton extends StatefulWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  int selectedIndex = 0;

  PageController? _pageController;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<IconData> iconList = [
    Feather.home,
    Feather.search,
    Feather.heart,
    Feather.user
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController!.jumpToPage(index);
  }

  Future _onWillPop() async {
    if (selectedIndex != 0) {
      setState(() => selectedIndex = 0);
      _pageController!.animateToPage(0,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    } else {
      await SystemChannels.platform
          .invokeMethod<void>('SystemNavigator.pop', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final DBService db = DBService();
    return MultiProvider(
      providers: [
        StreamProvider(
            create: (context) => db.getUserData(user!.uid), initialData: null)
      ],
      child: WillPopScope(
        onWillPop: () async => await _onWillPop(),
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: HomeAppBar(context),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            allowImplicitScrolling: false,
            controller: _pageController,
            children: <Widget>[
              Homepage(),
              SearchPage(),
              Favorites(),
              Container()
            ],
          ),
          bottomNavigationBar: _bottonNavigationBar(context),
        ),
      ),
    );
  }

  AnimatedBottomNavigationBar _bottonNavigationBar(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      gapLocation: GapLocation.none,
      activeIndex: selectedIndex,
      iconSize: 22,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      activeColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      inactiveColor:
          Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      splashColor: Theme.of(context).primaryColor,
      onTap: (index) => onItemTapped(index),
    );
  }
}

class AuthSkeleton extends StatefulWidget {
  const AuthSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthSkeleton> createState() => _AuthSkeletonState();
}

class _AuthSkeletonState extends State<AuthSkeleton>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            LoginPage(tabController: _tabController),
            SignUpPage(tabController: _tabController)
          ]),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    CollectionReference userData =
        FirebaseFirestore.instance.collection('userData');
    return (user == null)
        ? AuthSkeleton()
        : FutureBuilder(
            future: userData.doc(user.uid).get(),
            builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Container();
              }
              if (snapshot.hasData && !snapshot.data!.exists) {
                return AdditionalInfo();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                if (data['name'] == null || data['name'].toString().isEmpty) {
                  return AdditionalInfo();
                } else {
                  return Skeleton();
                }
              }
              return Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                )),
              );
            }));
  }
}
