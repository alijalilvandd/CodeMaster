

import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/pages/main_screen.dart';
import 'package:codemaster/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/back.png"),fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(height: size.height/1.8,),
                codeTextField(),
          
                singnupButton(context),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RegisterPage()));
                  },
                  child:const Padding(
                    padding:  EdgeInsets.all(15),
                    child:  Text("Correct information",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton singnupButton(BuildContext context) {
    return ElevatedButton(
                
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                      //side: BorderSide(color: Colors.red)
                       )
                    ),
                    backgroundColor: MaterialStateColor.resolveWith((states) => MyColors.nextButtonColor)),
                  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                      builder: (context)=>const MainScreen()),(Route route)=> false);
                  }, 
                  child:const Padding(
                    padding: EdgeInsets.fromLTRB(20,5,20,5),
                    child:  Text("Sign in",style: TextStyle(color: Colors.white,fontSize: 18),),
                  ) 
                );
  }

  Padding codeTextField() {
    return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(width: 2,color:MyColors.registerTextFieldBorderColor)
                    ),
                    width: 250,
                    height: 50,
                    child: TextField(
                      cursorColor: Colors.white,
                    
                      decoration: InputDecoration(
                        hoverColor: MyColors.registerTextFieldBorderColor,
                        hintText: "Code",
                        hintStyle:const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          gapPadding: 3,
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none
                        )
                      ),
                    ),
                  ),
                );
  }
}