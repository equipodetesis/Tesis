import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/ControldePlaca.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Diente.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ControlPlaca extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_ControlPlacaState();
}

class _ControlPlacaState extends State<ControlPlaca>{
  final _placakey = GlobalKey<FormState>();
  String _fecha=DateTime.now().toString();
  double porcentaje=0.0;
  int totaldientes=0,supafectadas=0;
  int s=1,d=7,i=0,s2=3,d2=1;
  bool cambioas2=false;
TextEditingController td=TextEditingController();
  List<Diente> dientesarriba = List(14),dientesabajo=List(14);
  ControldePlaca controldePlaca=ControldePlaca();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    td.text=totaldientes.toString();
    while(i < dientesarriba.length){
      dientesarriba[i] = Diente();
      dientesabajo[i]=Diente();
      if(cambioas2){
      dientesarriba[i].codigo = s.toString() + d2.toString();
      dientesabajo[i].codigo=s2.toString()+d2.toString();
      d2++;
      print(dientesarriba[i].codigo);
      }else{
        dientesarriba[i].codigo = s.toString() + d.toString();
        dientesabajo[i].codigo=s2.toString()+d.toString();
        d--;
      }
      if(d<1){
        cambioas2=true;
        s++;
        s2++;
        d=7;
      }
      i++;
    }
  }
  @override
  Widget build(BuildContext context) {

   Widget diente=Container(
     height: 103.0,
     width: 93.0,
     child: Stack(
       children: <Widget>[
         Positioned(
           top: 0.0,
           right: 16.0,
           child: Image.asset("Imagenes/dientearr.png",scale: 0.9,),
         ),
          Positioned(
            bottom: 12.0,
            left: 6.0,
         child:  Image.asset("Imagenes/dienteizq.png",scale: 1.0,),
       ),
         Positioned(
           bottom: 7.0,
          right: 0.0,
        child:Image.asset("Imagenes/dienteder.png",scale: 0.9,) ,
      ),
        Positioned(
         bottom: 0.0,
         right: 21.0,
         child:Image.asset("Imagenes/dienteabajo.png",scale: 0.9,),
       )

       ],
     ),
     decoration: BoxDecoration(color: Colors.black26),
   );

    var arriba2=SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: dientesarriba.map((value) {
            return Column(
              children: <Widget>[
                Text(value.codigo),
                Container(
                  height: 103.0,
                  width: 93.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0.0,
                        right: 16.0,
                        child: GestureDetector(
                          onTap: (){
                            if(value.cara_arriba){
                              setState(() {
                                value.cara_arriba = false;
                              });
                            supafectadas--;
                            }
                            else{
                            setState(() {
                              value.cara_arriba = true;
                              supafectadas++;
                            });}
                            if(totaldientes>0)
                            { setState(() {
                               porcentaje=(supafectadas/(totaldientes*4))*100;
                             }); }
                            controldePlaca.cara_arriba[dientesarriba.indexOf(value)]=value.cara_arriba;
                            print(controldePlaca.cara_arriba[0].toString());
                          },
                          child: Image.asset("Imagenes/dientearr.png",color: value.cara_arriba ? Colors.red : null,scale: 0.9,),
                        ),
                      ),
                      Positioned(
                        bottom: 12.0,
                        left: 6.0,
                        child: GestureDetector(
                          child:  Image.asset("Imagenes/dienteizq.png",scale: 1.0,color: value.cara_izquierda ? Colors.red : null),
                          onTap: (){
                            if(value.cara_izquierda){
                              setState(() {
                                value.cara_izquierda = false;
                              });
                              supafectadas--;
                            }
                            else{
                              setState(() {
                                value.cara_izquierda = true;
                                supafectadas++;
                              });}
                            if(totaldientes>0)
                            { setState(() {
                              porcentaje=(supafectadas/(totaldientes*4))*100;
                            });
                            controldePlaca.cara_izquierda[dientesarriba.indexOf(value)]=value.cara_izquierda;
                            print(controldePlaca.cara_izquierda[dientesarriba.indexOf(value)].toString());
                            }
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 7.0,
                        right: 0.0,
                        child: GestureDetector(
                          child:Image.asset("Imagenes/dienteder.png",scale: 0.9,color: value.cara_derecha ? Colors.red : null),
                          onTap: (){
                            if(value.cara_derecha){
                              setState(() {
                                value.cara_derecha = false;
                              });
                              supafectadas--;
                            }
                            else{
                              setState(() {
                                value.cara_derecha = true;
                                supafectadas++;
                              });}

                            if(totaldientes>0)
                            {
                              setState(() {
                              porcentaje=(supafectadas/(totaldientes*4))*100;
                            });
                            }
                            controldePlaca.cara_derecha[dientesarriba.indexOf(value)]=value.cara_derecha;

                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 22.0,
                        child: GestureDetector(
                          child:Image.asset("Imagenes/dienteabajo.png",scale: 0.9,color: value.cara_abajo ? Colors.red : null),
                          onTap: (){
                            if(value.cara_abajo){
                              setState(() {
                                value.cara_abajo = false;
                              });
                              supafectadas--;
                            }
                            else{
                              setState(() {
                                value.cara_abajo = true;
                                supafectadas++;
                              });}
                            if(totaldientes>0)
                            { setState(() {
                              porcentaje=(supafectadas/(totaldientes*4))*100;
                            });
                            controldePlaca.cara_inferior[dientesarriba.indexOf(value)]=value.cara_abajo;
                            }
                          },
                        ),
                      )

                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.black26),
                )
              ],
            );
          }).toList(),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),

    );
    var abajo2 = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: dientesabajo.map((value) {
          return Column(
            children: <Widget>[
              Text(value.codigo),
              Container(
                height: 103.0,
                width: 93.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0.0,
                      right: 16.0,
                      child: GestureDetector(
                        onTap: (){
                          if(value.cara_arriba){
                            setState(() {
                              value.cara_arriba = false;
                            });
                            supafectadas--;
                          }
                          else{
                            setState(() {
                              value.cara_arriba = true;
                              supafectadas++;
                            });}
                          if(totaldientes>0)
                          { setState(() {
                            porcentaje=(supafectadas/(totaldientes*4))*100;
                          });
                          controldePlaca.cara_arriba[dientesabajo.indexOf(value)+14]=value.cara_arriba;
                          }
                        },
                        child: Image.asset("Imagenes/dientearr.png",color: value.cara_arriba ? Colors.red : null,scale: 0.9,),
                      ),
                    ),
                    Positioned(
                      bottom: 12.0,
                      left: 6.0,
                      child: GestureDetector(
                        child:  Image.asset("Imagenes/dienteizq.png",scale: 1.0,color: value.cara_izquierda ? Colors.red : null),
                        onTap: (){
                          if(value.cara_izquierda){
                            setState(() {
                              value.cara_izquierda = false;
                            });
                            supafectadas--;
                          }
                          else{
                            setState(() {
                              value.cara_izquierda = true;
                              supafectadas++;
                            });}
                          if(totaldientes>0)
                          { setState(() {
                            porcentaje=(supafectadas/(totaldientes*4))*100;
                          });
                          controldePlaca.cara_izquierda[dientesabajo.indexOf(value)+14]=value.cara_izquierda;}
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 7.0,
                      right: 0.0,
                      child: GestureDetector(
                        child:Image.asset("Imagenes/dienteder.png",scale: 0.9,color: value.cara_derecha ? Colors.red : null),
                        onTap: (){
                          if(value.cara_derecha){
                            setState(() {
                              value.cara_derecha = false;
                            });
                            supafectadas--;
                          }
                          else{
                            setState(() {
                              value.cara_derecha = true;
                              supafectadas++;
                            });
                          }

                          if(totaldientes>0)
                          {
                            setState(() {
                              porcentaje=(supafectadas/(totaldientes*4))*100;
                            });
                            controldePlaca.cara_derecha[dientesabajo.indexOf(value)+14]=value.cara_derecha;
                          }
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 22.0,
                      child: GestureDetector(
                        child:Image.asset("Imagenes/dienteabajo.png",scale: 0.9,color: value.cara_abajo ? Colors.red : null),
                        onTap: (){
                          if(value.cara_abajo){
                            setState(() {
                              value.cara_abajo = false;
                            });
                            supafectadas--;
                          }
                          else{
                            setState(() {
                              value.cara_abajo = true;
                              supafectadas++;
                            });}
                          if(totaldientes>0)
                          { setState(() {
                            porcentaje=(supafectadas/(totaldientes*4))*100;
                          });
                          controldePlaca.cara_inferior[dientesabajo.indexOf(value)+14]=value.cara_abajo;
                          }
                        },
                      ),
                    )

                  ],
                ),
                decoration: BoxDecoration(color: Colors.black26),
              )
            ],
          );
        }).toList()),
      );

  var calculo= Row(
    children: <Widget>[
      Tooltip(
        message: "Dientes que posee el paciente",
        showDuration: Duration(seconds: 2),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Container(
            width: 120.0,
            child: TextFormField(
              maxLines: 1,
              keyboardType: TextInputType.number,
              autofocus: false,
              autovalidate: true,
              controller: td,
              validator: (value)=>value.isEmpty&&value.contains(".")?"Valor no valido":null,
              decoration: new InputDecoration(
                  hintText: 'Cantidad de dientes',
                  icon: new Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                  )),
              onChanged:  (value){
                print("el value:"+value);
                if(value.contains(".")||value.contains(",")){
                  showDialog(context: context,
                    builder:(BuildContext context){
                    return AlertDialog(
                      content: Text("Solo se permiten enteros"),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                         FlatButton(
                          child: new Text("Ok"),
                          onPressed: () {
                            Navigator.of(context).pop();
                            td.text=totaldientes.toString();
                          },
                        ),
                      ],
                    );
                    });

                }
                else {
                  int val=int.parse(value);
                  if(val>28){
                    showDialog(context: context,
                     builder: (BuildContext contex){
                      return AlertDialog(
                        content: Text("El valor no puede ser mayor a 28"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Aceptar"),
                            onPressed: (){
                              td.text=totaldientes.toString();
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                     }
                    );
                  }else
                setState(() {
                   totaldientes=int.parse(value);
                   td.text=totaldientes.toString(); 
                   porcentaje=(supafectadas/(totaldientes*4))*100;
                });}



              },
            ),
          ),
        ),
      ),
      Tooltip(
        message: "Porcentaje de afectación",
        showDuration: Duration(seconds: 2),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          child: Container(
            width: 200.0,
            child: Column(
           children: <Widget>[
              Text("Porcentaje de afectacion=",style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
    Text(porcentaje.toStringAsFixed(2)+"%",style: TextStyle(fontSize: 19.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
    ],
          ),
        ),
      ),)
    ],
  );

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 20.0),
                child: Text("Control de placa",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
              ),
              arriba2,
              Divider(thickness: 10.0),
              abajo2,
              Divider(thickness: 10.0),
              calculo,
              Padding(
                padding: const EdgeInsets.fromLTRB(2.0, 175.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget>[
                    Container(
                    padding:const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0) ,
                    child: RaisedButton(
                      elevation: 10.0,
                      hoverElevation: 20.0,
                      child:  Text("Guardar",style: TextStyle(fontSize: 19.0),),
                      color: Colors.cyan,
                      splashColor: Colors.deepOrange,
                      padding:const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0) ,
                      onPressed: (){

                       controldePlaca.porcentaje=porcentaje;
                       controldePlaca.totaldientes=totaldientes;
                       controldePlaca.userid=Provider.of<LoginState>(context).uid;
                       controldePlaca.clienteid=Provider.of<General>(context).pacienteid;
                       controldePlaca.Fecha=_fecha;
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
                       controldePlaca.addControldeplaca().then((onValue){
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
                       Navigator.pop(context);
                      },
                      ),
                  ),
                    Container(
                      padding:const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0) ,
                      child: RaisedButton(
                        elevation: 10.0,
                        hoverElevation: 20.0,
                        child:  Text("Cancelar",style: TextStyle(fontSize: 19.0),),
                        color: Colors.cyan,
                        splashColor: Colors.deepOrange,
                        padding:const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0) ,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ]
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}