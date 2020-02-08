import 'package:expedientesodontologicos_app/ModelosFormularios/Adulto.dart';
import 'package:expedientesodontologicos_app/Util/Util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

const String TAGENFERMEDADES = "enfermedades";
const String TAGREVISIONORGANOS = "organos";

class VIII_XV extends StatefulWidget {
  @override
  VIII_XV_State createState() => VIII_XV_State();
}

class VIII_XV_State extends State<VIII_XV> {

  List<String> opciones1 = [
    "Buena",
    "Regular",
    "Deficiente"
  ];
  List<String> opciones2 = [
    "poco",
    "Regular",
    "Abundante"
  ];

  String _current_higiene = "";
  List<DropdownMenuItem> _items_higiene = List();

  String _current_calculo = "";
  List<DropdownMenuItem> _items_calculo = List();

  String _current_salivacion = "";
  List<DropdownMenuItem> _items_salivacion = List();

  @override
  void initState() {
    _items_higiene = Util().getDropdownMenuItem(opciones1);
    _current_higiene = _items_higiene.first.value;
    _items_calculo = Util().getDropdownMenuItem(opciones2);
    _current_calculo = _items_calculo.first.value;
    _items_salivacion = Util().getDropdownMenuItem(opciones2);
    _current_salivacion = _items_salivacion.first.value;

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
                child: Text("Signos Vitales"),
              ),
              Tab(
                child: Text("Reconocimiento general cavidad bucal"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            signos_vitales(),
          examen_clinico_bucal()],
        ),
      ),
    );
  }

  Widget signos_vitales() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Presion sanguinea (tomela en varias citas, si es necesario)",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Minima",
                      icon: Icon(FontAwesomeIcons.thermometerEmpty),
                    )),
                    keyboardType: TextInputType.text,
                    initialValue: Provider.of<Adulto>(context).presionsan_min,
                    onChanged: (value) {
                      Provider.of<Adulto>(context).presionsan_min = value;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Maxima",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    initialValue: Provider.of<Adulto>(context).presionsan_max,
                    onChanged: (value) {
                      Provider.of<Adulto>(context).presionsan_max = value;
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Pulso",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Numero de Pulsaciones",
                      icon: Icon(FontAwesomeIcons.heartbeat),
                    )),
                    keyboardType: TextInputType.text,
                    initialValue: Provider.of<Adulto>(context).pulsaciones,
                    onChanged: (value) {
                      Provider.of<Adulto>(context).pulsaciones = value;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Ritmo",
                      icon: Icon(FontAwesomeIcons.heartbeat),
                    )),
                    keyboardType: TextInputType.text,
                    initialValue: Provider.of<Adulto>(context).ritmo,
                    onChanged: (value) {
                      Provider.of<Adulto>(context).ritmo = value;
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
                labelText: "Temperatura, (Tomela de ser necesario)",
                icon: Icon(FontAwesomeIcons.fire),
              )),
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).temperatura,
              onChanged: (value) {
                Provider.of<Adulto>(context).temperatura = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Examenes de laboratorio, describa",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).descripcion_examenes,
              onChanged: (value) {
                Provider.of<Adulto>(context).descripcion_examenes = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Revision Medica, describa",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).revision_medica,
              onChanged: (value) {
                Provider.of<Adulto>(context).revision_medica = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Examen fisico de cara y cuello",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue:
                  Provider.of<Adulto>(context).examenfisico_caracuello,
              onChanged: (value) {
                Provider.of<Adulto>(context).examenfisico_caracuello = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget examen_clinico_bucal() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Region vestibular",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).region_vestibular,
              onChanged: (value) {
                Provider.of<Adulto>(context).region_vestibular = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "paladar duro",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).paladar_duro,
              onChanged: (value) {
                Provider.of<Adulto>(context).paladar_duro = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Paladar blando",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).paladar_blando,
              onChanged: (value) {
                Provider.of<Adulto>(context).paladar_blando = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Orofaringe",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).orofaringe,
              onChanged: (value) {
                Provider.of<Adulto>(context).orofaringe = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Piso de la boca",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).piso_boca,
              onChanged: (value) {
                Provider.of<Adulto>(context).piso_boca = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Lengua:",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Cara dorsal",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).cara_dorsal,
              onChanged: (value) {
                Provider.of<Adulto>(context).cara_dorsal = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Cara ventral",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).cara_ventral,
              onChanged: (value) {
                Provider.of<Adulto>(context).cara_ventral = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Bordes",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).bordes,
              onChanged: (value) {
                Provider.of<Adulto>(context).bordes = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Encia",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).encia,
              onChanged: (value) {
                Provider.of<Adulto>(context).encia = value;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Dientes",
                icon: Icon(FontAwesomeIcons.fileAlt),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).dientes,
              onChanged: (value) {
                Provider.of<Adulto>(context).dientes = value;
              },
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                child: Icon(FontAwesomeIcons.teethOpen),
                margin: EdgeInsets.all(10),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(1),
                  child: DropdownButton(
                    isExpanded: true,
                    //items: _items_higiene,
                    value: Provider.of<Adulto>(context).higiene_oral,
                    onChanged: (value) {
                      setState(() {
                        _current_higiene = value;
                        Provider.of<Adulto>(context).higiene_oral = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                child: Icon(FontAwesomeIcons.circle),
                margin: EdgeInsets.all(10),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(1),
                  child: DropdownButton(
                    isExpanded: true,
                    items: _items_calculo,
                    value: Provider.of<Adulto>(context).prescencia_calculo,
                    onChanged: (value) {
                      setState(() {
                        _current_calculo = value;
                        Provider.of<Adulto>(context).prescencia_calculo = value;

                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                child: Icon(FontAwesomeIcons.tint),
                margin: EdgeInsets.all(10),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(1),
                  child: DropdownButton(
                    isExpanded: true,
                    items: _items_salivacion,
                    value: Provider.of<Adulto>(context).salivacion,
                    onChanged: (value) {
                      setState(() {
                        _current_salivacion = value;
                        Provider.of<Adulto>(context).salivacion = value;

                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
