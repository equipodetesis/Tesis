
import 'package:expedientesodontologicos_app/Formularios/cirugia/I_V.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Formularios/adulto/I_II_III_IV.dart';
import 'Formularios/adulto/V_VI_VII.dart';
import 'ModelosFormularios/Adulto.dart';
import 'ModelosFormularios/Cirugia.dart';
import 'package:cloud_functions/cloud_functions.dart';
class Masformularios extends StatefulWidget {
  String tpo;
  Masformularios(String to){
    tpo=to;
  }
  @override
  _MasformulariosState createState() => _MasformulariosState(tpo);
}

class _MasformulariosState extends State<Masformularios> {
  String tpo;
  _MasformulariosState(String tpo){
    this.tpo=tpo;
  }
  I_II_III_IV formI = I_II_III_IV();
  String Titulo="Nuevo Registro";
  bool enviandoexitoso = false,error=false;
  Widget bodycontent;
  List motivo=List<String>(),fecha=List<String>();
  BuildContext central;
  @override
  void initState() {
    print(tpo);
    if(tpo=="Adulto"){
      bodycontent = V_VI_VII();
    Titulo="Nueva consulta";
    }
    if(tpo=="Cirugia"){
      bodycontent=I_V();
      Titulo="Nueva cirugia";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(Titulo),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              showDialog(context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Enviando"),
                      content:Container(
                          height: 250,
                          width: 500,
                          child: Center(child: CircularProgressIndicator(),)),
                    );
                  }
              );
              //adds
              if (Provider.of<Adulto>(context).cambiado) {
                Provider.of<Adulto>(context).checklist();
                Provider.of<Adulto>(context).cambiado=false;
                Provider.of<Adulto>(context).addAdult().then((result){
                  Navigator.pop(context);
                  showDialog(context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Exito"),
                          content:Text("Guardado"),
                          actions: <Widget>[
                            Center(
                              child: FlatButton(
                                child: Text("Aceptar"),
                                onPressed: (){
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            )
                          ],
                        );
                      }

                  );
                }).catchError((onError,trace){
                  Navigator.pop(context);
                  showDialog(context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Eror"),
                          content:Text(onError.toString()),
                          actions: <Widget>[
                            Center(
                              child: FlatButton(
                                child: Text("Aceptar"),
                                onPressed: (){
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            )
                          ],
                        );
                      }

                  );
                });


                // print("Hola?");
              }
              if (Provider.of<Cirugia>(context).cambiado) {
                Provider.of<Cirugia>(context).checklist();
                Provider.of<Cirugia>(context).cambiado = false;
                Provider.of<Cirugia>(context).addCirugia().then((onValue){
                  Navigator.pop(context);
                  showDialog(context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Exito"),
                          content:Text("Guardado"),
                          actions: <Widget>[
                            Center(
                              child: FlatButton(
                                child: Text("Aceptar"),
                                onPressed: (){
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            )
                          ],
                        );
                      }

                  );
                }).catchError((onError,trace){
                  Navigator.pop(context);
                  showDialog(context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Eror"),
                          content:Text(onError.toString()),
                          actions: <Widget>[
                            Center(
                              child: FlatButton(
                                child: Text("Aceptar"),
                                onPressed: (){
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            )
                          ],
                        );
                      }

                  );
                });
              }
            },
          )
        ],
      ),
      body: bodycontent,

    );
  }
}