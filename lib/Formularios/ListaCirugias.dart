import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expedientesodontologicos_app/Formularios/cirugia/I_V.dart';
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/MasFormularios.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Adulto.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Cirugia.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HistorialCirugias extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Firestore db= Firestore.instance;
    Stream<QuerySnapshot> stream;
    stream=db.collection("Usuarios/"+Provider.of<LoginState>(context).uid+"/Cliente/"+Provider.of<General>(context).pacienteid+"/Expedientes/Cirugia/Visitas").snapshots();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Masformularios("Cirugia")));
        },
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
                      var tpo;
                        Provider.of<Cirugia>(context).fromjson(documents.data);
                        tpo="Cirugia";

                      return  Provider.of<Cirugia>(context).padecimiento_actual.isNotEmpty?Column(
                        children: <Widget>[
                          Divider(color: Colors.black,
                            thickness: 0.12,
                          ),
                          ListTile(
                            title: Text(Provider.of<Cirugia>(context).padecimiento_actual,style: TextStyle(fontSize: 22.0,color: Colors.blue),),
                            subtitle: Text(Provider.of<Cirugia>(context).fecha_cirugia,style: TextStyle(fontSize: 15.0),),
                          )
                        ],
                      ):Center(child: Text("Sin registros anteriores",style: TextStyle(fontSize: 20.0),),);
                    }).toList());
            }
          }
      ),
    );
  }

}