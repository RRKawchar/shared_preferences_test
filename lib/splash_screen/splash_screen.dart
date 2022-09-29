import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_prefereces_test/auth/login_screen.dart';
import 'package:shared_prefereces_test/auth/signUp_screen.dart';
import 'package:shared_prefereces_test/global/global_value.dart';
import 'package:shared_prefereces_test/main_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  String finalEmail='';
  String finalPass='';

  Future valudationform()async{

    sharedPreferences=await SharedPreferences.getInstance();
    var obemail=sharedPreferences!.getString("email");
    var obpassword=sharedPreferences!.getString("password");
    setState(() {
      finalEmail=obemail!;
      finalPass=obpassword!;

    });
  }

  splashTimer(){

    valudationform().whenComplete((){
      Timer(const Duration(seconds: 3), () {
        if(finalEmail==null && finalPass==null){

          Navigator.push(context, MaterialPageRoute(builder: (c)=>const SignUpScreen()));
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (c)=>const HomeScreen()));

        }

      });

    });

  }

  @override
  void initState() {
   splashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.purpleAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
             alignment: Alignment.center,
             child: Image.asset("images/splash_image.jpg",width: MediaQuery.of(context).size.width*0.90,),
           ),
           const SizedBox(height: 30,),
           const CircularProgressIndicator(
              backgroundColor: Colors.amberAccent,
            )

          ],
        ),
      ),
    );
  }
}
