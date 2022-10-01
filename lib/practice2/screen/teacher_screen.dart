import 'package:flutter/material.dart';
import 'package:shared_prefereces_test/global/global_value.dart';
import 'package:shared_prefereces_test/practice2/second_auth/second_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({Key? key}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {

  String email="";
  String age="";
  String type="";

  getData()async{

    sharedPreferences= await SharedPreferences.getInstance();

    email=sharedPreferences!.getString("email")!;
    age= sharedPreferences!.getString("age")!;
    type= sharedPreferences!.getString("userType")!;

    print(sharedPreferences!.getString("email")!);
    print(sharedPreferences!.getString("age")!);
    setState(() {

    });
  }
  @override
  void initState(){
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(type.toString()),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email"),
                  Text(":"),
                  Text("$email"),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Age"),
                  Text(":"),
                  Text(" $age"),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("UserType"),
                  Text(":"),
                  Text(" $type"),
                ],
              ),

              const SizedBox(height: 10,),
              InkWell(
                onTap: ()async{

                  sharedPreferences= await SharedPreferences.getInstance();
                  sharedPreferences!.clear();

                  Navigator.push(context, MaterialPageRoute(builder: (c)=>const SecondLogin()));

                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  color: Colors.green,
                  child: const Text("LogOut"),
                ),
              ),
            ],
          ),
        )
    );
  }
}
