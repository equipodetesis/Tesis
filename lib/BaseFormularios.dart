import 'package:expedientesodontologicos_app/Formularios/ControlPlaca.dart';
import 'package:expedientesodontologicos_app/Formularios/ListaAdulto.dart';
import 'package:expedientesodontologicos_app/Formularios/ListaCirugias.dart';
import 'package:expedientesodontologicos_app/Formularios/cirugia/I_V.dart';
import 'package:expedientesodontologicos_app/img/SubirFoto.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Formularios/ListaControldeplacas.dart';
import 'Formularios/adulto/I_II_III_IV.dart';
import 'Formularios/adulto/V_VI_VII.dart';
import 'ModelosFormularios/Adulto.dart';
import 'ModelosFormularios/Cirugia.dart';
import 'package:cloud_functions/cloud_functions.dart';
class Baseformularios extends StatefulWidget {
  Baseformularios();
  @override
  _BaseformulariosState createState() => _BaseformulariosState();
}

class _BaseformulariosState extends State<Baseformularios> {
  _BaseformulariosState();
  I_II_III_IV formI = I_II_III_IV();
  String nombre = "Nuevo registro",Titulo="Historial";
  bool enviandoexitoso = false,error=false,check=false;
  Widget bodycontent;
  List motivo=List<String>(),fecha=List<String>();
  BuildContext central;
  @override
  void initState() {
    bodycontent = I_II_III_IV();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      central=context;
      nombre = Provider.of<General>(context).nombre;

    return Scaffold(
      appBar: AppBar(
        title: Text(Titulo),
        centerTitle: true,
        actions:check?<Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              showDialog(context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: error?Text("Error"):enviandoexitoso?Text("Exito"):Text("Enviando"),
                      content:error? Text("No se pudo guardar"):enviandoexitoso?Text("Guardado exitoso"):Center(child: CircularProgressIndicator(),),
                      actions: enviandoexitoso?<Widget>[
                        Center(
                          child: FlatButton(
                            child: Text("Aceptar"),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ]:null,
                    );
                  }

              );
              //adds
              if (Provider.of<General>(context).cambiado) {
                Provider.of<General>(context).addCLiente().then((onValue){

                 setState(() {
                   Provider
                       .of<General>(context)
                       .cambiado = false;
                   enviandoexitoso = true;
                   Navigator.pop(context);
                 });

                }).catchError((onError,trace){
                  setState(() {
                    Provider
                        .of<General>(context)
                        .cambiado = false;
                    error = true;
                    Navigator.pop(context);
                  });
                });

              }

              Navigator.pop(context);

            },
          )
        ]:null,
      ),
      body: bodycontent,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 0.001 / 0.001,
              child: DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.blueAccent])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(Provider.of<General>(context).foto),
                          backgroundColor: Colors.black12,
                          foregroundColor: Colors.white,
                        ),
                        width: 120.0,
                        height: 120.0,
                      ),
                      Text(
                        nombre,
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () async {
                              //funcion de la camara aqui
                              SubirFoto f=SubirFoto();
                              String foto=await f.tomarFoto(
                                  Provider.of<General>(context).pacienteid +
                                      "_foto");
                              print(foto);
                              setState(() {
                                Provider.of<General>(context).foto =foto.toString();
                                Provider.of<General>(context).updateCLiente();
                              });

                            },
                            child: Text(
                              "Tomar foto",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              //funcion de la camara aqui
                              SubirFoto f= SubirFoto();
                              String foto =
                                  await f.galeryFoto(
                                      Provider.of<General>(context).pacienteid +
                                          "_foto");
                              print(foto);
                              setState(() {
                                Provider.of<General>(context).foto=foto.toString();
                                Provider.of<General>(context).updateCLiente();
                              });
                            },
                            child: Text(
                              "Cambiar foto",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),

            ListTile(
              title: Text("General"),
              onTap: () {
                setState(() {
                  Titulo="General";
                  check=true;
                  bodycontent = I_II_III_IV();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Expediente Adulto"),
              onTap: () {
                setState(() {
                  check=false;
                  Titulo="Historia Clinica";
                  bodycontent = HistorialGeneral();
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text("Cirugia"),
              onTap: () {
                setState(() {
                  Titulo="Cirugia";
                  check=false;
                  bodycontent = HistorialCirugias();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Control de placa"),
              onTap: () {
                setState(() {
                  Titulo="Control de placa";
                  check=false;
                  bodycontent = ListaControldeplacas();
                });
                Navigator.pop(context);
              },

            ),
            ListTile(
              title: Text("Regresar"),
              onTap: () {
                check=false;
                Navigator.of(central).pop();
                Navigator.pop(context);
              },

            )

          ],
        ),
      ),
    );
  }
}
