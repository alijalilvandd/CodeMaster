

import 'package:codemaster/widgets/my_widgets.dart';
import 'package:codemaster/fake_data.dart/fake_data_ads.dart';
import 'package:flutter/material.dart';

class PurchaseRecords extends StatelessWidget {
  const PurchaseRecords({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBarAds(context,"Latest purchases"),
        body:SizedBox(
          child:  ListView.builder(
            physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: adList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding:const EdgeInsets.only(top: 10,right: 20,left: 5),
                  child: GestureDetector(
                    onTap: (() {
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: size.width/4,
                          height: 100,
                          child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: AssetImage(adList[index].image!),fit: BoxFit.cover)
                              ),
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: SizedBox(
                            width: size.width/1.7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    child: Text(adList[index].title!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style:const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(adList[index].fileType!,style:const TextStyle(color: Colors.grey),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(adList[index].date!,style: const TextStyle(color: Color.fromARGB(255, 97, 97, 97)),),
                                      
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),
                                          //color: ,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(8,5,8,5),
                                          child: Text(adList[index].price!,style:const TextStyle(color: Color.fromARGB(255, 11, 11, 11))),
                                          //Color.fromARGB(255, 250, 252, 253)),),
                                        )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
            })
            )
          
        )
      )
    );
  }
}