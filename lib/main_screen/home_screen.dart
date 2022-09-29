import 'package:flutter/material.dart';
import 'package:shared_prefereces_test/widgets/my_drawer.dart';
import 'package:shared_prefereces_test/widgets/reuseble_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const MyDrawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amberAccent,Colors.cyanAccent]
            )
          ),
        ),
        title: ReusebleText(text: "Home screen",letterSpaching: 3,),
        centerTitle: true,
      ),
    );
  }
}
