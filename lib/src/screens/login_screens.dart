import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/mixins/validator_mixins.dart';
import 'package:flutterchat_app/src/service/autothencation.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_error_message.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreens extends StatefulWidget {
  static const String routeName = '/login';
_LoginScreensState createState()=> _LoginScreensState();
}
class _LoginScreensState extends State<LoginScreens> with ValidationMixins{
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
FocusNode _focusNode;
bool showSpinner = false;
bool _autoValidate = false;
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String _erroMessage  = "";
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
void setSpinnerStatus(bool status){
  setState(() {
    showSpinner = status;
  });
}
@override
Widget build(BuildContext context) {
  return Scaffold(
   backgroundColor: Colors.grey.shade300, 
   body: ModalProgressHUD(
   inAsyncCall: showSpinner, 
   child: Form (
     key: _formkey,
     child: Container(
     padding: EdgeInsets.symmetric(horizontal: 24),
     child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppIcon(),
          SizedBox(height: 20),
          _emailField(),
          SizedBox(height: 7),
          _passwordField(),
          SizedBox(height: 20.0,),
          _showErrorMessage(),
          _submitButton()
        ],
        ),
       ) 
      )
      ),
    );
 }

  Widget _emailField(){
    return AppTexfield(
      focusNode: _focusNode,
      autoValidate: _autoValidate, // si es verdadero valida y ya no sale error
      controller : _emailController ,
      inputText: "Ingresar email",
      validator: validateEmail,
      onSaved: (value){});
  }
  Widget _passwordField(){
    return AppTexfield(
      controller : _passwordController ,
      autoValidate: _autoValidate,
      inputText:"Ingresar contraseña", 
      validator: validatePassword, // valida si el password tenga mas 6 caracteres
      onSaved: (value){},
      obscureText: true);   
  }

  Widget _submitButton(){
    return AppButton(
       color: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
	                        colors: [
	                          Color.fromRGBO(143, 148, 251, 1),
	                          Color.fromRGBO(143, 148, 251, .6),
	                        ] 
         )
       ),
            onPressed: () async {
              if(_formkey.currentState.validate()){
                setSpinnerStatus(true);
                var auth  = await Autothentication().loginUser(email: _emailController.text, password: _passwordController.text);
                if(auth.success){
                  Navigator.pushNamed(context, '/chat');
                  FocusScope.of(context).requestFocus(_focusNode);
                  _emailController.text ="";
                  _passwordController.text = "";
                }else{
                  setState(() {
                    _erroMessage = auth.erroMesage;
                  });
                }
                setSpinnerStatus(false);
              }else{
                setState(() {
                  _autoValidate = true;
                });

              }
            },
            name: 'Ingresar',
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
