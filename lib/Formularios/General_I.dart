import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class General_I extends StatefulWidget{
  @override
  State<General_I> createState() {

    return General_I_State();
  }

}
class General_I_State extends State<General_I>{
  TextEditingController nombre,sexo,estado_civil,direccion,emergencia,procedencia,telefono,ocupacion,referencia,fecha_inicio,edad;
  String fecha = DateFormat.yMd(DateTime.now()).toString();
  List sexos =["Masculino","Femenino"];
  List<DropdownMenuItem> _sexolist;
  String _currentsexo;

  @override
  void initState() {
    _sexolist = getDropdownMenuItem(sexos);
    _currentsexo = sexos[0];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("General I"),

      ),
      body: Form(
          child: SingleChildScrollView(
          child: Column(

          children: <Widget>[

           Container(

              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration( labelText: "Nombre", icon: Icon(Icons.person), )),
                controller: nombre,
              ) ,
            ),

            Row(
              children: <Widget>[
               Container(
                   child: Icon(Icons.brightness_5),
               margin: EdgeInsets.only(left: 10),),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15),
                    child: DropdownButton(
                      isExpanded: true,
                      items: _sexolist,
                      value: _currentsexo,
                      onChanged: (value){
                        setState(() {
                          _currentsexo = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration( labelText: "Estado civil", icon: Icon(Icons.donut_large), )),
                controller: estado_civil,
              ) ,
            ),

            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration( labelText: "Direccion", icon: Icon(Icons.location_on), )),
                controller: direccion,
              ) ,
            ),

            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration( labelText: "Procedencia", icon: Icon(Icons.trip_origin), )),
                controller: procedencia,
              ) ,
            ),

            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration( labelText: "Telefono", icon: Icon(Icons.phone_android),)),
                keyboardType: TextInputType.number,
                controller: telefono,
              ) ,
            ),

            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration( labelText: "Ocupacion", icon: Icon(Icons.work), )),
                controller: ocupacion,
              ) ,
            ),

            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration( labelText: "Emergencia", icon: Icon(Icons.report_problem), )),
                controller: emergencia,
              ) ,
            ),

            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration( labelText: "Referencia", icon: Icon(Icons.record_voice_over), )),
                controller: referencia,
              ) ,
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                 fecha,
                style: TextStyle(fontSize: 22.0),
              ),
            ),


            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration( labelText: "Edad", icon: Icon(Icons.cake), )),
                controller: edad,
                keyboardType: TextInputType.number,
              ) ,
            ),
          ]
      )
    )
      ),
    ) ;
  }

  List<DropdownMenuItem> getDropdownMenuItem(List items){
    List<DropdownMenuItem> menuItems = List<DropdownMenuItem>();
    for(String item in items){
      menuItems.add(DropdownMenuItem(
          child: Text(item),
      value: item));
    }
    return menuItems;
  }

}