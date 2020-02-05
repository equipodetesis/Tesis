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
    "Otras"
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

  List<String> genitourinario = [
    "Ninguna",
    "Infeccion",
    "Insuficiencia renal",
    "Dialisis",
    "sindrome nefrotico",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_genitourinario = List();
  List<String> _current_genitourinario = List();

  List<String> endocrino = [
    "Ninguna",
    "Hipotiroidismo",
    "Hipertiroidismo",
    "Hipoparatiroidismo",
    "Hiperparatiroidismo",
    "Insuficiencia adrenal",
    "Diabetes",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_endocrino = List();
  List<String> _current_endocrino = List();

  List<String> hematologicos = [
    "Ninguna",
    "Anemia",
    "Policemia",
    "Trastornos Leucitarios",
    "Leucemia",
    "Vasculares",
    "Plaquetarios",
    "Coagulopatia secundaria",
    "Hemofilia",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_hematologicos = List();
  List<String> _current_hematologicos = List();

  List<String> neurologico = [
    "Ninguna",
    "Parkinson",
    "Epilepsia",
    "Alzheimer",
    "Neurosis",
    "Paralisis",
    "Neuralgias",
    "Farmacodependencia",
    "Depresion",
    "Trastorno bipolar",
    "Trastorno psicotico",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_neurologico = List();
  List<String> _current_neurologico = List();

  List<String> musculo_esqueleto = [
    "Ninguna",
    "Artrosis",
    "Artritis",
    "Miopatia",
    "Neuropatia",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_musculo_esqueleto = List();
  List<String> _current_musculo_esqueleto = List();

  List<String> inmunologico = [
    "Ninguna",
    "Alergias",
    "Artritis reumatoide",
    "Lupus eritematoso sistematico",
    "Penfigo",
    "Liquen plano",
    "Eritema multiforme",
    "Estomatitis aftosa recurrente",
    "VIH/SIDA",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_inmunologico = List();
  List<String> _current_inmunologico = List();

  List<String> tegumentario = [
    "Ninguna",
    "Piel",
    "Pelo",
    "Glandulas cutaneas",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_tegumentario = List();
  List<String> _current_tegumentario = List();

  List<String> clasificacion_asa = [
    "1",
    "2",
    "3",
    "4",
    "5"
  ];

  List<DropdownMenuItem> _items_clasificacion_asa = List();
  String _current_clasificacion_asa = "";

  List<String> craneoforma = [
    "Dolicocefalico",
    "Mesocefalico",
    "Braquiocefalico"
  ];

  List<DropdownMenuItem> _items_craneoforma = List();
  String _current_craneoforma = "";

  List<String> temporomandibular = [
    "Ninguna",
    "Ruidos",
    "Chasquidos",
    "Crepitacion",
    "Dificultad para abrir la boca",
    "Dolor a la apertura o mov lateral",
    "Fatiga o dolor muscular",
    "Disminucion de la apertura",
    "Desviacion a la apertura/cierre"
  ];

  List<List<DropdownMenuItem>> _items_temporomandibular = List();
  List<String> _current_temporomandibular = List();
  @override
  void initState() {
    _items_adicciones = Util().getDropdownMenuItem(adicciones);
    _current_adiccion = _items_adicciones.first.value;
     _items_clasificacion_asa = Util().getDropdownMenuItem(clasificacion_asa);
    _current_clasificacion_asa = _items_clasificacion_asa.first.value;
     _items_craneoforma = Util().getDropdownMenuItem(craneoforma);
    _current_craneoforma = _items_craneoforma.first.value;
    _items_alergias.add(Util().ajustarlistas(alergias, _current_alergias));
    _current_alergias.add(_items_alergias.last.first.value);
    _items_digestivo.add(Util().ajustarlistas(digestivo, _current_digestivo));
    _current_digestivo.add(_items_digestivo.last.first.value);
    _items_respiratorio
        .add(Util().ajustarlistas(respiratorio, _current_respiratorio));
    _current_respiratorio.add(_items_respiratorio.last.first.value);
    _items_cardiovascular
        .add(Util().ajustarlistas(cardiovascular, _current_cardiovascular));
    _current_cardiovascular.add(_items_cardiovascular.last.first.value);
    _items_genitourinario
        .add(Util().ajustarlistas(genitourinario, _current_genitourinario));
    _current_genitourinario.add(_items_genitourinario.last.first.value);
    _items_endocrino.add(Util().ajustarlistas(endocrino, _current_endocrino));
    _current_endocrino.add(_items_endocrino.last.first.value);
    _items_hematologicos
        .add(Util().ajustarlistas(hematologicos, _current_hematologicos));
    _current_hematologicos.add(_items_hematologicos.last.first.value);
    _items_neurologico
        .add(Util().ajustarlistas(neurologico, _current_neurologico));
    _current_neurologico.add(_items_neurologico.last.first.value);
    _items_musculo_esqueleto.add(
        Util().ajustarlistas(musculo_esqueleto, _current_musculo_esqueleto));
    _current_musculo_esqueleto.add(_items_musculo_esqueleto.last.first.value);
    _items_inmunologico.add(
        Util().ajustarlistas(inmunologico, _current_inmunologico));
    _current_inmunologico.add(_items_inmunologico.last.first.value);
    _items_tegumentario.add(
        Util().ajustarlistas(tegumentario, _current_tegumentario));
    _current_tegumentario.add(_items_tegumentario.last.first.value);
     _items_temporomandibular.add(
        Util().ajustarlistas(temporomandibular, _current_temporomandibular));
    _current_temporomandibular.add(_items_temporomandibular.last.first.value);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Antecedentes patologicos hereditarios"),
              ),
              Tab(
                child: Text("Interrogatorio por aparatos y sistemas"),
              ),
              Tab(
                child: Text("Signos Vitales"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            antecedentes_patologicos_hereditarios(),
            interrogatorio_aparatos_sistemas(),
            signos_vitales()
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
            alignment: Alignment.centerLeft,
            child: Text("Adicciones"),
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
                items: _items_adicciones,
                value: _current_adiccion,
                onChanged: (value) {
                  setState(() {
                    _current_adiccion = value;
                  });
                },
              ),
            ),
          ),
        ],
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
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Antecedentes personales no patologicos"),
          ),
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
            child: Text("Alergias"),
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_alergias
                      .add(Util().ajustarlistas(alergias, _current_alergias));
                  _current_alergias.add(_items_alergias.last.first.value);
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "transfusiones",
                  icon: Icon(FontAwesomeIcons.female)),
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
        ],
      ),
    );
  }

  Widget interrogatorio_aparatos_sistemas() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
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
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          items: _items_digestivo[
                              _current_digestivo.indexOf(value)],
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
                              labelText: "otra",
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
                _current_digestivo[_current_digestivo.indexOf(value)] !=
                        "Ninguna"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Tratamiento",
                              icon: Icon(FontAwesomeIcons.female)),
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_digestivo
                      .add(Util().ajustarlistas(digestivo, _current_digestivo));
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
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          items: _items_respiratorio[
                              _current_respiratorio.indexOf(value)],
                          value: _current_respiratorio[
                              _current_respiratorio.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_respiratorio[_current_respiratorio
                                  .indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_respiratorio[_current_respiratorio.indexOf(value)] ==
                        "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra",
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
                _current_respiratorio[_current_respiratorio.indexOf(value)] !=
                        "Ninguna"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Tratamiento",
                              icon: Icon(FontAwesomeIcons.female)),
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_respiratorio.add(Util()
                      .ajustarlistas(respiratorio, _current_respiratorio));
                  _current_respiratorio
                      .add(_items_respiratorio.last.first.value);
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Aparato cardiovascular"),
          ),
          Column(
              children: _current_cardiovascular.map((value) {
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
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          items: _items_cardiovascular[
                              _current_cardiovascular.indexOf(value)],
                          value: _current_cardiovascular[
                              _current_cardiovascular.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_cardiovascular[_current_cardiovascular
                                  .indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_cardiovascular[
                            _current_cardiovascular.indexOf(value)] ==
                        "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra",
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
                _current_cardiovascular[
                            _current_cardiovascular.indexOf(value)] !=
                        "Ninguna"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Tratamiento",
                              icon: Icon(FontAwesomeIcons.female)),
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_cardiovascular.add(Util()
                      .ajustarlistas(cardiovascular, _current_cardiovascular));
                  _current_cardiovascular
                      .add(_items_cardiovascular.last.first.value);
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Aparato genitourinario"),
          ),
          Column(
              children: _current_genitourinario.map((value) {
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
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          items: _items_genitourinario[
                              _current_genitourinario.indexOf(value)],
                          value: _current_genitourinario[
                              _current_genitourinario.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_genitourinario[_current_genitourinario
                                  .indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_genitourinario[
                            _current_genitourinario.indexOf(value)] ==
                        "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
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
                _current_genitourinario[
                            _current_genitourinario.indexOf(value)] !=
                        "Ninguna"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Tratamiento",
                              icon: Icon(FontAwesomeIcons.female)),
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_genitourinario.add(Util()
                      .ajustarlistas(genitourinario, _current_genitourinario));
                  _current_genitourinario
                      .add(_items_genitourinario.last.first.value);
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Sistema endocrino"),
          ),
          Column(
              children: _current_endocrino.map((value) {
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
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          items: _items_endocrino[
                              _current_endocrino.indexOf(value)],
                          value: _current_endocrino[
                              _current_endocrino.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_endocrino[
                                  _current_endocrino.indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_endocrino[_current_endocrino.indexOf(value)] == "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
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
                _current_endocrino[_current_endocrino.indexOf(value)] !=
                        "Ninguna"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Tratamiento",
                              icon: Icon(FontAwesomeIcons.female)),
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_endocrino
                      .add(Util().ajustarlistas(endocrino, _current_endocrino));
                  _current_endocrino.add(_items_endocrino.last.first.value);
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Enfermedades hematologicas"),
          ),
          Column(
              children: _current_hematologicos.map((value) {
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
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          items: _items_hematologicos[
                              _current_hematologicos.indexOf(value)],
                          value: _current_hematologicos[
                              _current_hematologicos.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_hematologicos[_current_hematologicos
                                  .indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_hematologicos[_current_hematologicos.indexOf(value)] ==
                        "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
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
                _current_hematologicos[_current_hematologicos.indexOf(value)] !=
                        "Ninguna"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Tratamiento",
                              icon: Icon(FontAwesomeIcons.female)),
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_hematologicos.add(Util()
                      .ajustarlistas(hematologicos, _current_hematologicos));
                  _current_hematologicos
                      .add(_items_hematologicos.last.first.value);
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Sistema neurologico"),
          ),
          Column(
              children: _current_neurologico.map((value) {
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
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          items: _items_neurologico[
                              _current_neurologico.indexOf(value)],
                          value: _current_neurologico[
                              _current_neurologico.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_neurologico[
                                  _current_neurologico.indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_neurologico[_current_neurologico.indexOf(value)] ==
                        "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
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
                _current_neurologico[_current_neurologico.indexOf(value)] !=
                        "Ninguna"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Tratamiento",
                              icon: Icon(FontAwesomeIcons.female)),
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_neurologico.add(
                      Util().ajustarlistas(neurologico, _current_neurologico));
                  _current_neurologico.add(_items_neurologico.last.first.value);
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Sistema musculo_esqueletico"),
          ),
          Column(
              children: _current_musculo_esqueleto.map((value) {
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
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          items: _items_musculo_esqueleto[
                              _current_musculo_esqueleto.indexOf(value)],
                          value: _current_musculo_esqueleto[
                              _current_musculo_esqueleto.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_musculo_esqueleto[
                                  _current_musculo_esqueleto
                                      .indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_musculo_esqueleto[
                            _current_musculo_esqueleto.indexOf(value)] ==
                        "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
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
                _current_musculo_esqueleto[
                            _current_musculo_esqueleto.indexOf(value)] !=
                        "Ninguna"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Tratamiento",
                              icon: Icon(FontAwesomeIcons.female)),
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_musculo_esqueleto.add(Util().ajustarlistas(
                      musculo_esqueleto, _current_musculo_esqueleto));
                  _current_musculo_esqueleto
                      .add(_items_musculo_esqueleto.last.first.value);
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Sistema inmunologico"),
          ),
          Column(
              children: _current_inmunologico.map((value) {
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
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          items: _items_inmunologico[
                              _current_inmunologico.indexOf(value)],
                          value: _current_inmunologico[
                              _current_inmunologico.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_inmunologico[
                                  _current_inmunologico
                                      .indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_inmunologico[
                            _current_inmunologico.indexOf(value)] ==
                        "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
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
                _current_inmunologico[
                            _current_inmunologico.indexOf(value)] !=
                        "Ninguna"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Tratamiento",
                              icon: Icon(FontAwesomeIcons.female)),
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_inmunologico.add(Util().ajustarlistas(
                      inmunologico, _current_inmunologico));
                  _current_inmunologico
                      .add(_items_inmunologico.last.first.value);
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Sistema tegumentario"),
          ),
          Column(
              children: _current_tegumentario.map((value) {
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
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          items: _items_tegumentario[
                              _current_tegumentario.indexOf(value)],
                          value: _current_tegumentario[
                              _current_tegumentario.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_tegumentario[
                                  _current_tegumentario
                                      .indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_tegumentario[
                            _current_tegumentario.indexOf(value)] ==
                        "Otras"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
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
                _current_tegumentario[
                            _current_tegumentario.indexOf(value)] !=
                        "Ninguna"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Tratamiento",
                              icon: Icon(FontAwesomeIcons.female)),
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_tegumentario.add(Util().ajustarlistas(
                      tegumentario, _current_tegumentario));
                  _current_tegumentario
                      .add(_items_tegumentario.last.first.value);
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Clasificacion A.S.A"),
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
                items: _items_clasificacion_asa,
                value: _current_clasificacion_asa,
                onChanged: (value) {
                  setState(() {
                    _current_clasificacion_asa = value;
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

  Widget signos_vitales(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Frecuencia cardiaca",
                      icon: Icon(FontAwesomeIcons.thermometerEmpty),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Tension arterial",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Frecuencia respiratoria",
                      icon: Icon(FontAwesomeIcons.thermometerEmpty),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Temperatura",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Exploracion fisica"),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Peso (kg)",
                      icon: Icon(FontAwesomeIcons.thermometerEmpty),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Talla",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Constitucion fisica", icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Cabeza"),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Craneo"),
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
                items: _items_craneoforma,
                value: _current_craneoforma,
                onChanged: (value) {
                  setState(() {
                    _current_craneoforma = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Exostosis",
                      icon: Icon(FontAwesomeIcons.thermometerEmpty),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Endostosis",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Cara"),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Asimetrias"),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Transversales",
                      icon: Icon(FontAwesomeIcons.thermometerEmpty),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Longitudinales",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Globo ocular"),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Enoftalmo",
                      icon: Icon(FontAwesomeIcons.thermometerEmpty),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "exoftalmo",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
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
                    labelText: "Movilidad",
                    icon: Icon(FontAwesomeIcons.thermometerFull),
                  )),
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                  },
                ),
           ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Pupilas"),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Midriasis",
                      icon: Icon(FontAwesomeIcons.thermometerEmpty),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Miosis",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
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
                labelText: "Reflejo pupilar",
                icon: Icon(FontAwesomeIcons.thermometerFull),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Nariz",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Piel"),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Color",
                icon: Icon(FontAwesomeIcons.thermometerEmpty),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
              },
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Palida",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Cianotica",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Enrojecida",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Manchas",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Musculos"),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Hipotonicos",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Hipertonicos",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Espasticos",
                      icon: Icon(FontAwesomeIcons.thermometerFull),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                    },
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Cuello"),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Ganglios linfaticos",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Articulacion temporomandibular"),
          ),
          Column(
              children: _current_temporomandibular.map((value) {
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
                              _items_temporomandibular[_current_temporomandibular.indexOf(value)],
                          value: _current_temporomandibular[
                              _current_temporomandibular.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_temporomandibular[
                                  _current_temporomandibular.indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_temporomandibular[_current_temporomandibular.indexOf(value)] != "Ninguna"
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Describa",
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
              child: Text(
                "Añadir",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                setState(() {
                  _items_temporomandibular
                      .add(Util().ajustarlistas(temporomandibular, _current_temporomandibular));
                  _current_temporomandibular.add(_items_temporomandibular.last.first.value);
                });
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
