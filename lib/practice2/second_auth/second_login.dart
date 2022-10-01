import 'package:flutter/material.dart';
import 'package:shared_prefereces_test/global/global_value.dart';
import 'package:shared_prefereces_test/practice2/screen/student_screen.dart';
import 'package:shared_prefereces_test/practice2/screen/teacher_screen.dart';
import 'package:shared_prefereces_test/practice2/second_main/second_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondLogin extends StatefulWidget {
  const SecondLogin({Key? key}) : super(key: key);

  @override
  State<SecondLogin> createState() => _SecondLoginState();
}

class _SecondLoginState extends State<SecondLogin> {


  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  TextEditingController ageController=TextEditingController();

  saveData()async{
    sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences!.setString("email", emailController.text.toString());
    sharedPreferences!.setString("password",passController.text.toString());
    sharedPreferences!.setString("age", ageController.text.toString());
    sharedPreferences!.setString("userType",'Teacher');
    sharedPreferences!.setBool("isLogin", true);


    ///get Data
    sharedPreferences!.getString("email");
    sharedPreferences!.getString("password");


    if(sharedPreferences!.getString("userType")=="Student"){
      Navigator.push(context, MaterialPageRoute(builder: (c)=>StudentScreen()));

    }else if(sharedPreferences!.getString("userType")=="Teacher"){

      Navigator.push(context, MaterialPageRoute(builder: (c)=>TeacherScreen()));
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (c)=>SecondHome()));

    }






  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email"
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: passController,
                    decoration: InputDecoration(

                        hintText: "Password",

                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: ageController,
                    decoration: InputDecoration(
                        hintText: "Age"
                    ),
                  ),

                  const SizedBox(height: 40,),

                  InkWell(
                    onTap: (){

                    saveData();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      color: Colors.green,
                      child: const Text("Login"),
                    ),
                  ),


                ],
              ),
            ),
    );
  }




}
