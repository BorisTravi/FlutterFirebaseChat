import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
class WelcolmeScreen extends StatefulWidget {
    static const String routeName = '';
    WelcolmeScreen({Key key }) : super(key: key);
_WelcolmeScreenState createState()=> _WelcolmeScreenState();
}
class _WelcolmeScreenState extends State<WelcolmeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
    body : Container(
    padding: EdgeInsets.symmetric(horizontal: 25.0),
    child : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
       AppIcon(),
        SizedBox(height: 48.0),
        AppButton(
          color : Colors.lightBlueAccent,
          onPressed: (){Navigator.pushNamed(context, '/login');},
          name: 'Log in',
        ),
        AppButton(
          color: Colors.blueAccent,
          onPressed: (){Navigator.pushNamed(context, '/registration');},
          name: 'Registrarse',
        )
      ],
    ),
    )
    );
  }
}