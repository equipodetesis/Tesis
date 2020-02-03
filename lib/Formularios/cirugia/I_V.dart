import 'package:expedientesodontologicos_app/Util/Util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class I_V extends StatefulWidget {
  @override
  _I_VState createState() => _I_VState();
}

class _I_VState extends State<I_V> {
  List<String> adicciones = ["Ninguna", "Tabaco", "Otras drogas", "Alcohol"];

  List<DropdownMenuItem> _items_adicciones = List();
  String _current_adiccion = "";

  List<String> alergias = [
    "Ninguna",
    "Antibioticos",
    "Anestesicos",
    "Analgesicos",
    "Alimentos",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_alergias = List();
  List<String> _current_alergias = List();

  List<String> digestivo = [
    "Ninguna",
    "Gastritis",
    "Ulcera peptica",
    "Hepatitis",
    "Cirrosis",
    "Colitis",
    "Sindrome de mala",
    "Absorcion",
    "Desnutricion",
    "otros"
  ];

  List<List<DropdownMenuItem>> _items_digestivo = List();
  List<String> _current_digestivo = List();

  List<String> respiratorio = [
    "Ninguna",
    "Gripe comun",
    "amigadalitis, faringitis",
    "sinusitis",
    "Asma",
    "Bronquitis",
    "Enfisema",
    "Tuberculosis",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_respiratorio = List();
  List<String> _current_respiratorio = List();

  List<String> cardiovascular = [
    "Ninguna",
    "hipertension",
    "Hipotension",
    "Angina de pecho",
    "Infarto miocardio",
    "Taquiarritmia",
    "Bradiarritmia",
    "Insuficiencia cardiaca congestiva",
    "fiebre reumatica",
    "Cardiopatias congenitas",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_cardiovascular = List();
  List<String> _current_cardiovascular = List();

  @override
  void initState() {
    _items_adicciones = Util().getDropdownMenuItem(adicciones);
    _current_adiccion = _items_adicciones.first.value;
    _items_alergias.add(Util().ajustarlistas(alergias, _current_alergias));
    _current_alergias.add(_items_alergias.last.first.value);
    _items_digestivo.add(Util().ajustarlistas(digestivo, _current_digestivo));
    _current_digestivo.add(_items_digestivo.last.first.value);
    _items_respiratorio.add(Util().ajustarlistas(respiratorio, _current_respiratorio));
    _current_respiratorio.add(_items_respiratorio.last.first.value);
    _items_cardiovascular.add(Util().ajustarlistas(cardiovascular, _current_cardiovascular));
    _current_cardiovascular.add(_items_cardiovascular.last.first.value);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Antecedentes patologicos hereditarios"),
              ),
              Tab(
                child: Text("Antecedentes personales no patologico"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            antecedentes_patologicos_hereditarios(),
            antecedentes_personales_patologicos()
          ],
        ),
      ),
    );
  }

  Widget antecedentes_patologicos_hereditarios() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Madre", icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Abuela materna",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Abuelo materno",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Padre", icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Abuelo paterno",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "abuela paterna",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Antecedentes personales no patologicos:",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Grupo sanguineo",
                        icon: Icon(FontAwesomeIcons.female)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Factor Rh",
                        icon: Icon(FontAwesomeIcons.female)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Inmunizaciones infancia",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "inmunizaciones adulto",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Regimen alimenticio",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Condiciones habitacionales",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget antecedentes_personales_patologicos() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Enfermedades propias de la infancias",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Antecedentes traumaticos",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Antecedentes quirurgicos",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Alergias:"),
          ),
          Column(
              children: _current_alergias.map((value) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Icon(FontAwesomeIcons.apple),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(1),
                        child: DropdownButton(
                          isExpanded: true,
                          items:
                              _items_alergias[_current_alergias.indexOf(value)],
                          value: _current_alergias[
                              _current_alergias.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_alergias[
                                  _current_alergias.indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_alergias[_current_alergias.indexOf(value)] == "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra alergia",
                              icon: Icon(
                                FontAwesomeIcons.female,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {},
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Container(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              child: Text("Añadir", style: TextStyle(color: Colors.blue),),
            onPressed: (){
              setState(() {
                _items_alergias.add(Util().ajustarlistas(alergias, _current_alergias));
              _current_alergias.add(_items_alergias.last.first.value);
              });
            },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "transfusiones", icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "¿Ha recibido radioterapia y/o quimioterapia",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Experiencia previa con anestesia",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Interrogatorio por aparatos y sistemas"),
          ),  

          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Aparato digestivo"),
          ), 
          Column(
              children: _current_digestivo.map((value) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Icon(FontAwesomeIcons.apple),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(1),
                        child: DropdownButton(
                          isExpanded: true,
                          items:
                              _items_digestivo[_current_digestivo.indexOf(value)],
                          value: _current_digestivo[
                              _current_digestivo.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_digestivo[
                                  _current_digestivo.indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_digestivo[_current_digestivo.indexOf(value)] == "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra alergia",
                              icon: Icon(
                                FontAwesomeIcons.female,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {},
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Container(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              child: Text("Añadir", style: TextStyle(color: Colors.blue),),
            onPressed: (){
              setState(() {
                _items_digestivo.add(Util().ajustarlistas(digestivo, _current_digestivo));
              _current_digestivo.add(_items_digestivo.last.first.value);
              });
            },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Aparato respiratorio"),
          ), 
          Column(
              children: _current_respiratorio.map((value) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Icon(FontAwesomeIcons.apple),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(1),
                        child: DropdownButton(
                          isExpanded: true,
                          items:
                              _items_respiratorio[_current_respiratorio.indexOf(value)],
                          value: _current_respiratorio[
                              _current_respiratorio.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_respiratorio[
                                  _current_respiratorio.indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_respiratorio[_current_respiratorio.indexOf(value)] == "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra alergia",
                              icon: Icon(
                                FontAwesomeIcons.female,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {},
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Container(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              child: Text("Añadir", style: TextStyle(color: Colors.blue),),
            onPressed: (){
              setState(() {
                _items_respiratorio.add(Util().ajustarlistas(respiratorio, _current_respiratorio));
              _current_respiratorio.add(_items_respiratorio.last.first.value);
              });
            },
            ),
          ),
          
          Column(
              children: _current_cardiovascular.map((value) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(1),
                        child: ListTile(
                          leading: Icon(Icons.cached),
                            title: DropdownButton(
                            isExpanded: true,
                            items:
                                _items_cardiovascular[_current_cardiovascular.indexOf(value)],
                            value: _current_cardiovascular[
                                _current_cardiovascular.indexOf(value)],
                            onChanged: (value2) {
                              setState(() {
                                _current_cardiovascular[
                                    _current_cardiovascular.indexOf(value)] = value2;
                              });
                            },
                          ),
                          subtitle: Text("Cardiovascular"),
                        ),
                      ),
                    ),
                  ],
                ),
                _current_cardiovascular[_current_cardiovascular.indexOf(value)] == "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra alergia",
                              icon: Icon(
                                FontAwesomeIcons.female,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {},
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Container(
            alignment: Alignment.centerLeft,
            child: FlatButton(
              child: Text("Añadir", style: TextStyle(color: Colors.blue),),
            onPressed: (){
              setState(() {
                _items_cardiovascular.add(Util().ajustarlistas(cardiovascular, _current_cardiovascular));
              _current_cardiovascular.add(_items_cardiovascular.last.first.value);
              });
            },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Antecedentes personales no patologicos:",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Grupo sanguineo",
                        icon: Icon(FontAwesomeIcons.female)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Factor Rh",
                        icon: Icon(FontAwesomeIcons.female)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Inmunizaciones infancia",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "inmunizaciones adulto",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Regimen alimenticio",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Condiciones habitacionales",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
