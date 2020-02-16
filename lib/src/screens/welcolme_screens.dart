import 'package:flutter/material.dart';
import 'package:flutterchat_app/animation/FadeAnimation.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
class WelcolmeScreen extends StatefulWidget {
    static const String routeName = '';
    WelcolmeScreen({Key key }) : super(key: key);
_WelcolmeScreenState createState()=> _WelcolmeScreenState();
}
class _WelcolmeScreenState extends State<WelcolmeScreen> {
@override
 Widget build(BuildContext context){
   return Scaffold(
     backgroundColor: Colors.white,
     body:  SingleChildScrollView(
       child: Container(
         child: Column(
           children: <Widget>[
            Container(
	              height: 400,
	              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('images/background.png'),
	                  fit: BoxFit.fill
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  Positioned(
	                    left: 30,
	                    width: 80,
	                    height: 200,
	                    child: FadeAnimation(1, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('images/light-1.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 150,
	                    child: FadeAnimation(1.3, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('images/light-2.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    right: 40,
	                    top: 40,
	                    width: 80,
	                    height: 150,
	                    child: FadeAnimation(1.5, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('images/image_01.png'),
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    child: FadeAnimation(1.6, Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("CHATBOX", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
	                    )),
	                  )
	                ],
	              ),
	            ), // llama capa introducion
             Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
              children: <Widget>[
                FadeAnimation(2, Container(
                 child: FlatButton(child: Text("Ingresar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      onPressed: (){Navigator.pushNamed(context, '/login');},
                      ),
                      height: 50,
                      width: 1000,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
	                        colors: [
	                          Color.fromRGBO(143, 148, 251, 1),
	                          Color.fromRGBO(143, 148, 251, .6),
	                        ]
	                      )
	                    ),
                )
                ),
                    SizedBox(height: 30,),
	                  FadeAnimation(2.2, Container(
	                    child: FlatButton(child: Text("Registrase", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      onPressed: (){Navigator.pushNamed(context, '/registration');},
                      ),
                      height: 50,
                      width: 1000,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
	                        colors: [
	                          Color.fromRGBO(143, 148, 251, 1),
	                          Color.fromRGBO(143, 148, 251, .6),
	                        ]
	                      )
	                    ),
	                  )
                    ),
                 SizedBox(height: 70,),
	                  FadeAnimation(2.3, Text("Olvido Contraseña?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),    
              ],
              ),
             )
           ],
         ),
       ),
     ),
   );
 }

  /*@override
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
  }*/
}