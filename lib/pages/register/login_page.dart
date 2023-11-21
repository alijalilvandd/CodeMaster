
import 'package:codemaster/constant/my_color.dart';
import 'package:codemaster/pages/main_screen.dart';
import 'package:codemaster/pages/register/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                
                const SizedBox(height: 100,),
                userNameTextField(),
                const SizedBox(height: 20,),

                passwordTextField(),
                const SizedBox(height: 10,),
                
                ElevatedButton(
                
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                       )
                    ),
                    backgroundColor: MaterialStateColor.resolveWith((states) => MyColors.nextButtonColor)),
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const MainScreen(),));
                  }, 
                  child:const Padding(
                    padding: EdgeInsets.fromLTRB(20,5,20,5),
                    child:  Text("Next",style: TextStyle(color: Colors.white,fontSize: 18),),
                  ) 
                ),
                
                const SizedBox(height: 40,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const RegisterPage(),));
                  },
                  child: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child:  Text("Don't have an account",style: TextStyle(color: Colors.white),),
                  ),
                ),
                const Text("Have an acount",style: TextStyle(color: Color.fromARGB(255, 115, 197, 197)),)
              ],
            ),
          ),
        ),
      ),
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