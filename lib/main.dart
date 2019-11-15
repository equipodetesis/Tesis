import 'package:expedientesodontologicos_app/Loggin/Loggin.dart';
import 'package:flutter/material.dart';
import 'ListItem.dart';
import 'principal.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<ListItem> list= new List<ListItem>();
    list.add(ListItem('Imagenes/incognito.png','Aqui Estara Un Paciente',"Fecha a futuro"));
    return MaterialApp(
      title: 'Historias Clinicas',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: principal(title: "Lista de pacientes",items: list),
      home: Loggin(),
    );
  }
}


