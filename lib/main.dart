import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/screens/chat_screen.dart';
import 'package:flutterchat_app/src/screens/login_screens.dart';
import 'package:flutterchat_app/src/screens/registration_screen.dart';
import 'package:flutterchat_app/src/screens/welcolme_screens.dart';
void main() {
  runApp(MaterialApp(
   home: WelcolmeScreen(),
   initialRoute: WelcolmeScreen.routeName,  
    routes: <String, WidgetBuilder>{
      LoginScreens.routeName : (BuildContext context) => LoginScreens(),
      WelcolmeScreen.routeName : (BuildContext context) => WelcolmeScreen(),
      RegistrationScreen.routername :(BuildContext context) => RegistrationScreen(),
      ChatScreen.routName :(BuildContext context)=> ChatScreen()
    }
    )
  );
}

