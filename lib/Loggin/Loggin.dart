
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expedientesodontologicos_app/Loggin/Registro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
class Loggin extends StatefulWidget{

  @override
  _LogginState createState() => _LogginState();
}

class _LogginState extends State<Loggin> {
  String _email;
  String _password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: AspectRatio(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      backgroundImage:NetworkImage("https://firebasestorage.googleapis.com/v0/b/expedientes-odontologicos.appspot.com/o/dentist2.png?alt=media&token=bc68720a-3fbb-42f9-be16-4d1f415d03bd"),
                    ),
                    aspectRatio: 2/2,
                  ),
                ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
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
                onSaved: (value) => _email = value.trim(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child:  TextFormField(
                maxLines: 1,
                obscureText: true,
                autofocus: false,
                decoration:  InputDecoration(
                    hintText: 'Contraseña',
                    icon:  Icon(
                      Icons.lock,
                      color: Colors.grey,
                    )),
                validator: (value) => value.isEmpty ? 'Este campo no puede estar vacio' : null,
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
                    onPressed: () async {
                     if( _formKey.currentState.validate())
                       _formKey.currentState.save();
                         if(Provider.of<LoginState>(context).error)
                         showDialog(
                             context: context,
                             builder: (BuildContext context){
                               return AlertDialog(
                                 elevation: 2.0,
                                 title: Text("Error de autenticación"),
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
                     Provider.of<LoginState>(context).login(
                         _email, _password,context);

                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                ),
                FlatButton(
                  child: Text("¿No tienes cuenta?,crea cuenta ",style: TextStyle(color: Colors.redAccent,fontSize:12.0)),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Registro()));
                  },
                ),
                FlatButton.icon(
                  icon: Icon(FontAwesomeIcons.google),
                  label: Text("Inicia sesión con Google"),
                  onPressed: () async {
                     await Provider.of<LoginState>(context).loginGoogle();
                  }
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}