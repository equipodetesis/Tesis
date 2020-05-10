
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
  String nombre = "Nuevo registro",Titulo="Nuevo Registro";
  bool enviandoexitoso = false,error=false;
  Widget bodycontent;
  List motivo=List<String>(),fecha=List<String>();
  BuildContext central;
  @override
  void initState() {
    print(tpo);
    if(tpo=="Adulto"){
      bodycontent = V_VI_VII();}
    if(tpo=="Cirugia"){
      bodycontent=I_V();}
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
                  barrierDismissible: true,
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
                              !error? Navigator.pop(context):null;
                            },
                          ),
                        )
                      ]:null,
                    );
                  }

              );
              //adds
              if (Provider.of<Adulto>(context).cambiado) {
                Provider.of<Adulto>(context).addAdult().then((result){
                    enviandoexitoso=true;
                }).catchError((onError,trace){
                  error=true;
                });
                Provider.of<Adulto>(context).cambiado=false;
                setState(() {
                  print("refrescando");
                });

                // print("Hola?");
              }
              if (Provider.of<Cirugia>(context).cambiado) {
                Provider.of<Cirugia>(context).checklist();
                Provider.of<Cirugia>(context).addCirugia().then((onValue){
                  setState(() {
                    Provider.of<Cirugia>(context).cambiado=false;
                    enviandoexitoso=true;
                    Navigator.pop(context);
                  });
                }).catchError((onError,trace){
                  setState(() {
                    Provider.of<Cirugia>(context).cambiado=false;
                    error=true;
                    Navigator.pop(context);
                  });
                });


                // print("Hola?");
              }



            },
          )
        ],
      ),
      body: bodycontent,

    );
  }
}