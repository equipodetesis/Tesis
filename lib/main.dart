

import 'package:expedientesodontologicos_app/Loggin/Loggin.dart';
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'principal.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      create: (context)=>LoginState(),
      child:Consumer<LoginState>(
        builder: (context,provider,child) {
          return MaterialApp(
              title: 'Historias Clinicas',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: provider.isok() ? principal() : Loggin()
          );
        }
      ),
    );
  }
}


