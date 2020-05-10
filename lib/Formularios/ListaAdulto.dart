import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expedientesodontologicos_app/Formularios/adulto/V_VI_VII.dart';
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/MasFormularios.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Adulto.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Cirugia.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HistorialGeneral extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Firestore db= Firestore.instance;
    Stream<QuerySnapshot> stream;
    stream=db.collection("Usuarios/"+Provider.of<LoginState>(context).uid+"/Cliente/"+Provider.of<General>(context).pacienteid+"/Expedientes/Adulto/Visitas").snapshots();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Provider.of<Adulto>(context).clear();

          Navigator.push(context, MaterialPageRoute(builder: (context)=>Masformularios("Adulto")));
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

                        Provider.of<Adulto>(context).fromjson(documents.data);
                        print(Provider.of<Adulto>(context).dientes_perdidos);
                        tpo="Adulto";



                      return Provider.of<Adulto>(context).motivo.isNotEmpty?Column(
                        children: <Widget>[
                          Divider(color: Colors.black,
                            thickness: 0.12,
                          ),
                          ListTile(
                            title: Text(Provider.of<Adulto>(context).motivo.toString(),style: TextStyle(fontSize:22.0,color: Colors.blue)),
                            subtitle:Text(Provider.of<Adulto>(context).fecha.toString(),style: TextStyle(fontSize: 15.0,)),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Masformularios("Adulto")));
                            },

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