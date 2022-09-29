

import 'package:flutter/material.dart';

class ReusebleText extends StatelessWidget {
 final String text;
 double? size;
 Color?color;
 FontWeight? fontWeight;
 double? letterSpaching;

 ReusebleText({required this.text,this.size,this.color,this.fontWeight,this.letterSpaching});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: size,color: color,fontWeight: fontWeight,letterSpacing: letterSpaching),);
  }
}
