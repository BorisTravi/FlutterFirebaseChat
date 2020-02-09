import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/mixins/validator_mixins.dart';
import 'package:flutterchat_app/src/service/autothencation.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_error_message.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routername = '/registration';
  _RegistrationScreenState createState()=> _RegistrationScreenState();  
}
class _RegistrationScreenState extends State<RegistrationScreen> with ValidationMixins{
  //final auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _focusNode ;
  bool _autoValidate = false; 
  final GlobalKey<FormState> _fomkey = GlobalKey<FormState>();
  String _erroMessage = "";
@override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }
  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form (
        key: _fomkey,
        child :Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppIcon(),
            SizedBox(height: 48.0,),
            _emailField(),
            SizedBox(height: 8.0,),
            _passwordField(),
            SizedBox(height: 24.0,),
            _showErrorMessage(),
            _submitButton()
          ],
        ),
      ),
      )
    );
  }

    Widget _emailField(){
      
      return AppTexfield(
      focusNode: _focusNode,
      validator: validateEmail,
      autoValidate:_autoValidate, // si es verdadero 
      controller:_emailController,
      inputText: 'Ingresar email',
      onSaved:(value){});
    }

    Widget _passwordField(){

      return AppTexfield(
        controller:_passwordController,
        validator: validatePassword,
        autoValidate: _autoValidate,
        inputText: 'Ingresar contraseña',            
        obscureText: true,
        onSaved: (value){},
        );
    }

    Widget _submitButton(){
    return AppButton(
            color: Colors.blueAccent,
            onPressed:() async{
              if(_fomkey.currentState.validate()){
                  var auth = await Autothentication().createUser(email:_emailController.text,password:_passwordController.text);
                  if(auth.success){
                    Navigator.pushNamed(context,'/chat');
                  
                  _emailController.text = "";
                  _passwordController.text = "";
                  FocusScope.of(context).requestFocus(_focusNode);
              }else{
                setState(() {
                  _erroMessage = auth.erroMesage; //verifica si los usuarios o los correos estan mal 
                });
              }
              }else{
                setState(() {
                  _autoValidate = true;
                });
              }
            },
              name: 'Registrarse',
            );

    }

        Widget _showErrorMessage(){
      if(_erroMessage.length > 0  &&  _erroMessage != null){
        return ErrorMessage(errorMessahge: _erroMessage);
      }else{
        return Container(
          height: 0.0,
        );
      }
    }
}
