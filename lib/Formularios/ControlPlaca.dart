import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';

class ControlPlaca extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_ControlPlacaState();
}

class _ControlPlacaState extends State<ControlPlaca>{
  final _placakey = GlobalKey<FormState>();
  String _totalplaca,_presesntemult,_porcentaje,_fecha=DateTime.now().toString();
  int s=1,d=9;
  @override
  Widget build(BuildContext context) {

   Widget diente=Container(
     height: 62.0,
     width: 52.0,
     child: Stack(
       children: <Widget>[
         Positioned(
           top: 0.0,
           right: 9.0,
           child: Image.asset("Imagenes/dientearr.png",scale: 1.5,),
         ),
          Positioned(
            bottom: 7.0,
            left: 0.0,
         child:  Image.asset("Imagenes/dienteizq.png",scale: 1.5,),
       ),
         Positioned(
           bottom: 7.0,
          right: 0.0,
        child:Image.asset("Imagenes/dienteder.png",scale: 1.5,) ,
      ),
        Positioned(
         bottom: 0.0,
         right: 12.0,
         child:Image.asset("Imagenes/dienteabajo.png",scale: 1.5,),
       )

       ],
     ),
     decoration: BoxDecoration(color: Colors.black26),
   );
    var arriba=Container(
      height: 120.0,
      decoration: BoxDecoration(color: Colors.amber),
      child: ListView.builder(
        itemCount: 16,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          if(index>=8&&s<2)s++;
          if(d>1)d--;
          else d=8;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("$s$d"),
              diente
            ],
          );
        },
      ),
    );


  var abajo=Container(
    height: 120,
    decoration: BoxDecoration(color: Colors.amber),
    child:ListView.builder(
  itemCount: 16,
  scrollDirection: Axis.horizontal,
  itemBuilder: (context,index){
     if(index>=8&&s<4)s++;
     if(d>1)d--;
     else d=8;
     return Column(
       mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         Text("$s$d"),
         diente
       ],
     );
   },

    ) ,);
  var calculo= Form(
    child: Row(
      children: <Widget>[
        Tooltip(
          message: "Total de superficies con placa",
          showDuration: Duration(seconds: 2),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Container(
              width: 120.0,
              child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: 'Total placa',
                    icon: new Icon(
                      Icons.bookmark_border,
                      color: Colors.grey,
                    )),
                validator: (value) => value.isEmpty ? 'no puede estar vacio' : null,
                onSaved:  (value){
                  setState(() {
                     _totalplaca= value.trim();
                    print("el value:"+value);
                  });
                },
              ),
            ),
          ),
        ),
        Tooltip(
          message: "Dientes presentes",
          showDuration: Duration(seconds: 2),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Container(
              width: 120.0,
              child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: 'Prensete en',
                    icon: new Icon(
                      Icons.bookmark_border,
                      color: Colors.grey,
                    )),
                validator: (value) => value.isEmpty ? 'No puede estar vacio' : null,
                onSaved:  (value){
                  setState(() {
                    _presesntemult = value.trim();
                    print("el value:"+value);
                  });
                },
              ),
            ),
          ),
        ),
        Tooltip(
          message: "Porcentaje",
          showDuration: Duration(seconds: 2),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Container(
              width: 120.0,
              child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                autofocus: false,
                decoration: new InputDecoration(
                    hintText: '%',
                    icon: new Icon(
                      Icons.bookmark_border,
                      color: Colors.grey,
                    )),
                validator: (value) => value.isEmpty ? 'no puede estar vacio' : null,
                onSaved:  (value){
                  setState(() {
                    _porcentaje= value.trim();
                    print("el value:"+value);
                  });
                },
              ),
            ),
          ),
        ),
      ],
    ),
    key:_placakey,
  );

    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Control de placa",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            arriba,
            Divider(thickness: 10.0),
            abajo,
            Divider(thickness: 10.0),
            calculo,
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

                },
                ),
            ),

          ],
        )
      ],
    );
  }

}