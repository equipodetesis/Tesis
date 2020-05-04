

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Adulto.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Cirugia.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Historial extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Firestore db= Firestore.instance;
    Stream<QuerySnapshot> stream;
    stream=db.collection("Usuarios/"+Provider.of<LoginState>(context).uid+"/Cliente/"+Provider.of<General>(context).pacienteid+"/Expedientes").snapshots();
    return Scaffold(
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
                 var tpo;
                 List hitorial=List<Widget>();
                 if(documents.documentID=="Adulto"){
                   Provider.of<Adulto>(context).fromjson(documents.data);
                   print(Provider.of<Adulto>(context).dientes_perdidos);
                   tpo="Adulto";
                   Provider.of<Adulto>(context).motivo.forEach((element){
                     var h=Column(
                       children: <Widget>[
                         Divider(color: Colors.black,
                           thickness: 0.12,
                         ),
                         Text(tpo,textAlign:TextAlign.start,style: TextStyle(color: Colors.blue,fontSize: 22.0),),
                         ListTile(
                           title: Text(element.toString(),style: TextStyle(fontSize: 18.9)),
                           subtitle: Text(Provider.of<Adulto>(context).fecha_ultima_visita[Provider.of<Adulto>(context).motivo.indexOf(element)].toString(),
                               style: TextStyle(fontSize: 15.0)),
                         )
                       ],
                     );
                     hitorial.add(h);
                   });
                 }

                 if(documents.documentID=="Cirugia"){
                   Provider.of<Cirugia>(context).fromjson(documents.data);
                   tpo="Cirugia";
                   /*Provider.of<Cirugia>(context).padecimiento_actual.forEach((element){
                     var h=Column(
                       children: <Widget>[
                         Divider(color: Colors.black,
                           thickness: 0.12,
                         ),
                         Text(tpo,textAlign:TextAlign.start,style: TextStyle(color: Colors.blue,fontSize: 20.0),),
                         ListTile(
                           title: Text(element),
                           subtitle: Text(element),
                         )
                       ],
                     );
                     hitorial.add(h);
                   });*/
                 }


                 return  hitorial.isNotEmpty?Column(
                   children:hitorial
                 ):Center(child: Text("Sin registros anteriores",style: TextStyle(fontSize: 20.0),),);
               }).toList());
          }
        }
    ),
    );
  }

}