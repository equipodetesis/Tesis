import 'package:expedientesodontologicos_app/ModelosFormularios/Adulto.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expedientesodontologicos_app/Util/Util.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

const String TAGENFERMEDADES = "enfermedades";
const String TAGREVISIONORGANOS = "organos";

class V_VI_VII extends StatefulWidget {
  @override
  _V_VI_VII_State createState() => _V_VI_VII_State();
}

class _V_VI_VII_State extends State<V_VI_VII> {
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

  List _todasrevision_organos = [
    "Dificultad para respirar",
    "Fatiga facil",
    "Trastornos digestivos",
    "Temblores",
    "Convulciones",
    "Edema de tobillos por la mañana",
    "Edema de tobillos por la tarde",
    "dolores faciales",
    "Tos severa",
    "Hemoptisis",
    "Cianosis",
    "Dolor articular",
    "Edema articular",
    "Problemas urinarios",
    "Tendencias a hemorragias",
    "Lesiones de piel",
  ];
  List _revision_organos_disponible = List();
  List _current_revision_organos = List();
  List<List<DropdownMenuItem>> _items_revision_organos = List();

  bool eliminableI = false;

  @override
  void initState() {
    _itemslocal = Util().getDropdownMenuItem(listlocales);
    _currentlocal = _itemslocal.first.value;
    aniadirnuevalista(TAGENFERMEDADES);
    aniadirnuevalista(TAGREVISIONORGANOS);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
              Tab(
                child: Text("Historia Familiar personal y social"),
              ),
              Tab(
                child: Text("Revision organos y sistemas"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            historiaMedica(),
            enfermedades(),
            historia_fam_per_soc(),
            revision_organos_y_sistemas()
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
          keyboardType: TextInputType.text,
          initialValue: Provider.of<Adulto>(context).cuidadoMedico,
          onChanged: (value) {
            Provider.of<Adulto>(context).cuidadoMedico = value;
          },
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
          keyboardType: TextInputType.number,
          initialValue: Provider.of<Adulto>(context).expediente,
          onChanged: (value) {
            Provider.of<Adulto>(context).expediente = value;
          },
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
              Provider.of<Adulto>(context).fecha_ultimo_examen_medico =
                  DateFormat("y-M-d").format(fecha);
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
          keyboardType: TextInputType.text,
          initialValue: Provider.of<Adulto>(context).medicamentos,
          onChanged: (value) {
            Provider.of<Adulto>(context).medicamentos = value;
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10.0),
        child: TextFormField(
          decoration: (InputDecoration(
            labelText: "Nombre del medico",
            icon: Icon(FontAwesomeIcons.userMd),
          )),
          keyboardType: TextInputType.text,
          initialValue: Provider.of<Adulto>(context).nombredelmedico,
          onChanged: (value) {
            Provider.of<Adulto>(context).nombredelmedico = value;
          },
        ),
      ),
    ]));
  }

  Widget enfermedades() {
    return SingleChildScrollView(
      child: Column(children: [
        Column(
          children: _current_enfermedades.map((value) {
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
                      items: _items_enfermedades[
                          _current_enfermedades.indexOf(value)],
                      value: _current_enfermedades[
                          _current_enfermedades.indexOf(value)],
                      itemHeight: 48,
                      onChanged: (selection) {
                        setState(() {
                          _current_enfermedades[
                              _current_enfermedades.indexOf(value)] = selection;
                          Provider.of<Adulto>(context).enfermedades =
                              _current_enfermedades;
                          actualizarlistas(TAGENFERMEDADES);
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
          onPressed: () {
            aniadirnuevalista(TAGENFERMEDADES);
          },
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            "Si alguna de estas enfermedades persiste, indique:",
            style: TextStyle(fontSize: 15),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: (InputDecoration(
              labelText: "Que enfermedad",
              icon: Icon(FontAwesomeIcons.briefcaseMedical),
            )),
            keyboardType: TextInputType.text,
            initialValue: Provider.of<Adulto>(context).enfermedad_persiste,
            onChanged: (value) {
              Provider.of<Adulto>(context).enfermedad_persiste = value;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: (InputDecoration(
              labelText: "Inicio",
              icon: Icon(FontAwesomeIcons.calendarDay),
            )),
            keyboardType: TextInputType.text,
            initialValue: Provider.of<Adulto>(context).iniciacion_enf,
            onChanged: (value) {
              Provider.of<Adulto>(context).iniciacion_enf = value;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: (InputDecoration(
              labelText: "Curso",
              icon: Icon(FontAwesomeIcons.calendarWeek),
            )),
            keyboardType: TextInputType.text,
            initialValue: Provider.of<Adulto>(context).curso,
            onChanged: (value) {
              Provider.of<Adulto>(context).curso = value;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: (InputDecoration(
              labelText: "Tratamiento",
              icon: Icon(FontAwesomeIcons.capsules),
            )),
            keyboardType: TextInputType.text,
            initialValue: Provider.of<Adulto>(context).tratamiento,
            onChanged: (value) {
              Provider.of<Adulto>(context).tratamiento = value;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: (InputDecoration(
              labelText: "Estado Actual",
              icon: Icon(FontAwesomeIcons.userInjured),
            )),
            keyboardType: TextInputType.text,
            initialValue: Provider.of<Adulto>(context).estadoactual,
            onChanged: (value) {
              Provider.of<Adulto>(context).estadoactual = value;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: (InputDecoration(
              labelText: "Describa 'Otros'",
              icon: Icon(FontAwesomeIcons.briefcaseMedical),
            )),
            keyboardType: TextInputType.text,
            initialValue:
                Provider.of<Adulto>(context).otros_enfermedades_padecidas,
            onChanged: (value) {
              Provider.of<Adulto>(context).otros_enfermedades_padecidas = value;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            "Ha sido sometido a:",
            style: TextStyle(fontSize: 15),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: (InputDecoration(
              labelText: "Operaciones",
              icon: Icon(FontAwesomeIcons.userNurse),
            )),
            keyboardType: TextInputType.text,
            initialValue: Provider.of<Adulto>(context).operaciones,
            onChanged: (value) {
              Provider.of<Adulto>(context).operaciones = value;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: (InputDecoration(
              labelText: "Transfuciones sanguineas",
              icon: Icon(FontAwesomeIcons.vials),
            )),
            keyboardType: TextInputType.text,
            initialValue: Provider.of<Adulto>(context).trans_sanguine_somet,
            onChanged: (value) {
              Provider.of<Adulto>(context).trans_sanguine_somet = value;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: (InputDecoration(
              labelText: "Radioterapia",
              icon: Icon(FontAwesomeIcons.portrait),
            )),
            keyboardType: TextInputType.text,
            initialValue: Provider.of<Adulto>(context).radioterapia,
            onChanged: (value) {
              Provider.of<Adulto>(context).radioterapia = value;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: (InputDecoration(
              labelText: "Vacunas recibidas especifique",
              icon: Icon(FontAwesomeIcons.plusCircle),
            )),
            keyboardType: TextInputType.text,
            initialValue: Provider.of<Adulto>(context).vacunas_recibidas,
            onChanged: (value) {
              Provider.of<Adulto>(context).vacunas_recibidas = value;
            },
          ),
        ),
      ]),
    );
  }

  Widget historia_fam_per_soc() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Historia familiar",
                  icon: Icon(FontAwesomeIcons.fileAlt)),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              initialValue: Provider.of<Adulto>(context).historia_familiar,
              onChanged: (value) {
                Provider.of<Adulto>(context).historia_familiar = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Historia personal y social",
                  icon: Icon(FontAwesomeIcons.fileAlt)),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              initialValue:
                  Provider.of<Adulto>(context).historia_personal_social,
              onChanged: (value) {
                Provider.of<Adulto>(context).historia_personal_social = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget revision_organos_y_sistemas() {
    return SingleChildScrollView(
      child: Column(children: [
        Column(
          children: _current_revision_organos.map((value) {
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
                      items: _items_revision_organos[
                          _current_revision_organos.indexOf(value)],
                      value: _current_revision_organos[
                          _current_revision_organos.indexOf(value)],
                      itemHeight: 48,
                      onChanged: (selection) {
                        setState(() {
                          _current_revision_organos[_current_revision_organos
                              .indexOf(value)] = selection;
                          Provider.of<Adulto>(context).revision_organos =
                              _current_revision_organos;
                          actualizarlistas(TAGREVISIONORGANOS);
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
          onPressed: () {
            aniadirnuevalista(TAGREVISIONORGANOS);
          },
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
                labelText: "Describa si es necesario",
                icon: Icon(FontAwesomeIcons.fileAlt)),
            minLines: 1,
            maxLines: 6,
            keyboardType: TextInputType.multiline,
            initialValue: Provider.of<Adulto>(context).describa_revision,
            onChanged: (value) {
              Provider.of<Adulto>(context).describa_revision = value;
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
                labelText:
                    "otros signos o sintomas que ha tenido recientemente",
                icon: Icon(FontAwesomeIcons.fileAlt)),
            minLines: 1,
            maxLines: 6,
            keyboardType: TextInputType.multiline,
            initialValue: Provider.of<Adulto>(context).otros_sintomas,
            onChanged: (value) {
              Provider.of<Adulto>(context).otros_sintomas = value;
            },
          ),
        ),
      ]),
    );
  }

  void aniadirnuevalista(String tag) {
    if (tag == TAGENFERMEDADES) {
      setState(() {
        _items_enfermedades
            .add(ajustarlistas(_todasenfermedades, _current_enfermedades));
        _current_enfermedades.add(_items_enfermedades.last.first.value);
        actualizarlistas(tag);
      });
    }
    if (tag == TAGREVISIONORGANOS) {
      setState(() {
        _items_revision_organos.add(
            ajustarlistas(_todasrevision_organos, _current_revision_organos));
        _current_revision_organos.add(_items_revision_organos.last.first.value);
        actualizarlistas(tag);
      });
    }
  }

  void actualizarlistas(String tag) {
    if (tag == TAGENFERMEDADES) {
      setState(() {
        _items_enfermedades.forEach((value) {
          value = ajustarlistas(_todasenfermedades, _current_enfermedades,
              exception: _items_enfermedades.indexOf(value));
        });
      });
    }
    if (tag == TAGREVISIONORGANOS) {
      setState(() {
        _items_revision_organos.forEach((value) {
          value = ajustarlistas(
              _todasrevision_organos, _current_revision_organos,
              exception: _items_revision_organos.indexOf(value));
        });
      });
    }
  }

  List<DropdownMenuItem> ajustarlistas(
      List listacompleta, List listaseleccionadas,
      {int exception}) {
    if (listaseleccionadas.length == 0) {
      return Util().getDropdownMenuItem(listacompleta);
    } else {
      List listtemp = listacompleta;
      int i = 0;
      listaseleccionadas.forEach((value) {
        if (i != exception) {
          listtemp.remove(value);
        } else {}
        i++;
      });

      return Util().getDropdownMenuItem(listtemp);
    }
  }
}
