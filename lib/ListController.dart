import 'package:flutter/material.dart';
import 'ListItem.dart';
import 'BaseFormularios.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: must_be_immutable
class ListController extends StatelessWidget{
  List<ListItem> preitems=new List<ListItem>();
  bool search;
  String searchtext;
  Firestore database;
  ListController( List<ListItem> items, bool search,String searchtext,Firestore database){
    this.preitems=items;
    this.search=search;
    this.searchtext=searchtext;
    this.database=database;
  }

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> stream;
    stream=database.collection('Clientes').snapshots();

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
                 ListItem item= ListItem("https://firebasestorage.googleapis.com/v0/b/expedientes-odontologicos.appspot.com/o/54462699_10214142660262421_7801861136030105600_n.jpg?alt=media&token=5060a01b-917e-42e5-ac5c-6cd8bff61f3b",
                 document["Nombre"],document["edad"]);

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
                            MaterialPageRoute(builder: (context) => Baseformularios(item)),
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
                                MaterialPageRoute(builder: (context) => Baseformularios(item)),
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