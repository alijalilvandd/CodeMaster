import 'package:cached_network_image/cached_network_image.dart';
import 'package:codemaster/widgets/my_widgets.dart';
import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/constant/my_string.dart';
import 'package:codemaster/fake_data.dart/fake_data_ads.dart';
import 'package:codemaster/pages/profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SingleAdsPage extends StatefulWidget {
  final String userimg;
  final String creatBy;
  final String typeOfFile;
  final String imageIcon;
  const SingleAdsPage(
      {super.key,
      required this.userimg,
      required this.creatBy,
      required this.typeOfFile,
      required this.imageIcon});

  @override
  State<SingleAdsPage> createState() => _SingleAdsPageState();
}

class _SingleAdsPageState extends State<SingleAdsPage>
    with SingleTickerProviderStateMixin {
  List<dynamic> imageList = [
    "https://www.codester.com/static/uploads/items/000/037/37867/preview/002.jpg",
    "https://www.codester.com/static/uploads/items/000/033/33425/preview/001.jpg",
    "https://www.codester.com/static/uploads/items/000/033/33425/preview/002.jpg",
    "https://www.codester.com/static/uploads/items/000/033/33425/preview/003.jpg",
    "https://www.codester.com/static/uploads/items/000/033/33425/preview/004.jpg",
    "https://www.codester.com/static/uploads/items/000/033/33425/preview/005.jpg"
  ];
  PageController pageController = PageController(initialPage: 0);

  late AnimationController animationController;

  bool isliked = false;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: appBarAds(context, "Ad Details"),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    stackHeader(context, animationController, isliked, isSaved,
                        widget.userimg, widget.creatBy),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.creatBy,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            r"$35",
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    typeOfFile(),
                    buyButton(),
                    description(),

                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: Text(
                        MyString.similarProgram,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    
                    similarProgramList(),

                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: Text(
                        MyString.coments,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    comentsList(),

                    const Divider(
                      color: MyColors.primaryColor,
                      height: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ]),
            )));
  }

  Padding buyButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: MyColors.buttonColorSinglePage,
        ),
        child:const Padding(
          padding:  EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                "Buy",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.download,
                color: Colors.white,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding typeOfFile() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.typeOfFile,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 80,
                child: RatingBar.builder(
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemSize: 15,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    //print(rating);
                  },
                ),
              )
            ],
          ),
          Image.asset(
            widget.imageIcon,
            height: 30,
          ),
        ],
      ),
    );
  }

  Padding comentsList() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(180),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/kouper.jpg"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "kouper",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 SizedBox(
                  width: MediaQuery.of(context).size.width/1.7,
                   child:const Text(
                    "The designs are special and reasonably priced",
                    style: TextStyle(color: Color.fromARGB(255, 128, 128, 128)),
                                   ),
                 ),
                const Row(
                  children:  [
                    Icon(
                      Icons.replay,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SizedBox similarProgramList() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: popularAdsList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SingleAdsPage(
                    userimg: popularAdsList[index].userImage!,
                    creatBy: popularAdsList[index].creatBy!,
                    typeOfFile: popularAdsList[index].fileType!,
                    imageIcon: popularAdsList[index].typeImage!,
                  ),
                ));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(index == 0 ? 10 : 0, 10, 20, 10),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        image: DecorationImage(
                            image: AssetImage(popularAdsList[index].image!),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        popularAdsList[index].title!,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                popularAdsList[index].price!,
                                style: const TextStyle(color: Colors.green),
                              ),
                              Image.asset(
                                popularAdsList[index].typeImage!,
                                height: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Padding description() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        //height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ]),
        child:const Padding(
          padding:  EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                MyString.description,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '''All images are just used for Preview Purpose Only. They are not part of the template and NOT included in the final purchase files. Complete source files in Documentation.''',
                style: TextStyle(color: Color.fromARGB(255, 128, 128, 128)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget stackHeader(
      BuildContext context,
      AnimationController animationController,
      bool isliked,
      bool isSaved,
      String userimg,
      String creatBy) {
    return StatefulBuilder(
      builder: (context, setState) => Stack(children: [
        Container(
          //color: Colors.red,
          height: 280,
        ),
        Column(
          children: [
            SizedBox(
              height: 250,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: (value) {},
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: imageList[index],
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      );
                    },
                    placeholder: (context, url) => loading(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.image_not_supported_outlined,
                      size: 60,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: imageList.length,
              effect: const WormEffect(
                spacing: 5,
                radius: 10,
                dotWidth: 10,
                dotHeight: 10,
                dotColor: Colors.grey,
                activeDotColor: MyColors.primaryColor,
              ),
              onDotClicked: (newVal) {
                pageController.animateToPage(newVal,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            height: 250,
            width: 50,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: GradiantColors.backgroundColorSinglePage,
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (isSaved) {
                          isSaved = false;
                        } else {
                          isSaved = true;
                        }
                      });
                    },
                    icon: isSaved
                        ? const Icon(Icons.bookmark,
                            color: Colors.black, size: 24)
                        : const Icon(Icons.bookmark_border,
                            color: Colors.white, size: 24)),
                IconButton(
                  onPressed: () async {
                    await Share.share(
                        "Share your work with CodeMaster and earn money");
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _dialogBuilder(context);
                  },
                  icon: const Icon(
                    Icons.comment,
                    color: Colors.white,
                  ),
                ),
                AnimatedBuilder(
                  animation: CurvedAnimation(
                      parent: animationController, curve: Curves.bounceInOut),
                  builder: (context, child) {
                    return IconButton(
                        onPressed: () {
                          if (isliked) {
                            isliked = false;
                            animationController.reverse();
                          } else {
                            isliked = true;
                            if (!animationController.isCompleted) {
                              animationController.forward();
                            }
                          }
                        },
                        icon: isliked
                            ? Opacity(
                                opacity: animationController.value !=
                                        animationController.lowerBound
                                    ? animationController.value
                                    : 1,
                                child: Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red,
                                  size: animationController.value !=
                                          animationController.lowerBound
                                      ? animationController.value * 24
                                      : 24,
                                ),
                              )
                            : Opacity(
                                opacity: animationController.value !=
                                        animationController.lowerBound
                                    ? animationController.value
                                    : 1,
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: animationController.value !=
                                          animationController.lowerBound
                                      ? animationController.value * 24
                                      : 24,
                                ),
                              ));
                  },
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 200,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserProfille(
                  img: userimg,
                  name: creatBy,
                ),
              ));
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  image: DecorationImage(
                      image: AssetImage(userimg), fit: BoxFit.cover)),
            ),
          ),
        )
      ]),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Comment'),
          content: Container(
            height: 60,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 8,
                    offset: const Offset(0, 0.5),
                  ),
                ]),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "comment",
                  hintStyle: const TextStyle(color: Colors.grey, height: 2.8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none),
                  prefixIcon: const Icon(
                    Icons.comment,
                    color: MyColors.primaryColor,
                  )),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyColors.primaryColor)),
              child: const Text(
                'submit',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyColors.primaryColor)),
              child: const Text(
                'back',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
