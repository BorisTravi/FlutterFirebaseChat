import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterchat_app/src/models/auth_request.dart';

class Autothentication{

  final _auth = FirebaseAuth.instance;
  Future<AuthenticationRequest> createUser({String email="", String password=""}) async{
    AuthenticationRequest authRequest =  AuthenticationRequest();
  try {
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        if(user != null){
      authRequest.success = true;
    }
    } catch (e) {
      _mapErrorMessage(authRequest, e.code);
    } return authRequest;
  }

  Future<FirebaseUser> getCurreUser() async{
  try {
    return await _auth.currentUser();
    } catch (e) {
        print(e);
    } return null;
  }

  Future<AuthenticationRequest> loginUser({String email="", String password=""}) async{
    
    AuthenticationRequest authRequest =  AuthenticationRequest();
  try {
    var user =  await _auth.signInWithEmailAndPassword(email: email, password: password);
    if(user != null){
      authRequest.success = true;
    }
    } catch (e) {
      _mapErrorMessage(authRequest, e.code);  
    } return authRequest;
  }

  Future<void>singOut() async{
  try {
    return await _auth.signOut();
    } catch (e) {
        print(e);
    } return null;
  }
  void _mapErrorMessage(AuthenticationRequest authRequest , String code){
    switch (code) {
       case 'ERROR_USER_NOT_FOUND':
        authRequest.erroMesage = 'Usuario no encontrado';
        break;
        case 'ERROR_WRONG_PASSWORD':
        authRequest.erroMesage = 'Contraseña Invalida';
        break;
        case 'ERROR_NETWORK_REQUEST_FAILED':
        authRequest.erroMesage = 'Error de red';
        break;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
        authRequest.erroMesage = 'El usuario ya esta registrado';
        break;
        case 'ERROR_INVALID_EMAIL':
        authRequest.erroMesage = 'El correo es invalido';
        break;
      default:
      authRequest.erroMesage = code;
    }

  }
}