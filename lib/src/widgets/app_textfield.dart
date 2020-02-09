import 'package:flutter/material.dart';
class AppTexfield extends StatelessWidget {
final String inputText;
final ValueChanged<String> onSaved;
final bool obscureText;
final TextEditingController controller;
final  FocusNode focusNode;
final FormFieldValidator<String> validator;
final bool autoValidate;
const AppTexfield({this.inputText, this.onSaved, this.obscureText, this.controller, this.focusNode, 
this.validator,this.autoValidate}); 

 @override
 Widget build(BuildContext context) {
 return TextFormField(
      autovalidate: autoValidate, // si es verdadero valid y ya no sale error
      validator: validator, // validad si la contraseña tiene maas 6 caracteres y el correo tenga arroba
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintText: inputText,
          border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(color: Colors.lightBlueAccent,width: 2.0) 
        ),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          borderSide: BorderSide(color: Colors.blueAccent,width: 2.0)
        )
      ),
      onSaved: onSaved,
      textAlign: TextAlign.center,
      obscureText: obscureText == null? false:obscureText ,
    );   
 }
}