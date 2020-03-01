import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Adulto.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Cirugia.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Historial extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Firestore db= Firestore.instance;
    Stream<QuerySnapshot> stream;
    stream=db.collection("Usuarios/"+Provider.of<LoginState>(context).uid+"/Cliente/Expedientes").snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial de visitas"),
      ),
      body: StreamBuilder(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator(
                backgroundColor: Colors.deepOrange,
              ));
              break;
            default:
              return ListView(
               children:snapshot.data.documents.map((DocumentSnapshot documents){
                 if(documents.documentID=="Adulto")
                   Provider.of<Adulto>(context).fromjson(documents.data);
                 if(documents.documentID=="Cirugia")
                   Provider.of<Cirugia>(context).fromjson(documents.data);

               }).toList());
          }
        }
    ),
    );
  }
  void obtenerdatos(context){

    StreamBuilder(
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
              snapshot.data.documents.map((DocumentSnapshot document){
                if(document.documentID=="Adulto")
              }) ;
          }
        }
    );
  }
}