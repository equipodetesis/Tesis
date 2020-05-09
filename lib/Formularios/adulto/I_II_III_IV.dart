import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Adulto.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expedientesodontologicos_app/Util/Util.dart';
import 'package:provider/provider.dart';

class I_II_III_IV extends StatefulWidget {
  @override
  State<I_II_III_IV> createState() {
    return I_II_III_IV_State();
  }
}

class I_II_III_IV_State extends State<I_II_III_IV> {

  List sexos = ["Masculino", "Femenino"];
  List<DropdownMenuItem> _sexolist;

  Widget general;
  Widget motivohistoria;


  @override
  void initState() {
    Provider.of<General>(context, listen: false).userid = Provider.of<LoginState>(context, listen: false).uid;
    if(Provider.of<General>(context, listen: false).fecha_inicio == "")Provider.of<General>(context, listen: false).fecha_inicio = DateFormat("y-M-d").format(DateTime.now());

    _sexolist = Util().getDropdownMenuItem(sexos);
    if(Provider.of<General>(context, listen: false).sexo == "") Provider.of<General>(context, listen: false).sexo = _sexolist.first.value;

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("General"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[generalI()],
        ),
      ),
    );
  }

  Widget generalI() {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "Nombre",
            icon: Icon(Icons.person),
          )),
          //controller: nombre,
          initialValue: Provider.of<General>(context).nombre,
          keyboardType: TextInputType.text,
          onChanged: ((value){
            if(value!=null || value.length>0) {
              Provider.of<General>(context).nombre = value;
              Provider.of<General>(context).cambiado=true;

            }
          }),
        ),
      ),
      Row(
        children: <Widget>[
          Container(
            child: Icon(FontAwesomeIcons.venusMars),
            margin: EdgeInsets.all(10),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: DropdownButton(
                isExpanded: true,
                items: _sexolist,
                value: Provider.of<General>(context).sexo,
                onChanged: (value) {
                  setState(() {
                    Provider.of<General>(context).sexo = value;
                    Provider.of<General>(context).cambiado=true;
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
          decoration: (InputDecoration(
            labelText: "Estado civil",
            icon: Icon(FontAwesomeIcons.userFriends),
          )),
          //controller: estado_civil,
          keyboardType: TextInputType.text,
          initialValue: Provider.of<General>(context).estado_civil,
          onChanged: (value){
            Provider.of<General>(context).estado_civil = value;
            Provider.of<General>(context).cambiado=true;
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "Direccion",
            icon: Icon(Icons.location_on),
          )),
          //controller: direccion,
          keyboardType: TextInputType.text,
          initialValue: Provider.of<General>(context).direccion,
          onChanged: (value){
            Provider.of<General>(context).direccion = value;
            Provider.of<General>(context).cambiado=true;
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "Procedencia",
            icon: Icon(FontAwesomeIcons.city),
          )),
          //controller: procedencia,
          keyboardType: TextInputType.text,
          initialValue: Provider.of<General>(context).procedencia,
          onChanged: (value){
            Provider.of<General>(context).procedencia = value;
            Provider.of<General>(context).cambiado=true;
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "Telefono",
            icon: Icon(Icons.phone_android),
          )),
          //controller: telefono,
          keyboardType: TextInputType.phone,
          initialValue: Provider.of<General>(context).telefono,
          onChanged: (value){
            Provider.of<General>(context).telefono = value;
            Provider.of<General>(context).cambiado=true;
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "Ocupacion",
            icon: Icon(Icons.work),
          )),
          //controller: ocupacion,
          keyboardType: TextInputType.text,
          initialValue: Provider.of<General>(context).ocupacion,
          onChanged: (value){
            Provider.of<General>(context).ocupacion = value;
            Provider.of<General>(context).cambiado=true;
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "Emergencia",
            icon: Icon(Icons.report_problem),
          )),
          //controller: emergencia,
          keyboardType: TextInputType.text,
          initialValue: Provider.of<General>(context).emergencia,
          onChanged: (value){
            Provider.of<General>(context).emergencia = value;
            Provider.of<General>(context).cambiado=true;
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "Referencia",
            icon: Icon(Icons.record_voice_over),
          )),
          //controller: referencia,
          keyboardType: TextInputType.text,
          initialValue: Provider.of<General>(context).referencia,
          onChanged: (value){
            Provider.of<General>(context).referencia = value;
            Provider.of<General>(context).cambiado=true;
          },
        ),
      ),
      ListTile(
        leading: Icon(Icons.calendar_today),
        title: Text(
          Provider.of<General>(context).fecha_inicio,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        subtitle: Text("Fecha de inicio"),
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "Edad",
            icon: Icon(Icons.cake),
          )),
          //controller: edad,
          keyboardType: TextInputType.number,
          initialValue: Provider.of<General>(context).edad,
          onChanged: (value){
            Provider.of<General>(context).edad = value;
            Provider.of<General>(context).cambiado=true;
          },
        ),
      ),
    ]));
  }

}
