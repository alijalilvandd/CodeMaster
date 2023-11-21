// ignore_for_file: no_logic_in_create_state, prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:codemaster/Models/ad_models.dart';
import 'package:codemaster/widgets/my_widgets.dart';
import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/constant/my_string.dart';
import 'package:codemaster/fake_data.dart/fake_data_ads.dart';
import 'package:codemaster/pages/ads/single_ads.dart';
import 'package:codemaster/pages/ads/show_more_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeAdsPage extends StatefulWidget {
  final categoriList;
  const HomeAdsPage({super.key, required this.categoriList});

  @override
  State<HomeAdsPage> createState() => _HomeAdsPageState(categoriList);
}

class _HomeAdsPageState extends State<HomeAdsPage> {
  List categoriList;
  _HomeAdsPageState(this.categoriList);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme= Theme.of(context).textTheme;
    
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // toolbarHeight: 80,
          // backgroundColor: Colors.white,
          // elevation: 0,
          
          title: SizedBox(
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const SizedBox(
                  width: 10,
                  height: 20,
                )
              ],
            ),
          ),
        ),
        
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  MyString.reletedCategoris,
                  style: TextStyle(
                      color: MyColors.categoriTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              
              categorisList(categoriList),
              
              sellingItemsAndShowMoreText(context, Icons.money_off ,textTheme,MyString.freeProgramHomePage,freeAdList),
              
              
              adsLisHome(context,size,freeAdList,textTheme),
             
              const SizedBox(
                height: 30,
              ),
              
             
              sellingItemsAndShowMoreText(context, Icons.favorite_border ,textTheme,MyString.popularItems,popularAdsList),
              
              adsLisHome(context,size,popularAdsList,textTheme),
              
              const SizedBox(
                height: 30,
              ),
          
              sellingItemsAndShowMoreText(context,Icons.star_border ,textTheme,MyString.bestSellingItems,bestSellAdsList),
              
              adsLisHome(context,size,bestSellAdsList,textTheme),
              
              const SizedBox(
                height: 30,
              ),
              
              sellingItemsAndShowMoreText(context, Icons.subtitles_outlined ,textTheme,MyString.newreleases,popularAdsList),
              
              
              adsLisHome(context,size,popularAdsList,textTheme),
              
              
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  

  Padding sellingItemsAndShowMoreText(BuildContext context,IconData? icon,TextTheme textTheme,String title,List<AdModel> adsList) {
    return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                       Container(
                    //margin: const EdgeInsets.only(left: 10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(180)),
                    child:  Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                   Padding(
                    padding:const EdgeInsets.all(8),
                    child: Text(
                      title,
                      style: textTheme.headline2
                    ),
                  )
                    ],
                  ),
                   GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowMoreAds(adsList: adsList),));
                      closeKeyboard(context);
                    },
                     child:const Text(
                          MyString.showMore,
                          style: TextStyle(
                              color: MyColors.primaryColor, fontSize: 14),
                      ),
                   )
                ],
              ),
            );
  }

  SizedBox adsLisHome(BuildContext context,Size size,List<AdModel> adsList,TextTheme textTheme) {
    return SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: adsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  
                      SingleAdsPage(
                        userimg: adsList[index].userImage!,
                        creatBy: adsList[index].creatBy!,
                        typeOfFile: adsList[index].fileType!,
                        imageIcon:  adsList[index].typeImage!,  
                      ),));
                      closeKeyboard(context);
                    },
                    child: Container(
                      margin:
                          EdgeInsets.fromLTRB(index == 0 ? 10 : 0, 10, 20, 10),
                      height: size.height/3,
                      width: 280,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Container(
                                height: 110,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6)),
                                  image: DecorationImage(
                                      image: AssetImage(adsList[index].image!), fit: BoxFit.cover),
                                ),
                                
                              ),
                           
                          
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 200,
                                  child: Text(
                                    adsList[index].title!,
                                    style: textTheme.headline3
                                  )),
                              Text(
                                adsList[index].price!,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                     Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(adsList[index].typeImage!),fit: BoxFit.cover
                                          )),
                                        ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(adsList[index].fileType!),
                                  ],
                                ),
                                SizedBox(
                                  width: 80,
                                  child: RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemSize: 15,
                                    
                                    itemBuilder: (context, _) =>const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
  }

  SizedBox categorisList(List categoriList) {
    return SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: categoriList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(180),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.2,
                                  blurRadius: 0.5,
                                  offset: const Offset(0, 0.5),
                                )
                              ]),
                          child: Center(
                            child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(categoriList[index].image!),
                                      )),
                                    ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          categoriList[index].title!,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
  }
}
