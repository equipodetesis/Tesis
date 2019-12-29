
import 'package:expedientesodontologicos_app/Loggin/Loggin.dart';
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'principal.dart';
void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginState>(
        create: (context) => LoginState(),),
      ChangeNotifierProvider<General>(
        create: (context) => General(),),
    ],
    child: MyApp()
    )
    );
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<LoginState>(context).isok();
        return MaterialApp(
            title: 'Historias Clinicas',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home:  Provider.of<LoginState>(context).islogged? principal() : Loggin()
        );
  }
}


