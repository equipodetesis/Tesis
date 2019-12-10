import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class General_I extends StatefulWidget{
  @override
  State<General_I> createState() {

    return General_I_State();
  }

}
class General_I_State extends State<General_I>{
  TextEditingController nombre = TextEditingController(),sexo = TextEditingController()
  ,estado_civil = TextEditingController(),direccion = TextEditingController(),emergencia = TextEditingController()
  ,procedencia = TextEditingController(),telefono = TextEditingController(),ocupacion = TextEditingController()
  ,referencia = TextEditingController(),fecha_inicio = TextEditingController(),edad = TextEditingController();

  TextEditingController motivo = TextEditingController(), historia = TextEditingController();
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
          title: Text("General"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: (){
                print(nombre.text + "\n" + sexo.text + "\n" + estado_civil + "\n" + direccion.text  + "\n" + edad.text);
              },
            )
          ],
          bottom: TabBar(
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

                ) ,
              ),

              Row(
                children: <Widget>[
                  Container(
                    child: Icon(Icons.brightness_5),
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

              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        DateFormat("y-M-d hh:mm a").format(fecha),
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
              maxLines: 6,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Historia de la enfermedad actual", icon: Icon(Icons.format_align_justify)),
              controller: historia,
              maxLines: 6,
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
                    child: Text(
                      DateFormat("y-M-d").format(fecha_selec),
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20.0, ),
                    ),
                  ),
                  onTap: (){
                    _selectDate(context);
                  },
                ),
              ],
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