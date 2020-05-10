import 'package:expedientesodontologicos_app/ModelosFormularios/Adulto.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Cirugia.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ListItem.dart';
import 'BaseFormularios.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Loggin/LoginState.dart';
import 'ModelosFormularios/General.dart';
// ignore: must_be_immutable
class ListController extends StatelessWidget{
  bool search;
  String searchtext;
  Firestore database;
  ListController(  bool search,String searchtext,Firestore database){

    this.search=search;
    this.searchtext=searchtext;
    this.database=database;
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> stream;
    stream=database.collection("Usuarios/"+Provider.of<LoginState>(context).uid+"/Cliente/").snapshots();

    return  StreamBuilder<QuerySnapshot>(
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
              return  ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document){
                  General general=General();
                  general.fromJson(document.data);


                 ListItem item= ListItem(general.foto,
                     general.nombre,general.fecha_inicio);

                  return
                    searchtext==null||searchtext==""? Column(
                      children: <Widget>[
                        Divider(color: Colors.black,
                        thickness: 0.12,
                        ),
                        ListTile(
                        dense: false,

                        leading: CircleAvatar(
                          foregroundColor: Theme.of(context).primaryColor,
                          backgroundColor: Colors.lightBlueAccent,
                          backgroundImage: NetworkImage(item.imagen),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              item.Nombre,
                              style:  TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onTap: (){
                          Provider.of<General>(context).fromJson(document.data);
                          Provider.of<General>(context).pacienteid=document.documentID;
                          Provider.of<General>(context).actualizar=true;
                          print(document.data["nombre"]);
                          Provider.of<Adulto>(context).clear();
                          Provider.of<Cirugia>(context).clear();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Baseformularios()),
                          );},
                        subtitle: Container(
                          padding: const EdgeInsets.only(top: 5.0),
                          child:  Text(
                            item.fechacita,
                            style:  TextStyle(color: Colors.grey, fontSize: 15.0),
                          ),
                        )
                    )
                      ],
                    ):item.Nombre.toLowerCase().contains(searchtext.toLowerCase())?Column(
                      children: <Widget>[
                        Divider(color: Colors.black,
                          thickness: 0.12,
                        ),
                        ListTile(
                            dense: false,

                            leading: CircleAvatar(
                              foregroundColor: Theme.of(context).primaryColor,
                              backgroundColor: Colors.lightBlueAccent,
                              backgroundImage: NetworkImage(item.imagen),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  item.Nombre,
                                  style:  TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            onTap: (){
                              Provider.of<General>(context).fromJson(document.data);
                              Provider.of<General>(context).pacienteid=document.documentID;
                              Provider.of<General>(context).actualizar=true;
                              if (document.data["Expedientes"]!= null) {
                                print("Hola");
                                if(document.data["Expedientes"]["Adulto"]!=null){
                                  print(document.data["Expedientes"]["Adulto"]["Userid"]);
                                  Provider.of<Adulto>(context).fromjson(
                                      document.data["Expedientes"]["Adulto"]);
                                  print("A"+Provider.of<Adulto>(context).Userid);}
                              }else{
                                Provider.of<Adulto>(context).clear();
                                Provider.of<Cirugia>(context).clear();
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Baseformularios()),
                              );},
                            subtitle: Container(
                              padding: const EdgeInsets.only(top: 5.0),
                              child:  Text(
                                item.fechacita,
                                style:  TextStyle(color: Colors.grey, fontSize: 15.0),
                              ),
                            )
                        )
                      ],
                    )

                  :Container();
                }).toList()
              );
          }
        },

    );

  }
}