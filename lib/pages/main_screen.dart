

import 'package:codemaster/widgets/my_widgets.dart';
import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/pages/ads/add_ads.dart';
import 'package:codemaster/pages/home/home_page.dart';
import 'package:codemaster/pages/notification/notification.dart';
import 'package:codemaster/pages/profile/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationkey = GlobalKey();
  int page = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> pages=[
    const HomePage(),
    const AddAds(),
    const Notifications(),
    const Profile()
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: MyColors.primaryColor, // navigation bar color
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icon color
    systemNavigationBarIconBrightness: Brightness.light, // color of navigation controls
  ));
    var size=MediaQuery.of(context).size;
    return  SafeArea(
      child: GestureDetector(
        onTap: () => closeKeyboard(context),
        child: Scaffold(
          key: _key,
          drawer:page==0? drawerHome(context): null,
          appBar:page==0? appBarHome(size, context,_key):null,
          body: PageStorage(
            bucket: bucket, 
            child: pages[page]
          ),
         bottomNavigationBar: bottomNavigation(),
        ),
      )
    );
  }

  Container bottomNavigation() {
    return Container(
        
        color: const Color.fromARGB(0, 23, 206, 23),
         child: CurvedNavigationBar(
              key: _bottomNavigationkey,
              index: page,
              height: 55,
              items: const <Widget> [
                Icon(Icons.home, size: 30,color: Colors.white,),
                Icon(Icons.add , size: 30,color: Colors.white,),
                Icon(Icons.favorite,size: 30,color: Colors.white,),
                Icon(Icons.person,size: 30,color: Colors.white,)
              ],
              color: MyColors.primaryColor,
              buttonBackgroundColor: MyColors.primaryColor2,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration:const Duration(milliseconds: 600),
              onTap: (index) {
                setState(() {
                  page=index;
                });
              },
              letIndexChange: (index) => true,
            ),
       );
  }
}