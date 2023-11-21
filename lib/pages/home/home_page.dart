// ignore_for_file: deprecated_member_use

//import 'package:codemaster/companent/my_companent.dart';
//import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/Models/categoris_model.dart';
import 'package:codemaster/widgets/my_widgets.dart';
import 'package:codemaster/fake_data.dart/fake_data_categoris.dart';
import 'package:codemaster/pages/home/home_ads.dart';
//import 'package:codemaster/pages/saved_ads.dart';
import 'package:flutter/material.dart';
//import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      //drawer: drawerHome(context),
      //appBar: appBarHome(size, context),
      body: Center(
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              typeOfCategoreis(textTheme,"Script & Code"),
              
              categoryList(scriptAndCodeList),
              
              typeOfCategoreis(textTheme,"App Template"),
               
              
              categoryList(appTemplateTagList),
              
              typeOfCategoreis(textTheme,"Themes"),
               
              
              categoryList(temsTagList),
            ],
          ),
        ),
      ),
      
    );
  }

  Padding typeOfCategoreis(TextTheme textTheme,String title) {
    return Padding(
                padding:const  EdgeInsets.all(10),
                child: Text(
                  title,
                  style: textTheme.headline1
                ),
              );
  }

  


  SizedBox categoryList(List<TagModel> categoryList) {
    return SizedBox(
                height: 150,
                child: ListView.builder(
                  physics:const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeAdsPage(categoriList: categoryList),));
                        closeKeyboard(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
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
                                        image: AssetImage(categoryList[index].image!),
                                      )),
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
                      ),
                    );
                  },
                ),
              );
  }
}
