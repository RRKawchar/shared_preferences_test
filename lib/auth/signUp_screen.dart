import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_prefereces_test/auth/login_screen.dart';
import 'package:shared_prefereces_test/global/global_value.dart';
import 'package:shared_prefereces_test/main_screen/home_screen.dart';
import 'package:shared_prefereces_test/widgets/custom_textfield.dart';
import 'package:shared_prefereces_test/widgets/error_message.dart';
import 'package:shared_prefereces_test/widgets/loading_dialog.dart';
import 'package:shared_prefereces_test/widgets/reuseble_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();


  GlobalKey<FormState> _key = GlobalKey<FormState>();

  String downloadUrlImge = "";
  XFile? imagXFile;

  final ImagePicker imagePicker=ImagePicker();

  getImage()async{

    imagXFile=await  imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagePicker;
    });
  }


  formValidation()async{

    if(imagXFile==null){
      showDialog(
          context: context,
          builder: (c){
            return ErrorDialog(
              message: "Please select an image",
            );
          }
      );

    }else{
       if(passwordController.text==confirmPassController.text){

         if(nameController.text.isNotEmpty &&
             emailController.text.isNotEmpty &&
             passwordController.text.isNotEmpty &&
             confirmPassController.text.isNotEmpty){

           showDialog(
               context: context,
               builder: (c){
                 return LoadingDialog(
                   message: "Checking credential",
                 );
               }
           );


          await sharedPreferences!.setString("name", nameController.text.trim());
          await sharedPreferences!.setString("email", emailController.text.trim());
          await sharedPreferences!.setString("password", passwordController.text.trim());
          await sharedPreferences!.setString("confirmpassword", confirmPassController.text.trim());
          await sharedPreferences!.setString("photoUrl", imagXFile!.path);

         Navigator.push(context, MaterialPageRoute(builder: (c)=>HomeScreen()));


         }else{

           showDialog(
               context: context,
               builder: (c){
                 return ErrorDialog(
                   message: "Please complete the form. ",
                 );
               }
           );
         }

       }else{
         showDialog(
             context: context,
             builder: (c){
               return ErrorDialog(
                 message: "Password and confirm password do not match",
               );
             }
         );
       }

    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.amberAccent,Colors.cyanAccent],

              ),

          ),
        ),
        title: ReusebleText(text: "Sign Up ",letterSpaching: 3,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
              height: MediaQuery.of(context).size.height,
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amberAccent,Colors.cyanAccent],
                begin: FractionalOffset(0.0,0.0),
                end: FractionalOffset(1.0,0.0),
                stops: [
                  0.0,1.0
                ],
                tileMode: TileMode.clamp
            ),

          ),
          child: Column(
          mainAxisSize: MainAxisSize.min,
            children: [


              const SizedBox(height: 10,),

              GestureDetector(
                onTap: (){
                  getImage();
                },
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width*0.20,
                  backgroundColor: Colors.white,
                  backgroundImage:imagXFile==null?null: FileImage(File(imagXFile!.path)),
                  child: imagXFile==null?
                  Icon(Icons.add_photo_alternate,
                  size: MediaQuery.of(context).size.width*0.20,color: Colors.grey,
                  ):null,
                ),
              ),

              const SizedBox(height: 10,),

              Form(
                key: _key,
                  child: Column(
                    children: [
                      CustomTextField(

                        controller:nameController ,
                          hintText: "Name",
                          icon: Icons.person,
                          enable: true,
                          isObscure: false,
                      ),
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
                      CustomTextField(

                        controller:confirmPassController ,
                        hintText: "Confirm Password",
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
                      backgroundColor: Colors.cyan,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 12)),
                  onPressed: () {
                    formValidation();
                  },
                  child: ReusebleText(
                    text: "Sign UP",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),





            ],
          ),
        ),
      ),
    );
  }
}
