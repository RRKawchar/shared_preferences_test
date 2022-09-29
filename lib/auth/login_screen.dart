import 'package:flutter/material.dart';
import 'package:shared_prefereces_test/global/global_value.dart';
import 'package:shared_prefereces_test/main_screen/home_screen.dart';
import 'package:shared_prefereces_test/widgets/custom_textfield.dart';
import 'package:shared_prefereces_test/widgets/reuseble_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();



  GlobalKey<FormState> _key = GlobalKey<FormState>();
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
  loginNow(){
     valudationform().whenComplete(()async{

       Navigator.push(context, MaterialPageRoute(builder: (c)=>const HomeScreen()));
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.amberAccent,Colors.cyanAccent]
              )
          ),
        ),
        title: ReusebleText(text: "Login Screen",letterSpaching: 3,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(
                  "images/login.jpg",
                  height: 270,
                ),
              ),
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  CustomTextField(

                    controller:emailController ,
                    hintText: "Email",
                    icon: Icons.email,
                    enable: true,
                    isObscure: false,
                  ),
                  CustomTextField(

                    controller:passwordController ,
                    hintText: "Password",
                    icon: Icons.lock,
                    enable: true,
                    isObscure: true,
                  ),

                  const SizedBox(height: 10,)
                ],
              ),

            ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 12)),
                onPressed: () {
                  // formValidation();
                  loginNow();
                },
                child: ReusebleText(
                  text: "Login ",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
