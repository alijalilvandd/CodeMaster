
import 'package:codemaster/Models/ad_models.dart';
import 'package:codemaster/widgets/my_widgets.dart';
import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/pages/ads/single_ads.dart';
import 'package:flutter/material.dart';

class ShowMoreAds extends StatelessWidget {
  final List<AdModel> adsList;
  const ShowMoreAds({super.key,required this.adsList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarAds(context,"Show More Ads"),
        body: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10,5,10,0),
            child: GridView.builder(
              physics:const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 30,
                childAspectRatio: 0.9
              ),
              itemCount: adsList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  
                    SingleAdsPage(
                      userimg: adsList[index].userImage!,
                      creatBy: adsList[index].creatBy!,
                      typeOfFile: adsList[index].fileType!,
                      imageIcon: adsList[index].typeImage!,
                    ),));
                  },
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.2,
                            blurRadius: 0.5,
                            offset: const Offset(0, 0.5),
                          )
                        ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                               Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6)),
                                  image: DecorationImage(
                                      image: AssetImage(adsList[index].image!), fit: BoxFit.cover),
                                ),
                                
                              ),
                            const SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 140,
                                    child: Text(adsList[index].title!,
                                    style:const TextStyle(color: MyColors.homeTitleColors,fontSize: 12,fontWeight: FontWeight.w400),)
                                  ),
                                  Image.asset(adsList[index].typeImage!,height: 20,)
                                ],
                              ),
                            )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(3,0,3,3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(adsList[index].price!,style:const TextStyle(color: Colors.green,),),
                                  const Icon(Icons.bookmark_border,color: Colors.amber,)
                                ],
                              ),
                            )
                          ],
                        ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  
}
