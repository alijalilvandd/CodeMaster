

// ignore_for_file: deprecated_member_use

import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/constant/my_string.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme =Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const CircleAvatar(
                radius: 50,
                backgroundColor: MyColors.primaryColor,
                child: Icon(Icons.person,size: 60,color: Colors.white,),
              ),
              const SizedBox(height: 5,),
              const Text("Jasmine",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              const Text(MyString.editPhoto,style: TextStyle(color: Color.fromARGB(255, 47, 36, 50),fontSize: 15,),),
              const SizedBox(height: 50,),
              changePassword(textTheme),
                const Divider(
                  color: MyColors.primaryColor,
                ),
                site(textTheme),
                const Divider(
                  color: MyColors.primaryColor,
  
                ),
                socialChannels(textTheme),
                const Divider(
                  color: MyColors.primaryColor,
  
                ),
                blog(textTheme),
                const Divider(
                  color: MyColors.primaryColor,
  
                ),
                settings(textTheme),
            ],
          ),
        ),
      )
    );
  }

  Padding changePassword(TextTheme textTheme) {
    return Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.lock,color: Color.fromARGB(255, 128, 128, 128),),
                        const SizedBox(width: 10,),
                        Text(MyString.changePassword,style: textTheme.headline4),
                      
                      ],
                    ),
                    const Icon(Icons.keyboard_arrow_right,size: 30,color: Color.fromARGB(255, 128, 128, 128, ))
                  ],
                ),
              ),
            );
  }

  Padding site(TextTheme textTheme) {
    return Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.article,color: Color.fromARGB(255, 128, 128, 128),),
                        const SizedBox(width: 10,),
                        Text(MyString.site,style: textTheme.headline4),
                      
                      ],
                    ),
                    const Icon(Icons.keyboard_arrow_right,size: 30,color: Color.fromARGB(255, 128, 128, 128, ))
                  ],
                ),
              ),
            );
  }

  Padding socialChannels(TextTheme textTheme) {
    return Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.people,color: Color.fromARGB(255, 128, 128, 128),),
                        const SizedBox(width: 10,),
                        Text(MyString.socialChannels,style: textTheme.headline4),
                      
                      ],
                    ),
                    const Icon(Icons.keyboard_arrow_right,size: 30,color: Color.fromARGB(255, 128, 128, 128, ))
                  ],
                ),
              ),
            );
  }

  Padding blog(TextTheme textTheme) {
    return Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.chrome_reader_mode_outlined ,color: Color.fromARGB(255, 128, 128, 128),),
                        const SizedBox(width: 10,),
                        Text(MyString.blog,style: textTheme.headline4),
                      
                      ],
                    ),
                    const Icon(Icons.keyboard_arrow_right,size: 30,color: Color.fromARGB(255, 128, 128, 128, ))
                  ],
                ),
              ),
            );
  }

  Padding settings(TextTheme textTheme) {
    return Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.settings ,color: Color.fromARGB(255, 128, 128, 128),),
                        const SizedBox(width: 10,),
                        Text(MyString.settings,style: textTheme.headline4),
                      
                      ],
                    ),
                    const Icon(Icons.keyboard_arrow_right,size: 30,color: Color.fromARGB(255, 128, 128, 128, ))
                  ],
                ),
              ),
            );
  }
}