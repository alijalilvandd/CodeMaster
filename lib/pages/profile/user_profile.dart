
import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/fake_data.dart/fake_data_ads.dart';
import 'package:codemaster/pages/ads/single_ads.dart';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class UserProfille extends StatelessWidget {
   final String name;
  final String img;
  const UserProfille({super.key, required this.name, required this.img});
 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: appBarUserProfilePage(size, context,name),
        body: SingleChildScrollView(
          //primary: false,
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userImageSection(img),
                saleAndUpload(),
                followAndGetEmail(),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  color: MyColors.primaryColor,
                  height: 5,
                ),
                typeOfFile(),
                const Divider(
                  color: MyColors.primaryColor,
                  height: 5,
                ),
                socialChanell(),

                otherWorks(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container userImageSection(String img) {
    return Container(
      height: 200,
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(img), fit: BoxFit.cover)),
    );
  }

  Padding saleAndUpload() {
    return const Padding(
      padding:  EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children:  [
              Text(
                r"$90",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "sale",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
              )
            ],
          ),
          Row(
            children:  [
              Text(
                "15",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Padding(
                padding:  EdgeInsets.all(5),
                child: Text(
                  "Upload",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ),
              Icon(
                Icons.upload,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }

  Padding followAndGetEmail() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text(
                  "Follow",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  AppBar appBarUserProfilePage(Size size, BuildContext context,String name) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: MyColors.userpageMenuColor,
                      ),
                    ),
                   
                     Text(
                      name,
                      style:const TextStyle(
                          color: MyColors.userpageMenuColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () async{
                        await Share.share("Share your work with CodeMaster and earn money");
                      },
                      icon: const Icon(
                        Icons.share,
                        color: MyColors.userpageMenuColor,
                      ),
                    ),
                   
                    IconButton(
                      onPressed: () {
                        showModelBottonSheet(
                        context,
                        size,
                      );
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        color: MyColors.userpageMenuColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Padding typeOfFile() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children:  [
              Icon(
                Icons.insert_drive_file_outlined,
                color: Colors.grey,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Type of Files",
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/flutter.png",
                height: 30,
              ),
              Image.asset(
                "assets/images/android.png",
                height: 30,
              )
            ],
          )
        ],
      ),
    );
  }

  Padding socialChanell() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children:  [
              Icon(
                Icons.people,
                color: Colors.grey,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Social Chanell",
              )
            ],
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/instagram.png",
                height: 30,
              ),
              Image.asset(
                "assets/images/twitter.png",
                height: 30,
              ),
              Image.asset(
                "assets/images/pinterest.png",
                height: 30,
              ),
            ],
          )
        ],
      ),
    );
  }

  ListView otherWorks(Size size) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        //scrollDirection: Axis.vertical,
        itemCount: adList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: (() {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  
                SingleAdsPage(
                  userimg: popularAdsList[index].userImage!,
                  creatBy: popularAdsList[index].creatBy!,
                  typeOfFile: popularAdsList[index].fileType!,
                  imageIcon: popularAdsList[index].typeImage!,
                ),
              ));
            }),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8,8,0,8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage(popularAdsList[index].image!), fit: BoxFit.cover),
                        ),
                      ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: SizedBox(
                      width: size.width / 1.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: size.width / 1.8,
                              child: Text(
                                adList[index].title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              adList[index].fileType!,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  adList[index].date!,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 97, 97, 97)),
                                ),
                                Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      //color: ,
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 5, 8, 5),
                                      child: Text(adList[index].price!,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 11, 11, 11))),
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
        }));
  }

  Future<dynamic> showModelBottonSheet(
    BuildContext context,
    Size size,
  ) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: ((context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter mystate) {
            //var isCheck=false;
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                  height: size.height / 3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_drop_up,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: size.height / 4.5,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Profile Option",
                                style: TextStyle(fontSize: 25),
                              ),
                              Text(
                                "Reort",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                "Block",
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            );
          });
        }));
  }
}
