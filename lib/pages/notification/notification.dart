
// ignore_for_file: deprecated_member_use

import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/fake_data.dart/fake_data_person.dart';
import 'package:codemaster/pages/profile/user_profile.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    var textTheme=Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(180),
                color: MyColors.primaryColor,
              ),
              child:const Icon(Icons.favorite_border,color: Colors.white,),
            ),
          ),
          title:const Text("Liked And Comment",style: TextStyle(color: MyColors.homeTitleColors),),
        ),
        body: notificationList(size, textTheme),
      )
    );
  }

  SizedBox notificationList(Size size, TextTheme textTheme) {
    return SizedBox(
        child:  ListView.builder(
          physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: personList.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding:const EdgeInsets.only(top: 5,right: 0,left: 5),
                child: GestureDetector(
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  UserProfille(img: personList[index].image!,name: personList[index].name!,),));
                  }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),
                              image: DecorationImage(image: AssetImage(personList[index].image!),fit: BoxFit.cover)
                            ),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: SizedBox(
                          
                          width: size.width/1.4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: size.width/1.9,
                                  child: Text(personList[index].name!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style:const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                ),
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: Text(personList[index].event!,
                                      style: textTheme.headline5,
                                      )
                                    ),
                                    
                                    
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        //color: ,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(8,5,8,5),
                                        child: Image(
                                          image: AssetImage(personList[index].liked!),)
                                        //Color.fromARGB(255, 250, 252, 253)),),
                                      )),
                                  ],
                                ),

                                Text(personList[index].date!,style: const TextStyle(color: Color.fromARGB(255, 97, 97, 97)),),
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
        
      );
  }
}