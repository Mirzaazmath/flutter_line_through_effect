import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final bool isupperline;
  final int? index;
  final String text ;

  TextWidget(this.text,this.isupperline,[this.index]);

  @override
  Widget build(BuildContext context) {
    return Text(text,style:  TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: isupperline? index!%2==0?Colors.black:Colors.transparent:Colors.black));
  }

}
