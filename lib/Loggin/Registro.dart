import 'package:expedientesodontologicos_app/Loggin/BaseAuth.dart';
import 'package:expedientesodontologicos_app/Loggin/FireAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget{
Registro({Key key,}):super(key:key);
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //TextEditingController usuario, pasword;
    BaseAuth fireuser=Auth();
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white,Colors.blueAccent],

                )
            ),
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              autovalidate: true,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                    child: new TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: new InputDecoration(
                          hintText: 'Correo electronico',
                          icon: new Icon(
                            Icons.mail,
                            color: Colors.grey,
                          )),
                      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
                      onSaved:  (value){
                        setState(() {
                          _email = value.trim();
                          print("el value:"+value);
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: new TextFormField(
                      maxLines: 1,
                      obscureText: true,
                      autofocus: false,
                      decoration: new InputDecoration(
                          hintText: 'Contraseña',
                          icon: new Icon(
                            Icons.lock,
                            color: Colors.grey,
                          )),
                      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                      onSaved: (value){
                        setState(() {
                          _password = value.trim();
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 60.0,
                    padding: EdgeInsets.fromLTRB(0.0,20, 0.0, 0.0),
                    child: RaisedButton(
                      elevation: 5.0,
                      child: Text("Crear cuenta",style: TextStyle(color: Colors.white),),
                      color: Colors.amberAccent,
                      splashColor: Colors.deepOrange,
                      onPressed: () async {
                        _formKey.currentState.save();
                        print(_password);
                        FirebaseUser uid=await fireuser.signUp(_email,_password);
                        if (uid != null)
                          fireuser.sendEmailVerification();
                          Navigator.pop(context);
                      },
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                  FlatButton(
                    child: Text("Ya tienes cuenta?,Accede aqui ",style: TextStyle(color: Colors.redAccent,fontSize:12.0)),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}