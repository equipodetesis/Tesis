import 'package:expedientesodontologicos_app/Formularios/ControlPlaca.dart';
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/ControldePlaca.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListaControldeplacas extends StatelessWidget{
  Firestore database=Firestore.instance;
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> stream;
    String path="Usuarios/"+Provider.of<LoginState>(context).uid+"/Cliente/"+Provider.of<General>(context).pacienteid+"/Expedientes/Graficos/ControldePlacas";
    stream=database.collection(path).snapshots();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Nueva grafica de control de placas",
        onPressed: (){
          Navigator.push(context,  MaterialPageRoute(builder: (context) => ControlPlaca()));
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
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
              children:snapshot.data.documents.map((DocumentSnapshot document){
                ControldePlaca controlPlaca=ControldePlaca();
                controlPlaca.fromjson(document.data);
                Widget arriba=Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: dientes(controlPlaca.cara_arriba, controlPlaca.cara_inferior,
                      controlPlaca.cara_izquierda,controlPlaca.cara_derecha,0),
                );
                Widget abajo=Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: dientes(controlPlaca.cara_arriba, controlPlaca.cara_inferior,
                      controlPlaca.cara_izquierda,controlPlaca.cara_derecha,14),
                );
                Widget dentadura=SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black26),
                    child: Column(
                      children: <Widget>[
                        arriba,
                        abajo
                      ],
                    ),
                  ),
                );
                DateTime fecha=DateTime.parse(controlPlaca.Fecha);
                return ListTile(
                  title: Column(
                    children: <Widget>[
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 200.0, 10.0),
                        child: Text("Fecha:"+DateFormat("dd-MM-yyyy/hh:mm").format(fecha).toString(),
                          style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                      ),
                      dentadura,
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 50.0, 10.0),
                            child: Text("Superfices afectadas:"+controlPlaca.porcentaje.toStringAsFixed(2)+"%",
                              style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            child: Tooltip(
                              message: "Eliminar registro",
                              showDuration: Duration(seconds: 3),
                              child: IconButton(
                                icon: Icon(Icons.delete,size: 35.0,),
                                onPressed: (){
                                  controlPlaca.deleteControldeplaca(path);
                                },
                              ),
                            ),
                          )
                        ],
                      )


                    ],
                  ),
                );
              }).toList()
            );
        }
        },
      ),
    );
  }
List<Widget> dientes(superior,inferior,izquierda,derecha,numdiente){
    List<Widget> dientes=List<Widget>();
    for(int i=0;i<14;i++) {
      Widget diente = Container(
          height: 49.0,
          width: 46.0,
          child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  right: 7.0,
                  child: Image.asset("Imagenes/dientearr.png", scale: 1.9,
                    color: superior[i+numdiente]?Colors.red : null,),
                ),
                Positioned(
                  bottom: 7.0,
                  left: 6.0,
                  child: Image.asset("Imagenes/dienteizq.png", scale: 2.1,
                  color: izquierda[i+numdiente]?Colors.red : null,),
                ),
                Positioned(
                  bottom: 5.0,
                  right: 0.0,
                  child: Image.asset("Imagenes/dienteder.png", scale: 1.9,
                  color: derecha[i+numdiente]?Colors.red : null,),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 10.0,
                  child: Image.asset("Imagenes/dienteabajo.png", scale: 1.9,
                  color: inferior[i+numdiente]?Colors.red : null,),
                )
              ]));
      dientes.add(diente);
    }
    return dientes;
}
}