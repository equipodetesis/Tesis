import 'package:expedientesodontologicos_app/Loggin/BaseAuth.dart';
import 'package:expedientesodontologicos_app/Loggin/FireAuth.dart';
import 'package:expedientesodontologicos_app/principal.dart';
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
      appBar: AppBar(
        title: Text("Registrarse"),
        backgroundColor:Colors.white30 ,
      ),
      body: Center(
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white,Colors.black12],

                )
            ),
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              autovalidate: true,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
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
                      validator: (value) => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ?  null: 'Email invalido',
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
                      validator: (value) => value.length<6 ? 'Contraseña debil' : null,
                      onChanged: (value){
                        setState(() {
                          _password = value.trim();
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
                          hintText: 'Repetir contraseña',
                          icon: new Icon(
                            Icons.lock,
                            color: Colors.grey,
                          )),
                      validator: (value) => value!=_password? "No coinciden" : null,
                      onSaved: (value){
                        setState(() {
                          _password = value.trim();
                          print("value");
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 60.0,
                    padding: EdgeInsets.fromLTRB(0.0,20, 0.0, 0.0),
                    child: RaisedButton(
                      elevation: 5.0,
                      child: Text(_password,style: TextStyle(color: Colors.white),),
                      color: Colors.amberAccent,
                      splashColor: Colors.deepOrange,
                      onPressed: () async {
                        if(_formKey.currentState.validate()){
                          _formKey.currentState.save();
                        print(_password);
                        FirebaseUser uid=await fireuser.signUp(_email,_password).then((onValue){
                          fireuser.sendEmailVerification();
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  elevation: 2.0,
                                  title: Text("Bienvenido "),
                                  content: Text("Ahora tienes una cuenta"),
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
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>principal()));
                        }).catchError((onError,trace){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  elevation: 2.0,
                                  title: Text("Error "),
                                  content: Text("Contraseña o Nombre de usuario incorrecto"+onError.toString()),
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