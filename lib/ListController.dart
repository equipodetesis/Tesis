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
    stream=database.collection("Usuario/"+Provider.of<LoginState>(context).uid+"/Cliente/").snapshots();
    String pacienteid;
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
              return new ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document){
                  General general=General.fromJson(document.data,document.documentID);
                  print(general.nombre);
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Baseformularios(general)),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Baseformularios(general)),
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