import 'package:flutter/material.dart';
class ErrorMessage extends StatelessWidget {
 final String errorMessahge;
  ErrorMessage({this.errorMessahge});
 @override
 Widget build(BuildContext context) {
  return Text(
   errorMessahge,
   style: TextStyle(
     fontSize: 13.0,
     color: Colors.red,
     height: 1.0,
     fontWeight: FontWeight.w300
   ),
  
 );
 }
}