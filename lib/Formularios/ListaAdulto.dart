import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expedientesodontologicos_app/Formularios/adulto/V_VI_VII.dart';
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/MasFormularios.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Adulto.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Cirugia.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HistorialGeneral extends StatefulWidget{

  @override
  _HistorialGeneralState createState() => _HistorialGeneralState();
}

class _HistorialGeneralState extends State<HistorialGeneral> {
  @override
  Widget build(BuildContext context) {
    Firestore db= Firestore.instance;
    Stream<QuerySnapshot> stream;
    String path="Usuarios/"+Provider.of<LoginState>(context).uid+"/Cliente/"+Provider.of<General>(context).pacienteid+"/Expedientes/Adulto/Visitas";
    stream=db.collection(path).snapshots();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Provider.of<Adulto>(context).clear();
          Provider.of<Adulto>(context).editable =  true;
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
                      var adulto=Adulto();
                        adulto.fromjson(documents.data);
                      return adulto.motivo!=""?Column(
                        children: <Widget>[
                          Divider(color: Colors.black,
                            thickness: 0.12,
                          ),
                          Dismissible(
                            background: Container(
                              color: Colors.deepOrange,
                              child: Align(child: Icon(Icons.delete_sweep,size: 40.0,),alignment:Alignment.centerLeft ,),
                            ),
                            secondaryBackground: Container(
                              color: Colors.deepOrange,
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.delete_sweep,size: 40.0,)),
                            ),
                            key: Key(documents.documentID),
                            onDismissed: (DismissDirection direction){
                              // if(DismissDirection.horizontal==direction)
                              showDialog(context: context,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Text("Eliminar"),
                                      content: Text("¿Desea eliminar este registro?"),
                                      actions: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            FlatButton(onPressed: (){
                                              Firestore.instance.collection(path).document(documents.documentID).delete();
                                              Navigator.pop(context);
                                            },
                                                child: Text("Si")),
                                            FlatButton(onPressed: (){
                                              setState(() {
                                              });
                                              Navigator.pop(context);
                                            },
                                                child: Text("No"))
                                          ],
                                        )
                                      ],
                                    );
                                  }
                              );

                            },
                            child: ListTile(
                              title: Text(adulto.motivo.toString(),style: TextStyle(fontSize:22.0,color: Colors.blue)),
                              subtitle:Text(adulto.fecha.toString(),style: TextStyle(fontSize: 15.0,)),
                              onTap: (){
                                Provider.of<Adulto>(context).clear();
                                if(snapshot.data.documents.indexOf(documents)==(snapshot.data.documents.length-1))
                                  Provider.of<Adulto>(context).editable=true;
                                Provider.of<Adulto>(context).fromjson(documents.data);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Masformularios("Adulto")));
                              },

                            ),
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