import 'dart:async';
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
  TextEditingController nombre = TextEditingController(),
      estado_civil = TextEditingController(),
      direccion = TextEditingController(),
      emergencia = TextEditingController(),
      procedencia = TextEditingController(),
      telefono = TextEditingController(),
      ocupacion = TextEditingController(),
      referencia = TextEditingController(),
      fecha_inicio = TextEditingController(),
      edad = TextEditingController();

  TextEditingController motivo = TextEditingController(),
      historia = TextEditingController(),
      tratamiento = TextEditingController(),
      dientes_perdidos = TextEditingController(),
      causa_dientesperdidos = TextEditingController(),
      experiencias_exodoncias = TextEditingController(),
      higiene_oral = TextEditingController(),
      tipo_cepillo = TextEditingController(),
      tecnica_cepillado = TextEditingController(),
      frecuencia_cepillado = TextEditingController(),
      ayudas_higiene_extras = TextEditingController();

  DateTime fecha = DateTime.now();
  DateTime fecha_selec = DateTime.now();

  List sexos = ["Masculino", "Femenino"];
  List<DropdownMenuItem> _sexolist;
  String _currentsexo;

  Widget general;
  Widget motivohistoria;
  @override
  void initState() {
    _sexolist = Util().getDropdownMenuItem(sexos);
    _currentsexo = sexos[0];
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
          children: <Widget>[general, motivohistoria],
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
          controller: nombre,
          keyboardType: TextInputType.text,
          onChanged: ((value){
            if(value!=null || value.length>0) {
              String userid = Provider.of<LoginState>(context).uid;
              print(userid + "==============================");
              Provider.of<General>(context).userid = userid;
              Provider.of<General>(context).nombre = value;
              print(Provider.of<General>(context).nombre+ "==============================");
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
              margin: EdgeInsets.all(1),
              child: DropdownButton(
                isExpanded: true,
                items: _sexolist,
                value: _currentsexo,
                onChanged: (value) {
                  setState(() {
                    _currentsexo = value;
                    Provider.of<General>(context).sexo = value;
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
          controller: estado_civil,
          keyboardType: TextInputType.text,
          onChanged: (value){
            Provider.of<General>(context).estado_civil = value;
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
          controller: direccion,
          keyboardType: TextInputType.text,
          onChanged: (value){
            Provider.of<General>(context).direccion = value;
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
          controller: procedencia,
          keyboardType: TextInputType.text,
          onChanged: (value){
            Provider.of<General>(context).procedencia = value;
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
          controller: telefono,
          keyboardType: TextInputType.phone,
          onChanged: (value){
            Provider.of<General>(context).telefono = value;
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
          controller: ocupacion,
          keyboardType: TextInputType.text,
          onChanged: (value){
            Provider.of<General>(context).ocupacion = value;
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
          controller: emergencia,
          keyboardType: TextInputType.text,
          onChanged: (value){
            Provider.of<General>(context).emergencia = value;
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
          controller: referencia,
          keyboardType: TextInputType.text,
          onChanged: (value){
            Provider.of<General>(context).referencia = value;
          },
        ),
      ),
      ListTile(
        leading: Icon(Icons.calendar_today),
        title: Text(
          DateFormat("y-M-d").format(fecha),
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
          controller: edad,
          keyboardType: TextInputType.number,
          onChanged: (value){
            Provider.of<General>(context).edad = value;
          },
        ),
      ),
    ]));
  }

  Widget motivoHistoria() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Motivo de la consulta",
                  icon: Icon(FontAwesomeIcons.fileAlt)),
              controller: motivo,
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              onChanged: (value){
            Provider.of<Adulto>(context).motivo = value;
          },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Historia de la enfermedad actual",
                  icon: Icon(FontAwesomeIcons.fileAlt)),
              controller: historia,
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              onChanged: (value){
            Provider.of<Adulto>(context).historia = value;
          },
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(
              DateFormat("y-M-d").format(fecha_selec),
              style: TextStyle(
                  fontSize: 20.0, color: Theme.of(context).accentColor),
            ),
            subtitle: Text("Ultima visita odontologica"),
            onTap: () {
              Util()
                  .selectDate(context, fecha_selec, DateTime.now())
                  .then((fecha) {
                setState(() {
                  fecha_selec = fecha;
                  Provider.of<Adulto>(context).fecha_ultima_visita = DateFormat("y-M-d").format(fecha);
                });
              });
            },
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento Recibido",
                  icon: Icon(FontAwesomeIcons.bandAid)),
              controller: tratamiento,
              keyboardType: TextInputType.text,
              onChanged: (value){
            Provider.of<Adulto>(context).tratamiento_recibido = value;
          },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Dientes Perdidos",
                  icon: Icon(FontAwesomeIcons.tooth)),
              controller: dientes_perdidos,
              keyboardType: TextInputType.number,
              onChanged: (value){
            Provider.of<Adulto>(context).dientes_perdidos = value;
          },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Causa de Pérdida",
                  icon: Icon(FontAwesomeIcons.tooth)),
              controller: causa_dientesperdidos,
              keyboardType: TextInputType.text,
              onChanged: (value){
            Provider.of<Adulto>(context).causa_dientesperdidos = value;
          },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Experiencias de exodoncias previas",
                  icon: Icon(FontAwesomeIcons.teeth)),
              controller: experiencias_exodoncias,
              keyboardType: TextInputType.text,
              onChanged: (value){
            Provider.of<Adulto>(context).experiencias_exodoncias = value;
          },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Higiene oral",
                  icon: Icon(FontAwesomeIcons.teeth)),
              controller: higiene_oral,
              keyboardType: TextInputType.text,
              onChanged: (value){
            Provider.of<Adulto>(context).higiene_oral = value;
          },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tipo de Cepillo",
                  icon: Icon(FontAwesomeIcons.tooth)),
              controller: tipo_cepillo,
              keyboardType: TextInputType.text,
              onChanged: (value){
            Provider.of<Adulto>(context).tipo_cepillo = value;
          },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Técnica de cepillado",
                  icon: Icon(FontAwesomeIcons.teeth)),
              controller: tecnica_cepillado,
              keyboardType: TextInputType.text,
              onChanged: (value){
            Provider.of<Adulto>(context).tecnica_cepillado = value;
          },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Frecuencia de cepillado",
                  icon: Icon(FontAwesomeIcons.teeth)),
              controller: frecuencia_cepillado,
              keyboardType: TextInputType.text,
              onChanged: (value){
            Provider.of<Adulto>(context).frecuencia_cepillado = value;
          },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Otras ayuda para la higiene oral",
                  icon: Icon(FontAwesomeIcons.plusCircle)),
              controller: ayudas_higiene_extras,
              keyboardType: TextInputType.text,
              onChanged: (value){
            Provider.of<Adulto>(context).ayudas_higiene_extras = value;
          },
            ),
          ),
        ],
      ),
    );

  }

}
