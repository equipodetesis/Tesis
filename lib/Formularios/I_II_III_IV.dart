import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class General_I extends StatefulWidget{
  @override
  State<General_I> createState() {

    return General_I_State();
  }

}
class General_I_State extends State<General_I>{
  TextEditingController nombre = TextEditingController(), estado_civil = TextEditingController(),
      direccion = TextEditingController(),emergencia = TextEditingController()
  ,procedencia = TextEditingController(),telefono = TextEditingController(),ocupacion = TextEditingController()
  ,referencia = TextEditingController(),fecha_inicio = TextEditingController(),edad = TextEditingController();

  TextEditingController motivo = TextEditingController(), historia = TextEditingController(), tratamiento = TextEditingController()
  , dientes_perdidos = TextEditingController(), causa_dientesperdidos = TextEditingController(),
  experiencias_exodoncias = TextEditingController(), higiene_oral = TextEditingController(), tipo_cepillo  = TextEditingController()
  , tecnica_cepillado  = TextEditingController(), frecuencia_cepillado = TextEditingController(), ayudas_higiene_extras = TextEditingController();

  DateTime fecha = DateTime.now();
  DateTime fecha_selec = DateTime.now();
  List sexos =["Masculino","Femenino"];
  List<DropdownMenuItem> _sexolist;
  String _currentsexo;

  Widget general;
  Widget motivohistoria;
  @override
  void initState() {
    _sexolist = getDropdownMenuItem(sexos);
    _currentsexo = sexos[0];

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    general = generalI();
    motivohistoria = motivoHistoria();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("General"),
              ),
              Tab(
                child: Text("Motivo e Historia"),
              ),

            ],
          ),
        ),

        body: TabBarView(
          children: <Widget>[
            general,
            motivohistoria
          ],),
      ),
    ) ;
  }

  Widget generalI(){
    return SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: (InputDecoration(
                    labelText: "Nombre",
                    icon: Icon(Icons.person), )),
                  controller: nombre,
                  keyboardType: TextInputType.text,
                ) ,
              ),

              Row(
                children: <Widget>[
                  Container(
                    child: Icon(FontAwesomeIcons.venusMars),
                    margin: EdgeInsets.all(10),),

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(1),
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
                  decoration: (InputDecoration( labelText: "Estado civil", icon: Icon(FontAwesomeIcons.userFriends), )),
                  controller: estado_civil,
                  keyboardType: TextInputType.text,

                ) ,
              ),

              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: (InputDecoration( labelText: "Direccion", icon: Icon(Icons.location_on), )),
                  controller: direccion,
                  keyboardType: TextInputType.text,

                ) ,
              ),

              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: (InputDecoration( labelText: "Procedencia", icon: Icon(FontAwesomeIcons.city), )),
                  controller: procedencia,
                  keyboardType: TextInputType.text,

                ) ,
              ),

              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: (InputDecoration( labelText: "Telefono", icon: Icon(Icons.phone_android),)),
                  controller: telefono,
                  keyboardType: TextInputType.phone,

                ) ,
              ),

              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: (InputDecoration( labelText: "Ocupacion", icon: Icon(Icons.work), )),
                  controller: ocupacion,
                  keyboardType: TextInputType.text,

                ) ,
              ),

              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: (InputDecoration( labelText: "Emergencia", icon: Icon(Icons.report_problem), )),
                  controller: emergencia,
                  keyboardType: TextInputType.text,

                ) ,
              ),

              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: (InputDecoration( labelText: "Referencia", icon: Icon(Icons.record_voice_over), )),
                  controller: referencia,
                  keyboardType: TextInputType.text,

                ) ,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        DateFormat("y-M-d").format(fecha),
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20.0, ),
                      ),
                    ),
                  ],
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
    );
  }

  Widget motivoHistoria(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Motivo de la consulta", icon: Icon(Icons.format_align_justify)),
              controller: motivo,
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Historia de la enfermedad actual", icon: Icon(Icons.format_align_justify)),
              controller: historia,
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,

            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.calendar_today),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: FlatButton(
                      child: Text(
                        DateFormat("y-M-d").format(fecha_selec),
                        style: TextStyle(fontSize: 20.0,color: Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                  onTap: (){
                    _selectDate(context);
                  },
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Tratamiento Recibido", icon: Icon(FontAwesomeIcons.bandAid)),
              controller: tratamiento,
              keyboardType: TextInputType.text,

            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Dientes Perdidos", icon: Icon(FontAwesomeIcons.tooth)),
              controller: dientes_perdidos,
              keyboardType: TextInputType.number,

            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Causa de Pérdida", icon: Icon(FontAwesomeIcons.tooth)),
              controller: causa_dientesperdidos,
              keyboardType: TextInputType.text,

            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Experiencias de exodoncias previas", icon: Icon(FontAwesomeIcons.teeth)),
              controller: experiencias_exodoncias,
              keyboardType: TextInputType.text,

            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Higiene oral", icon: Icon(FontAwesomeIcons.teeth)),
              controller: higiene_oral,
              keyboardType: TextInputType.text,

            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Tipo de Cepillo", icon: Icon(FontAwesomeIcons.tooth)),
              controller: tipo_cepillo,
              keyboardType: TextInputType.text,

            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Técnica de cepillado", icon: Icon(FontAwesomeIcons.teeth)),
              controller: tecnica_cepillado,
              keyboardType: TextInputType.text,

            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Frecuencia de cepillado", icon: Icon(FontAwesomeIcons.teeth)),
              controller: frecuencia_cepillado,
              keyboardType: TextInputType.text,

            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Otras ayuda para la higiene oral", icon: Icon(FontAwesomeIcons.plusCircle)),
              controller: ayudas_higiene_extras,
              keyboardType: TextInputType.text,

            ),
          ),
        ],
      ),
    );
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

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: fecha_selec,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != fecha_selec)
      setState(() {
        fecha_selec = picked;
      });
  }

}