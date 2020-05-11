import 'package:expedientesodontologicos_app/Loggin/BaseAuth.dart';
import 'package:expedientesodontologicos_app/Loggin/FireAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginState with ChangeNotifier{
  bool islogged=false;
  BaseAuth fireuser=Auth();
  bool loading=false;
  bool error=false;
  String uid;

  Future<bool> isok() async{
    loading=true;
   var user= await getCurrentUser();

    if (user == null) {
      islogged=false;
      loading=false;
    }else{
      uid=user.uid;
      islogged=true;
      loading=false;
    }
    bool log=islogged;

    return log;
  }
void login(_email,_password,context) async{
  loading=true;
  print(_email);
  var user= await fireuser.signIn(_email, _password).then((onValue){
    islogged=true;
    error=false;
    notifyListeners();
  }).catchError((onError,trace){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            elevation: 2.0,
            title: Text("Error "),
            content: Text("Contraseña o Nombre de usuario incorrecto"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cerrar"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  });
}
void loginGoogle() async {
    var user= await fireuser.googleSignin();
    print(user.uid);
    uid=user.uid;
    if (user.uid == null) {
      islogged=false;
      error=true;
      loading=false;
      notifyListeners();
    }else{
      islogged=true;
      error=false;
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