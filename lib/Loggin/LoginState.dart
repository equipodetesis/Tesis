import 'package:expedientesodontologicos_app/Loggin/BaseAuth.dart';
import 'package:expedientesodontologicos_app/Loggin/FireAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginState with ChangeNotifier{
  bool islogged=false;
  BaseAuth fireuser=Auth();
  bool loading=false;
  bool error=false;

  bool isok(){
    getCurrentUser().then((user){
      if(user!=null){
        islogged=true;

      }else
        error=true;

    });
    return islogged;
  }
void login(_email,_password) async{
  loading=true;
  notifyListeners();
  var user= await fireuser.signIn(_email, _password);
print(user.uid);
  if (user.uid == null) {
    islogged=false;
    error=true;
    loading=false;
    notifyListeners();
  }else{
    islogged=true;
    loading=false;
    notifyListeners();
  }
}
void logout() async {
  islogged=false;
  await fireuser.signOut();
  notifyListeners();
}
Future<FirebaseUser> getCurrentUser() async {
  FirebaseUser user= await fireuser.getCurrentUser();
  return user;
}
}