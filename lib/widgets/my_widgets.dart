// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/pages/purchaseRecords/purchase_records.dart';
import 'package:codemaster/pages/ads/saved_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

SpinKitFadingCube loading() {
  return const SpinKitFadingCube(
    color: MyColors.primaryColor,
    size: 20,
  );
}

AppBar appBarAds(BuildContext context, String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.circular(180)),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          title,
          style: const TextStyle(color: MyColors.homeTitleColors, fontSize: 18),
        )
      ],
    ),
  );
}

closeKeyboard(BuildContext context) {
  final FocusScopeNode currentScope = FocusScope.of(context);
  if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}

myLaunchUrl(String uri) async {
  var url = Uri.parse(uri);

  if (await launchUrl(url)) {
    await launchUrl(url);
  } else {
    log("could not launch $url");
  }
}

AppBar appBarHome(
    Size size, BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      key.currentState!.openDrawer();
                      closeKeyboard(context);
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    )),
                Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "search",
                        hintStyle:
                            const TextStyle(color: Colors.grey, height: 3.5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: MyColors.primaryColor,
                        )),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PurchaseRecords(),
                      ));
                      closeKeyboard(context);
                    },
                    icon: const Icon(Icons.shopping_cart_outlined))
              ],
            ),
          ),
        ),
      ]);
}

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: MyColors.homeTitleColors,
          fontSize: 16,
          fontWeight: FontWeight.bold),
      headline3: TextStyle(
          color: MyColors.homeTitleColors,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      headline4:
          TextStyle(color: Color.fromARGB(255, 128, 128, 128), fontSize: 20),
      headline5: TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        //color: Colors.black
      ),
    ),
  );
}

Drawer drawerHome(BuildContext context) {
  return Drawer(
      shadowColor: Colors.black,
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: GradiantColors.primaryColorback)),
            child: const DrawerHeader(
              child: ImageIcon(
                AssetImage("assets/images/logo.png"),
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SavedAdsPage(),
              ));
              closeKeyboard(context);
            },
            title: const Text(
              "Saved",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 74, 73, 73),
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(Icons.bookmark_border),
          ),
          const Divider(
            color: MyColors.primaryColor,
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              "messages",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 74, 73, 73),
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(Icons.message),
          ),
          const Divider(
            color: MyColors.primaryColor,
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              "About Us",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 74, 73, 73),
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(Icons.person_2),
          ),
          const Divider(
            color: MyColors.primaryColor,
          ),
          ListTile(
            onTap: () async {
              await Share.share(
                  "Share your work with CodeMaster and earn money");
            },
            title: const Text(
              "Share",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 74, 73, 73),
                fontWeight: FontWeight.w500,
              ),
            ),
            leading: const Icon(Icons.share),
          ),
        ],
      ));
}
