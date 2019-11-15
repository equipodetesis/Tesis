import 'package:expedientesodontologicos_app/Loggin/BaseAuth.dart';
import 'package:expedientesodontologicos_app/Loggin/FireAuth.dart';
import 'package:expedientesodontologicos_app/principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expedientesodontologicos_app/Loggin/Registro.dart';
class Loggin extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   //TextEditingController usuario, pasword;
    BaseAuth fireuser=Auth();
    String _email;
    String _password;
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
                onSaved: (value) => _email = value.trim(),
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
                onSaved: (value) => _password = value.trim(),
              ),
            ),
                Container(
                  height: 60.0,
                  padding: EdgeInsets.fromLTRB(0.0,20, 0.0, 0.0),
                  child: RaisedButton(
                    elevation: 5.0,
                    child: Text("Ingresar",style: TextStyle(color: Colors.white),),
                    color: Colors.amberAccent,
                    splashColor: Colors.deepOrange,
                    onPressed: (){
                    var uid= fireuser.signIn(_email, _password);
                    if (uid != null)
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>principal(fireuser,"Pacientes")));
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                ),
                FlatButton(
                  child: Text("¿No tienes cuenta?,crea cuenta ",style: TextStyle(color: Colors.redAccent,fontSize:12.0)),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Registro()));
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