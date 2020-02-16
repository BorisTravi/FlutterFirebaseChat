import 'package:flutter/material.dart';
class AppButton extends StatelessWidget {
  final BoxDecoration color;
  final VoidCallback onPressed;
  final String name;
   
 const AppButton({this.color,this.onPressed, this.name});
 @override
 Widget build(BuildContext context) {
  return Container(
    decoration:color,
    child:  Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
           child:FlatButton(
            child: Text(name,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold )),
            onPressed: onPressed,
        ),
      ),
    );
  }
}