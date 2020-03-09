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
  bool cuidado_medico = false;
  List<DropdownMenuItem> _itemslocal;
  List<String> listlocales = ["Ninguna", "Hospital", "Clínica"];

  DateTime ultimo_examen_medico = DateTime.now();

  List _enfermedades = [
    "Ninguna",
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
  List _current_enfermedades = List();
  List<List<DropdownMenuItem>> _items_enfermedades = List();

  List _revision_organos = [
    "Ninguna",
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
  List _current_revision_organos = List();
  List<List<DropdownMenuItem>> _items_revision_organos = List();

  List _sometido = [
    "Ninguna",
    "Operaciones",
    "Transfuciones",
    "Radioteparia",
  ];
  List _current_sometido = List();
  List<List<DropdownMenuItem>> _items_sometido = List();

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

  String _current_higiene ;
  List<DropdownMenuItem> _items_higiene = List();

  String _current_calculo ;
  List<DropdownMenuItem> _items_calculo = List();

  String _current_salivacion ;
  List<DropdownMenuItem> _items_salivacion = List();

  @override
  void initState() {
    _items_higiene = Util().getDropdownMenuItem(opciones1);
    _current_higiene = _items_higiene.first.value;
    _items_calculo = Util().getDropdownMenuItem(opciones2);
    _current_calculo = _items_calculo.first.value;
    _items_salivacion = Util().getDropdownMenuItem(opciones2);
    _current_salivacion = _items_salivacion.first.value;
    _itemslocal = Util().getDropdownMenuItem(listlocales);
    _currentlocal = _itemslocal.first.value;
    _items_enfermedades.add(Util().ajustarlistas(_enfermedades, _current_enfermedades));
    _current_enfermedades.add(_items_enfermedades.last.first.value);
    _items_revision_organos.add(Util().ajustarlistas(_revision_organos, _current_revision_organos));
    _current_revision_organos.add(_items_revision_organos.last.first.value);
    _items_sometido.add(Util().ajustarlistas(_sometido, _current_sometido));
    _current_sometido.add(_items_sometido.last.first.value);
    // TODO: implement initState
    super.initState();

    Provider.of<Adulto>(context, listen: false).enfermedades.add(_currentlocal);
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
                child: Text("Revision organos y sistemas"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[historiaMedica(), revision_organos_y_sistemas()],
        ),
      ),
    );
  }

  Widget historiaMedica() {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                child: Icon(FontAwesomeIcons.briefcaseMedical)),
            Expanded(child: Text("¿Ha estado el paciente bajo cuidado medico?")),
            Checkbox(
              value: cuidado_medico,
              onChanged: (value) {
                setState(() {
                  cuidado_medico = value;
                });
              },
            )
          ],
        ),
      ),
      cuidado_medico
          ? Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text("Establecimiento"),
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
                        .selectDate(
                            context, ultimo_examen_medico, DateTime.now())
                        .then((fecha) {
                      setState(() {
                        ultimo_examen_medico = fecha;
                        Provider.of<Adulto>(context)
                                .fecha_ultimo_examen_medico =
                            DateFormat("y-M-d").format(fecha);
                      });
                    });
                  },
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
                )
              ],
            )
          : Container(),
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
        margin: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        child: Text("Enfermedades"),
      ),
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
                    disabledHint: Text(_current_enfermedades[_current_enfermedades.indexOf(value)]),
                    items: _items_enfermedades[_current_enfermedades.indexOf(value)] == _items_enfermedades.last ?
                    _items_enfermedades[_current_enfermedades.indexOf(value)]:
                    null,
                    value: _current_enfermedades[
                        _current_enfermedades.indexOf(value)],
                    itemHeight: 48,
                    onChanged: (selection) {
                      setState(() {
                        _current_enfermedades[
                            _current_enfermedades.indexOf(value)] = selection;
                        Provider.of<Adulto>(context).enfermedades =
                            _current_enfermedades;
                      });
                    },
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _current_enfermedades.last != _enfermedades.first
              ? FlatButton(
                  child: Text(
                    "Añadir",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    setState(() {
                      _items_enfermedades.add(Util()
                          .ajustarlistas(_enfermedades, _current_enfermedades));
                      _current_enfermedades
                          .add(_items_enfermedades.last.first.value);
                    });
                  },
                )
              : Container(),
          _current_enfermedades.length > 1
              ? FlatButton(
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    setState(() {
                      _current_enfermedades.removeLast();
                      _items_enfermedades.removeLast();
                    });
                  },
                )
              : Container(),
        ],
      ),
      _current_enfermedades.first != _enfermedades.first
          ? Column(
              children: <Widget>[
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
                    initialValue:
                        Provider.of<Adulto>(context).enfermedad_persiste,
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
                    initialValue: Provider.of<Adulto>(context)
                        .otros_enfermedades_padecidas,
                    onChanged: (value) {
                      Provider.of<Adulto>(context)
                          .otros_enfermedades_padecidas = value;
                    },
                  ),
                )
              ],
            )
          : Container(),
      Container(
        margin: EdgeInsets.all(10),
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Text(
            "Ha sido sometido a:",
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
      Column(
          children: _current_sometido.map((value) {
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Icon(FontAwesomeIcons.userNurse),
                  margin: EdgeInsets.all(10),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: DropdownButton(
                      isExpanded: true,
                      disabledHint: Text(_current_sometido[_current_sometido.indexOf(value)]),
                      items: _items_sometido[_current_sometido.indexOf(value)] == _items_sometido.last ?
                      _items_sometido[_current_sometido.indexOf(value)]:
                      null,
                      value: _current_sometido[_current_sometido.indexOf(value)],
                      onChanged: (value2) {
                        setState(() {
                          _current_sometido[_current_sometido.indexOf(value)] =
                              value2;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            _current_sometido[_current_sometido.indexOf(value)] == _sometido[1]
                ? Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Describa operacion",
                          icon: Icon(FontAwesomeIcons.pills)),
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                    ),
                  )
                : Container(),
          ],
        );
      }).toList()),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _current_sometido.last != _sometido.first && _items_sometido.last.length > 2
              ? Container(
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    child: Text(
                      "Añadir",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      setState(() {
                        _items_sometido.add(
                            Util().ajustarlistas(_sometido, _current_sometido));
                        _current_sometido.add(_items_sometido.last.first.value);
                      });
                    },
                  ),
                )
              : Container(),
          _current_sometido.length > 1
              ? FlatButton(
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    setState(() {
                      _current_sometido.removeLast();
                      _items_sometido.removeLast();
                    });
                  },
                )
              : Container(),
        ],
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
          initialValue: Provider.of<Adulto>(context).historia_personal_social,
          onChanged: (value) {
            Provider.of<Adulto>(context).historia_personal_social = value;
          },
        ),
      ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Revision de organos y sistemas',
              style: TextStyle(fontSize: 15),
            ),
          ),
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
                        disabledHint: Text(_current_revision_organos[
                        _current_revision_organos.indexOf(value)]),
                        items: _items_revision_organos[
                        _current_revision_organos.indexOf(value)] ==
                            _items_revision_organos.last
                            ? _items_revision_organos[
                        _current_revision_organos.indexOf(value)]
                            : null,
                        value: _current_revision_organos[
                        _current_revision_organos.indexOf(value)],
                        itemHeight: 48,
                        onChanged: (selection) {
                          setState(() {
                            _current_revision_organos[_current_revision_organos
                                .indexOf(value)] = selection;
                            Provider.of<Adulto>(context).revision_organos =
                                _current_revision_organos;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_revision_organos.last != _revision_organos.first && _items_revision_organos.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_revision_organos.add(Util().ajustarlistas(
                        _revision_organos, _current_revision_organos));
                    _current_revision_organos
                        .add(_items_revision_organos.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_revision_organos.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_revision_organos.removeLast();
                    _current_revision_organos.removeLast();
                  });
                },
              )
                  : Container(),
            ],
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
    ]));
  }

  Widget revision_organos_y_sistemas() {
    return SingleChildScrollView(
      child: Column(children: [

        Container(
          alignment: Alignment.centerLeft,
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
          alignment: Alignment.centerLeft,
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
                    labelText: "Pulsaciones",
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
          alignment: Alignment.centerLeft,
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
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.all(10),
          child: Text(
            "Higiene oral:",
            style: TextStyle(fontSize: 15),
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
                  items: _items_higiene,
                  value: _current_higiene,
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
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.all(10),
          child: Text(
            "Presencia de calculos:",
            style: TextStyle(fontSize: 15),
          ),
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
                  value: _current_calculo,
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
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.all(10),
          child: Text(
            "salivacion:",
            style: TextStyle(fontSize: 15),
          ),
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
                  value: _current_salivacion,
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
      ]),
    );
  }
}
