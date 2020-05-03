import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListaControldeplacas extends StatelessWidget{
  Firestore database;
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> stream;
    stream=database.collection("Usuarios/"+Provider.of<LoginState>(context).uid+"/Cliente/"+Provider.of<General>(context).pacienteid+"/Graficos/ControldePlacas").snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
      if (snapshot.hasError)
        return new Text('Error: ${snapshot.error}');
      switch (snapshot.connectionState){
        case ConnectionState.waiting: return Center(child:CircularProgressIndicator(
          backgroundColor: Colors.deepOrange,
        ));
        break;
        default:
          return ListView(
            children:snapshot.data.documents.map((DocumentSnapshot document){

            }).toList()
          );
      }
      },
    );
  }

}