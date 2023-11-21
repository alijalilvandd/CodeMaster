// ignore_for_file: deprecated_member_use


import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/constant/my_string.dart';
import 'package:codemaster/fake_data.dart/fake_data_categoris.dart';
import 'package:flutter/material.dart';

class AddAds extends StatelessWidget {
  const AddAds({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
       
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180),
              color: MyColors.primaryColor,
            ),
            child: const Icon(
              Icons.sell_outlined,
              color: Colors.white,
            ),
          ),
        ),
        title: const Text(
          "selling workd",
          style: TextStyle(color: MyColors.homeTitleColors),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 300,
                      child: Text(
                        textAlign: TextAlign.center,
                        '''Start making money by selling your PHP Scripts, WordPress Themes, WordPress Plugins and App Templates to the 100.000+ buyers .''',
                        style: TextStyle(
                            fontSize: 16,
                            color: MyColors.adAdsTextColor,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child:
                    Text(MyString.whatcanyousell, style: textTheme.headline6),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      categoryTitle(context, size, Icons.code, "Script&Code",
                          scriptAndCodeList),
                      categoryTitle(context, size, Icons.apps,
                          "app Source Code", appTemplateTagList),
                      categoryTitle(
                          context, size, Icons.draw, "Thems", temsTagList),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(MyString.writeTitleforYourwork,
                    style: textTheme.headline6),
              ),

              textField("title", Icons.subtitles),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Price", style: textTheme.headline6),
              ),

              textField("Price", Icons.attach_money),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Discription", style: textTheme.headline6),
              ),

              discriptionTextField(),
              uploads("Upload Files"),

              uploads("Upload Photos"),
              
              uploadButton()
            ],
          ),
        ),
      ),
    ));
  }

  Padding discriptionTextField() {
    return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 150,
                //width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.2,
                        blurRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Discription",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            );
  }

  Padding uploads(String title) {
    return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color:const Color.fromARGB(255, 190, 187, 187),
                    )),
                child: Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 224, 229, 232))),
                      onPressed: () {},
                      child:  Text(
                        title,
                        style:const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 69, 64, 64)),
                      )),
                ),
              ),
            );
  }

  Padding uploadButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 11, 146, 83))),
            child: const Text(
              "Upload",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }

  Padding textField(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 60,
        //width: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: Colors.grey),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 0.5,
                offset: const Offset(0, 2),
              ),
            ]),
        child: TextField(
          decoration: InputDecoration(
              hintText: title,
              hintStyle: const TextStyle(color: Colors.grey, height: 2.8),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none),
              prefixIcon: Icon(
                icon,
                color: MyColors.primaryColor,
              )),
        ),
      ),
    );
  }

  GestureDetector categoryTitle(BuildContext context, Size size, IconData icon,
      String title, List subCategoryList) {
    return GestureDetector(
      onTap: () {
        showModelBottonSheet(context, size, subCategoryList);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 0.5,
                offset: const Offset(0, 0.5),
              )
            ],
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(
            //   color: Colors.black,
            //   width: 1,
            // )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Icon(
                  icon,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showModelBottonSheet(
      BuildContext context, Size size, var categoryList) {
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
                  height: size.height / 2,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const Text(
                          "Pleas Select your category",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: size.width,
                          height: size.height / 2.5,
                          child: GridView.builder(
                            itemCount: categoryList.length,
                            gridDelegate:
                               const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 0.8 
                                  ),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 20, 30, 10),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(180),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0.2,
                                              blurRadius: 0.5,
                                              offset: const Offset(0, 0.5),
                                            )
                                          ]),
                                      child: Center(
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(180),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
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
                                                image: AssetImage(
                                                    categoryList[index].image!),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      categoryList[index].title!,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    )
                                  ],
                                ),
                              );
                            },
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
