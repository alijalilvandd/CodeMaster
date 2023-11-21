
import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/pages/register/login_page.dart';
import 'package:codemaster/pages/register/verification_code.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration:const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/back.png"),fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100,),
                const ImageIcon(AssetImage("assets/images/logo.png",),size: 90,color: Colors.white,),
                const SizedBox(height: 10,),
                const Text("Register to contact us",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                const SizedBox(
                  //width: 300,
                  child: Text(''' By signing up  you confirm that you agree 
with the membership terms and conditions
                           ''', style:  TextStyle(color: Colors.white),),
                ),
                const SizedBox(height: 60,),
                userNameTextField(),
                emailOrPhoneTextField(),
                passwordTextField(),
                const SizedBox(height: 10,),
                nextButton(context),
                
                const SizedBox(height: 40,),
                const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:  Text("Don't have an account",style: TextStyle(color: Color.fromARGB(255, 115, 197, 197)),),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage(),));
                  },
                  child: const Text("Have an acount",style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton nextButton(BuildContext context) {
    return ElevatedButton(
                
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                       )
                    ),
                    backgroundColor: MaterialStateColor.resolveWith((states) => MyColors.nextButtonColor)),
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const VerificationCode(),));
                  }, 
                  child:const Padding(
                    padding: EdgeInsets.fromLTRB(20,5,20,5),
                    child:  Text("Next",style: TextStyle(color: Colors.white,fontSize: 18),),
                  ) 
                );
  }

  Container passwordTextField() {
    return Container(
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
                      hintText: "password",
                      hintStyle:const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        gapPadding: 3,
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                );
  }

  Padding emailOrPhoneTextField() {
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
                        hintText: "Email or Phone",
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

  Container userNameTextField() {
    return Container(
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
                      hintText: "user name",
                      hintStyle:const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        gapPadding: 3,
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none
                      )
                    ),
                  ),
                );
  }
}