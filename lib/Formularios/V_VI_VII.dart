import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expedientesodontologicos_app/Util/Util.dart';
import 'package:intl/intl.dart';

class V_VI_VII extends StatefulWidget {
  @override
  _V_VI_VII_State createState() => _V_VI_VII_State();
}

class _V_VI_VII_State extends State<V_VI_VII> {
  TextEditingController cuidado_medico = TextEditingController(),
      num_expediente = TextEditingController(),
      medicamentos = TextEditingController(),
      nombre_medico = TextEditingController();

  String _currentlocal;
  List<DropdownMenuItem> _itemslocal;
  List<String> listlocales = ["Hospital", "Clínica"];

  DateTime ultimo_examen_medico = DateTime.now();

  List _todasenfermedades = [
    "Alergias",
    "Anemia",
    "Artritis",
    "Cardiopatías",
    "Hipertensión",
    "Hipotensión",
    "Fiebre reumática",
    "Génito urinarias",
    "Hepatitis",
    "Tumores",
    "Cancer",
    "Diabetes",
    "Hipertiroidismo",
    "Hipotiroidismo",
    "Enfermedades de transmisiòn sexual",
    "Enfermedades de la niñez",
    "Hemofilia",
    "Otras enfermedades"
  ];
  List _enfermedadesdisponible = List();
  List _current_enfermedades = List();
  List<List<DropdownMenuItem>> _items_enfermedades = List();

  bool eliminableI = false;

  @override
  void initState() {
    _itemslocal = Util().getDropdownMenuItem(listlocales);
    _currentlocal = _itemslocal.first.value;
    aniadirnuevalista();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Historia medica anterior"),
              ),
              Tab(
                child: Text("Enfermedades padecidas"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
           historiaMedica() ,
           enfermedades() 
          ],
        ),
      ),
    );
  }

  Widget historiaMedica() {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "¿Ha estado el paciente bajo cuidado medico?",
            icon: Icon(FontAwesomeIcons.briefcaseMedical),
          )),
          controller: cuidado_medico,
          keyboardType: TextInputType.text,
        ),
      ),
      Row(
        children: <Widget>[
          Container(
            child: Icon(FontAwesomeIcons.hospital),
            margin: EdgeInsets.all(10),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(1),
              child: DropdownButton(
                isExpanded: true,
                items: _itemslocal,
                value: _currentlocal,
                onChanged: (value) {
                  setState(() {
                    _currentlocal = value;
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
            labelText: "Expediente",
            icon: Icon(FontAwesomeIcons.fileAlt),
          )),
          controller: num_expediente,
          keyboardType: TextInputType.number,
        ),
      ),
      ListTile(
        leading: Icon(Icons.calendar_today),
        title: Text(
          DateFormat("y-M-d").format(ultimo_examen_medico),
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20.0,
            color: ThemeData().accentColor,
          ),
        ),
        subtitle: Text("Ultimo examen medico"),
        onTap: () {
          Util()
              .selectDate(context, ultimo_examen_medico, DateTime.now())
              .then((fecha) {
            setState(() {
              ultimo_examen_medico = fecha;
            });
          });
        },
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "Describa drogas o medicamentos que toma",
            icon: Icon(FontAwesomeIcons.pills),
          )),
          controller: cuidado_medico,
          keyboardType: TextInputType.text,
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "Nombre del medico",
            icon: Icon(FontAwesomeIcons.userMd),
          )),
          controller: cuidado_medico,
          keyboardType: TextInputType.text,
        ),
      ),
    ]));
  }

  Widget enfermedades() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: _current_enfermedades.map((value){
            return Row(
            children: <Widget>[
              Container(
                child: Icon(FontAwesomeIcons.hospital),
                margin: EdgeInsets.all(10),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: DropdownButton(
                    isExpanded: true,
                    items: _items_enfermedades[_current_enfermedades.indexOf(value)],
                    value: _current_enfermedades[_current_enfermedades.indexOf(value)],
                    itemHeight: 48,
                    onChanged: (selection) {
                      setState(() {
                        _current_enfermedades[_current_enfermedades.indexOf(value)] = selection;

                      });
                    },
                  ),
                ),
              ),
            ],
          );
          }).toList(),
          ),
          FlatButton(
            child: Text("Añadir"),
            onPressed: (){
              aniadirnuevalista();
            },
            )
        ]
      ),
    );
  }

  void aniadirnuevalista() {
      setState(() {
        _items_enfermedades.add(ajustarlistaenfermedades(_todasenfermedades, _current_enfermedades));
        _current_enfermedades.add(_items_enfermedades.last.first.value);
      });
  }

  void actualizarlistas(){
    setState(() {
      _items_enfermedades.forEach((value){
        ajustarlistaenfermedades(_todasenfermedades, _current_enfermedades, exception: _items_enfermedades.indexOf(value));
      });
    });
  }
  List<DropdownMenuItem> ajustarlistaenfermedades(List listacompleta, List listaseleccionadas, {int exception}) {
    if (listaseleccionadas.length == 0) {
      return Util().getDropdownMenuItem(listacompleta);
    } else {
      List listtemp = listacompleta;

      listaseleccionadas.forEach((value) {
        listtemp.remove(value);
      });

      return Util().getDropdownMenuItem(listtemp);
    }
  }
}
