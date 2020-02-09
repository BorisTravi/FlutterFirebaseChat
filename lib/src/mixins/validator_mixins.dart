class ValidationMixins{
  String validateEmail(String value){
   if(!value.contains('@')) 
    return "Email Invalidado";
    return null;
  }

   String validatePassword(String value){
   if(value.length < 6) 
    return "Contraseña Invalidada";
    return null;
  }

}