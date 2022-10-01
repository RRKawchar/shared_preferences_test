import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_prefereces_test/global/global_value.dart';
import 'package:shared_prefereces_test/main_screen/home_screen.dart';
import 'package:shared_prefereces_test/practice2/screen/student_screen.dart';
import 'package:shared_prefereces_test/practice2/screen/teacher_screen.dart';
import 'package:shared_prefereces_test/practice2/second_auth/second_login.dart';
import 'package:shared_prefereces_test/practice2/second_main/second_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondSplash extends StatefulWidget {
  const SecondSplash({Key? key}) : super(key: key);

  @override
  State<SecondSplash> createState() => _SecondSplashState();
}

class _SecondSplashState extends State<SecondSplash> {
  @override
  void initState() {
    // TODO: implement initState
    isLogin();
    super.initState();
  }

  isLogin() async {

    sharedPreferences = await SharedPreferences.getInstance();

    print(sharedPreferences!.getString("email"));
    print(sharedPreferences!.getString("password"));

    bool isLogin = sharedPreferences!.getBool("isLogin")??false;
    String userType = sharedPreferences!.getString("userType")??'';

    if (isLogin) {


      if(userType=='Student'){
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const StudentScreen()));
        });

      }else if(userType=='Teacher'){
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const TeacherScreen()));
        });
      }else{
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const SecondHome()));
      }

    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const SecondLogin()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxa3O1yiw2gm1NZVh_RD5NSbK-kwsAX2mCdrWgljP5_BVEoMEtXIeKY_G1dj4xp1GNeFg&usqp=CAU",
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.50,
              left: MediaQuery.of(context).size.height * 0.20,
              child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
