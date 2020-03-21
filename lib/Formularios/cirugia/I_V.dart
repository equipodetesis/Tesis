import 'package:expedientesodontologicos_app/ModelosFormularios/Cirugia.dart';
import 'package:expedientesodontologicos_app/Util/Util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class I_V extends StatefulWidget {
  @override
  _I_VState createState() => _I_VState();
}

class _I_VState extends State<I_V> {
  List<String> adicciones = ["Ninguna", "Tabaco", "Alcohol", "Otras"];

  List<List<DropdownMenuItem>> _items_adicciones = List();
  List<String> _current_adicciones = List();

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

  List<String> clasificacion_asa = ["1", "2", "3", "4", "5"];

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

  List<String> radiografia = [
    "Ninguna",
    "Periapical",
    "Oclusal",
    "Ortopantomografia",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_radiografia = List();
  List<String> _current_radiografia = List();

  List<String> analisis_laboratorio = [
    "Ninguna",
    "Biometria hematica completa",
    "Quimica sanguinea",
    "Pruebas basicas de valoracion de la hemostasia"
  ];
  List<List<DropdownMenuItem>> _items_analisis_laboratorio = List();
  List<String> _current_analisis_laboratorio = List();

  DateTime fecha_retiosutura = DateTime.now();
  DateTime fecha_alta = DateTime.now();

  bool exostosis = false, endostosis = false, transversales = false, longitudinales = false,
  enoftalmo  = false, exoftalmo = false, midriasis  = false, miosis = false, palida = false,
  cianotica = false, enrojecida = false, manchas = false, hipotonico = false, hipertonico = false,
  espastico = false;

  FocusNode madreNode;

  @override
  void initState() {
    madreNode = FocusNode();

    _items_clasificacion_asa = Util().getDropdownMenuItem(clasificacion_asa);
    _current_clasificacion_asa = _items_clasificacion_asa.first.value;
    _items_craneoforma = Util().getDropdownMenuItem(craneoforma);
    _current_craneoforma = _items_craneoforma.first.value;
    _items_adicciones.add(Util().getDropdownMenuItem(adicciones));
    _current_adicciones.add(_items_adicciones.last.first.value);
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
    _items_inmunologico
        .add(Util().ajustarlistas(inmunologico, _current_inmunologico));
    _current_inmunologico.add(_items_inmunologico.last.first.value);
    _items_tegumentario
        .add(Util().ajustarlistas(tegumentario, _current_tegumentario));
    _current_tegumentario.add(_items_tegumentario.last.first.value);
    _items_temporomandibular.add(
        Util().ajustarlistas(temporomandibular, _current_temporomandibular));
    _current_temporomandibular.add(_items_temporomandibular.last.first.value);
    _items_radiografia
        .add(Util().ajustarlistas(radiografia, _current_radiografia));
    _current_radiografia.add(_items_radiografia.last.first.value);
    _items_analisis_laboratorio.add(Util()
        .ajustarlistas(analisis_laboratorio, _current_analisis_laboratorio));
    _current_analisis_laboratorio
        .add(_items_analisis_laboratorio.last.first.value);
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
                child: Text("Antecedentes patologicos hereditarios"),
              ),
              Tab(
                child: Text("Interrogatorio por aparatos y sistemas"),
              ),
              Tab(
                child: Text("Signos Vitales"),
              ),
              Tab(
                child: Text("Estudios de gabinete"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            antecedentes_patologicos_hereditarios(),
            interrogatorio_aparatos_sistemas(),
            signos_vitales(),
            estudios_gabinete()
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
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_madre = value;
              },
              focusNode: madreNode,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Abuela materna",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_abuelama = value;

              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Abuelo materno",
                  icon: Icon(FontAwesomeIcons.male)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_abueloma = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Padre", icon: Icon(FontAwesomeIcons.male)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_padre = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Abuelo paterno",
                  icon: Icon(FontAwesomeIcons.male)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_abuelopa = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "abuela paterna",
                  icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_abuelapa = value;

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
                        icon: Icon(FontAwesomeIcons.tint)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).grupo_sanguineo = value;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Factor Rh",
                        icon: Icon(FontAwesomeIcons.tint)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).factor_rh = value;
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
                  labelText: "Inmunizaciones infancia",
                  icon: Icon(FontAwesomeIcons.baby)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).inmunizaciones_infancia = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "inmunizaciones adulto",
                  icon: Icon(FontAwesomeIcons.male)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).inmunizaciones_adulto = value;
                },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Adicciones"),
          ),
          Column(
              children: _current_adicciones.map((value) {
                return Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(FontAwesomeIcons.appleAlt),
                          margin: EdgeInsets.all(10),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(1),
                            child: DropdownButton(
                              isExpanded: true,
                              disabledHint: Text(_current_adicciones[_current_adicciones.indexOf(value)]),
                              items: _items_adicciones[_current_adicciones.indexOf(value)] == _items_adicciones.last ?
                              _items_adicciones[_current_adicciones.indexOf(value)]:
                              null,
                              value: _current_adicciones[
                              _current_adicciones.indexOf(value)],
                              onChanged: (value2) {
                                setState(() {
                                  _current_adicciones[
                                  _current_adicciones.indexOf(value)] = value2;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    _current_adicciones[_current_adicciones.indexOf(value)] == adicciones.last
                        ? Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Otra Adiccion",
                            icon: Icon(
                              FontAwesomeIcons.appleAlt,
                              color: Colors.blue,
                            ),
                            labelStyle: TextStyle(color: Colors.blue)),
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          Provider.of<Cirugia>(context).otra_adiccion = value;
                        },
                      ),
                    )
                        : Container(),
                  ],
                );
              }).toList()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_adicciones.last != adicciones.first && adicciones.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_adicciones.add(Util()
                        .ajustarlistas(adicciones, _current_adicciones));
                    _current_adicciones
                        .add(_items_adicciones.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_adicciones.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_adicciones.removeLast();
                    _items_adicciones.removeLast();
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
                  labelText: "Regimen alimenticio",
                  icon: Icon(FontAwesomeIcons.hamburger)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).regimen_alimenticio = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Condiciones habitacionales",
                  icon: Icon(FontAwesomeIcons.houzz)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).condiciones_habitacionales = value;
              },
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
                  icon: Icon(FontAwesomeIcons.baby)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).enfermedades_infancia = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Antecedentes traumaticos",
                  icon: Icon(FontAwesomeIcons.userInjured)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antecedentes_traumaticos = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Antecedentes quirurgicos",
                  icon: Icon(FontAwesomeIcons.userMd)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antecedentes_quirurgicos = value;
              },
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
                      child: Icon(FontAwesomeIcons.appleAlt),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(1),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_alergias[_current_alergias.indexOf(value)]),
                          items: _items_alergias[_current_alergias.indexOf(value)] == _items_alergias.last ?
                          _items_alergias[_current_alergias.indexOf(value)]:
                          null,
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
                _current_alergias[_current_alergias.indexOf(value)] == alergias.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Otra alergia",
                              icon: Icon(
                                FontAwesomeIcons.appleAlt,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            Provider.of<Cirugia>(context).otra_alergia = value;
                          },
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_alergias.last != alergias.first && alergias.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_alergias.add(Util()
                        .ajustarlistas(alergias, _current_alergias));
                    _current_alergias
                        .add(_items_alergias.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_alergias.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_alergias.removeLast();
                    _items_alergias.removeLast();
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
                  labelText: "transfusiones",
                  icon: Icon(FontAwesomeIcons.vials)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "¿Ha recibido radioterapia y/o quimioterapia",
                  icon: Icon(FontAwesomeIcons.radiationAlt)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Experiencia previa con anestesia",
                  icon: Icon(FontAwesomeIcons.syringe)),
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
                      child: Icon(FontAwesomeIcons.cookieBite),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_digestivo[_current_digestivo.indexOf(value)]),
                          items: _items_digestivo[_current_digestivo.indexOf(value)] == _items_digestivo.last ?
                          _items_digestivo[_current_digestivo.indexOf(value)]:
                          null,
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
                _current_digestivo[_current_digestivo.indexOf(value)] == digestivo.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra",
                              icon: Icon(
                                FontAwesomeIcons.cookieBite,
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
          _current_digestivo.first != digestivo.first
              ? Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento",
                  icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_digestivo.last != digestivo.first && digestivo.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_digestivo.add(Util()
                        .ajustarlistas(digestivo, _current_digestivo));
                    _current_digestivo
                        .add(_items_digestivo.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_digestivo.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_digestivo.removeLast();
                    _items_digestivo.removeLast();
                  });
                },
              )
                  : Container(),
            ],
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
                      child: Icon(FontAwesomeIcons.running),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_respiratorio[_current_respiratorio.indexOf(value)]),
                          items: _items_respiratorio[_current_respiratorio.indexOf(value)] == _items_respiratorio.last ?
                          _items_respiratorio[_current_respiratorio.indexOf(value)]:
                          null,
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
                _current_respiratorio[_current_respiratorio.indexOf(value)] == respiratorio.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra",
                              icon: Icon(
                                FontAwesomeIcons.running,
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
          }).toList()
          ),
          _current_respiratorio.first != respiratorio.first
              ? Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento",
                  icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_respiratorio.last != respiratorio.first && respiratorio.last.length > 2
                  ? FlatButton(
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
              )
                  : Container(),
              _current_respiratorio.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_respiratorio.removeLast();
                    _items_respiratorio.removeLast();
                  });
                },
              )
                  : Container(),
            ],
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
                      child: Icon(FontAwesomeIcons.heart),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_cardiovascular[_current_cardiovascular.indexOf(value)]),
                          items: _items_cardiovascular[_current_cardiovascular.indexOf(value)] == _items_cardiovascular.last ?
                          _items_cardiovascular[_current_cardiovascular.indexOf(value)]:
                          null,
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
                _current_cardiovascular[_current_cardiovascular.indexOf(value)] == cardiovascular.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra",
                              icon: Icon(
                                FontAwesomeIcons.heart,
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
          _current_cardiovascular.first != cardiovascular.first
              ? Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento",
                  icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_cardiovascular.last != cardiovascular.first && cardiovascular.last.length > 2
                  ? FlatButton(
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
              )
                  : Container(),
              _current_cardiovascular.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_cardiovascular.removeLast();
                    _items_cardiovascular.removeLast();
                  });
                },
              )
                  : Container(),
            ],
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
                      child: Icon(FontAwesomeIcons.venusMars),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_genitourinario[_current_genitourinario.indexOf(value)]),
                          items: _items_genitourinario[_current_genitourinario.indexOf(value)] == _items_genitourinario.last ?
                          _items_genitourinario[_current_genitourinario.indexOf(value)]:
                          null,
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
                _current_genitourinario[_current_genitourinario.indexOf(value)] == genitourinario.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.venusMars,
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
          _current_genitourinario.first != genitourinario.first
              ? Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento",
                  icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_genitourinario.last != genitourinario.first && genitourinario.last.length > 2
                  ? FlatButton(
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
              )
                  : Container(),
              _current_genitourinario.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_genitourinario.removeLast();
                    _items_genitourinario.removeLast();
                  });
                },
              )
                  : Container(),
            ],
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
                      child: Icon(FontAwesomeIcons.drawPolygon),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_endocrino[_current_endocrino.indexOf(value)]),
                          items: _items_endocrino[_current_endocrino.indexOf(value)] == _items_endocrino.last ?
                          _items_endocrino[_current_endocrino.indexOf(value)]:
                          null,
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
                _current_endocrino[_current_endocrino.indexOf(value)] == endocrino.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.drawPolygon,
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
          _current_endocrino.first != endocrino.first
              ? Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento",
                  icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_endocrino.last != endocrino.first && endocrino.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_endocrino.add(Util()
                        .ajustarlistas(endocrino, _current_endocrino));
                    _current_endocrino
                        .add(_items_endocrino.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_endocrino.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_endocrino.removeLast();
                    _items_endocrino.removeLast();
                  });
                },
              )
                  : Container(),
            ],
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
                      child: Icon(FontAwesomeIcons.tint),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_hematologicos[_current_hematologicos.indexOf(value)]),
                          items: _items_hematologicos[_current_hematologicos.indexOf(value)] == _items_hematologicos.last ?
                          _items_hematologicos[_current_hematologicos.indexOf(value)]:
                          null,
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
                _current_hematologicos[_current_hematologicos.indexOf(value)] == hematologicos.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.tint,
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
          _current_hematologicos.first != hematologicos.first
              ? Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento",
                  icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_hematologicos.last != hematologicos.first && hematologicos.last.length > 2
                  ? FlatButton(
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
              )
                  : Container(),
              _current_hematologicos.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_hematologicos.removeLast();
                    _items_hematologicos.removeLast();
                  });
                },
              )
                  : Container(),
            ],
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
                      child: Icon(FontAwesomeIcons.brain),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_neurologico[_current_neurologico.indexOf(value)]),
                          items: _items_neurologico[_current_neurologico.indexOf(value)] == _items_neurologico.last ?
                          _items_neurologico[_current_neurologico.indexOf(value)]:
                          null,
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
                _current_neurologico[_current_neurologico.indexOf(value)] == neurologico.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.brain,
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
          _current_neurologico.first != neurologico.first
              ? Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento",
                  icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_neurologico.last != neurologico.first && neurologico.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_neurologico.add(Util()
                        .ajustarlistas(neurologico, _current_neurologico));
                    _current_neurologico
                        .add(_items_neurologico.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_neurologico.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_neurologico.removeLast();
                    _items_neurologico.removeLast();
                  });
                },
              )
                  : Container(),
            ],
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
                      child: Icon(FontAwesomeIcons.bone),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_musculo_esqueleto[_current_musculo_esqueleto.indexOf(value)]),
                          items: _items_musculo_esqueleto[_current_musculo_esqueleto.indexOf(value)] == _items_musculo_esqueleto.last ?
                          _items_musculo_esqueleto[_current_musculo_esqueleto.indexOf(value)]:
                          null,
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
                            _current_musculo_esqueleto.indexOf(value)] == musculo_esqueleto.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.bone,
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
          _current_musculo_esqueleto.first != musculo_esqueleto.first
              ? Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento",
                  icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_musculo_esqueleto.last != musculo_esqueleto.first && musculo_esqueleto.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_musculo_esqueleto.add(Util()
                        .ajustarlistas(musculo_esqueleto, _current_musculo_esqueleto));
                    _current_musculo_esqueleto
                        .add(_items_musculo_esqueleto.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_musculo_esqueleto.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_musculo_esqueleto.removeLast();
                    _items_musculo_esqueleto.removeLast();
                  });
                },
              )
                  : Container(),
            ],
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
                      child: Icon(FontAwesomeIcons.pastafarianism),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_inmunologico[_current_inmunologico.indexOf(value)]),
                          items: _items_inmunologico[_current_inmunologico.indexOf(value)] == _items_inmunologico.last ?
                          _items_inmunologico[_current_inmunologico.indexOf(value)]:
                          null,
                          value: _current_inmunologico[
                              _current_inmunologico.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_inmunologico[_current_inmunologico
                                  .indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_inmunologico[_current_inmunologico.indexOf(value)] == inmunologico.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.pastafarianism,
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
          _current_inmunologico.first != inmunologico.first
              ? Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento",
                  icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_inmunologico.last != inmunologico.first && inmunologico.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_inmunologico.add(Util()
                        .ajustarlistas(inmunologico, _current_inmunologico));
                    _current_inmunologico
                        .add(_items_inmunologico.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_inmunologico.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_inmunologico.removeLast();
                    _items_inmunologico.removeLast();
                  });
                },
              )
                  : Container(),
            ],
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
                      child: Icon(FontAwesomeIcons.allergies),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_tegumentario[_current_tegumentario.indexOf(value)]),
                          items: _items_tegumentario[_current_tegumentario.indexOf(value)] == _items_tegumentario.last ?
                          _items_tegumentario[_current_tegumentario.indexOf(value)]:
                          null,
                          value: _current_tegumentario[
                              _current_tegumentario.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_tegumentario[_current_tegumentario
                                  .indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_tegumentario[_current_tegumentario.indexOf(value)] == tegumentario.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.allergies,
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
          _current_tegumentario.first != tegumentario.first
              ? Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento",
                  icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_tegumentario.last != tegumentario.first && tegumentario.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_tegumentario.add(Util()
                        .ajustarlistas(tegumentario, _current_tegumentario));
                    _current_tegumentario
                        .add(_items_tegumentario.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_tegumentario.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_tegumentario.removeLast();
                    _items_tegumentario.removeLast();
                  });
                },
              )
                  : Container(),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Clasificacion A.S.A"),
          ),
          Row(
            children: <Widget>[
              Container(
                child: Icon(FontAwesomeIcons.male),
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

  Widget signos_vitales() {
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
                      labelText: "Frec cardiaca",
                      icon: Icon(FontAwesomeIcons.heartbeat),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Tension arterial",
                      icon: Icon(FontAwesomeIcons.heartbeat),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
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
                      labelText: "Frec respiratoria",
                      labelStyle: TextStyle(fontSize: 14),
                      icon: Icon(FontAwesomeIcons.biking),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Temperatura",
                      icon: Icon(FontAwesomeIcons.thermometerHalf),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
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
                      icon: Icon(FontAwesomeIcons.weight),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Talla",
                      icon: Icon(FontAwesomeIcons.tshirt),
                    )),
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
                  labelText: "Constitucion fisica",
                  icon: Icon(FontAwesomeIcons.running)),
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
                child: Icon(FontAwesomeIcons.userAlt),
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
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Exostosis")),
              Checkbox(
                value: exostosis,
                onChanged: (value) {
                  setState(() {
                    exostosis = value;
                  });
                },
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Endostosis")),
              Checkbox(
                value: endostosis,
                onChanged: (value) {
                  setState(() {
                    endostosis = value;
                  });
                },
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
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Transversal")),
              Checkbox(
                value: transversales,
                onChanged: (value) {
                  setState(() {
                    transversales = value;
                  });
                },
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Longitudinal")),
              Checkbox(
                value: longitudinales,
                onChanged: (value) {
                  setState(() {
                    longitudinales = value;
                  });
                },
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
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Enoftalmo")),
              Checkbox(
                value: enoftalmo,
                onChanged: (value) {
                  setState(() {
                    enoftalmo = value;
                  });
                },
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Exoftalmo")),
              Checkbox(
                value: exoftalmo,
                onChanged: (value) {
                  setState(() {
                    exoftalmo = value;
                  });
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Movilidad",
                icon: Icon(FontAwesomeIcons.eye),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Pupilas"),
          ),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Midriasis")),
              Checkbox(
                value: midriasis,
                onChanged: (value) {
                  setState(() {
                    midriasis = value;
                  });
                },
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Miosis")),
              Checkbox(
                value: miosis,
                onChanged: (value) {
                  setState(() {
                    miosis = value;
                  });
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Reflejo pupilar",
                icon: Icon(FontAwesomeIcons.eye),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Nariz", icon: Icon(FontAwesomeIcons.userAlt)),
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
                icon: Icon(FontAwesomeIcons.diagnoses),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Palida")),
              Checkbox(
                value: palida,
                onChanged: (value) {
                  setState(() {
                    palida = value;
                  });
                },
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Cianotica")),
              Checkbox(
                value: cianotica,
                onChanged: (value) {
                  setState(() {
                    cianotica = value;
                  });
                },
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Enrojecida")),
              Checkbox(
                value: enrojecida,
                onChanged: (value) {
                  setState(() {
                    enrojecida = value;
                  });
                },
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Manchas")),
              Checkbox(
                value: manchas,
                onChanged: (value) {
                  setState(() {
                    manchas = value;
                  });
                },
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
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Hipotonico")),
              Checkbox(
                value: hipotonico,
                onChanged: (value) {
                  setState(() {
                    hipotonico = value;
                  });
                },
              ),
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Hipertonido")),
              Checkbox(
                value: hipertonico,
                onChanged: (value) {
                  setState(() {
                    hipertonico = value;
                  });
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 10, left: 10),
                  child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Text("Espastico"),
              Checkbox(
                value: espastico,
                onChanged: (value) {
                  setState(() {
                    espastico = value;
                  });
                },
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
                  icon: Icon(FontAwesomeIcons.userAlt)),
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
                      child: Icon(FontAwesomeIcons.teethOpen),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(1),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_temporomandibular[_current_temporomandibular.indexOf(value)]),
                          items: _items_temporomandibular[_current_temporomandibular.indexOf(value)] == _items_temporomandibular.last ?
                          _items_temporomandibular[_current_temporomandibular.indexOf(value)]:
                          null,
                          value: _current_temporomandibular[
                              _current_temporomandibular.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_temporomandibular[
                                  _current_temporomandibular
                                      .indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }).toList()),
          _current_temporomandibular.first != temporomandibular.first
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_temporomandibular.last != temporomandibular.first && temporomandibular.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_temporomandibular.add(Util()
                        .ajustarlistas(temporomandibular, _current_temporomandibular));
                    _current_temporomandibular
                        .add(_items_temporomandibular.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_temporomandibular.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_temporomandibular.removeLast();
                    _items_temporomandibular.removeLast();
                  });
                },
              )
                  : Container(),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Cavidad oral"),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Labios", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Carrillos", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Paladar duro",
                  icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Paladar blando",
                  icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Orafaringe", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Piso de la boca",
                  icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Lengua", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Encia", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Dientes", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Padecimiento actual",
                  icon: Icon(FontAwesomeIcons.userInjured)),
              keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 6,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget estudios_gabinete() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Radiografia"),
          ),
          Column(
              children: _current_radiografia.map((value) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Icon(FontAwesomeIcons.vectorSquare),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(1),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_radiografia[_current_radiografia.indexOf(value)]),
                          items: _items_radiografia[_current_radiografia.indexOf(value)] == _items_radiografia.last ?
                          _items_radiografia[_current_radiografia.indexOf(value)]:
                          null,
                          value: _current_radiografia[
                              _current_radiografia.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_radiografia[
                                  _current_radiografia.indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            );
          }).toList()),
          _current_radiografia.first == radiografia.last
              ? Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Describa",
                  icon: Icon(
                    FontAwesomeIcons.vectorSquare,
                    color: Colors.blue,
                  ),
                  labelStyle: TextStyle(color: Colors.blue)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_radiografia.last != radiografia.first && radiografia.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_radiografia.add(Util()
                        .ajustarlistas(radiografia, _current_radiografia));
                    _current_radiografia
                        .add(_items_radiografia.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_radiografia.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_radiografia.removeLast();
                    _items_radiografia.removeLast();
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
                  labelText: "Interpretacion radiografica",
                  icon: Icon(FontAwesomeIcons.vectorSquare)),
              keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 6,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Analisis de laboratorio clinico"),
          ),
          Column(
              children: _current_analisis_laboratorio.map((value) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Icon(FontAwesomeIcons.flask),
                      margin: EdgeInsets.all(10),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(1),
                        child: DropdownButton(
                          isExpanded: true,
                          disabledHint: Text(_current_analisis_laboratorio[_current_analisis_laboratorio.indexOf(value)]),
                          items: _items_analisis_laboratorio[_current_analisis_laboratorio.indexOf(value)] == _items_analisis_laboratorio.last ?
                          _items_analisis_laboratorio[_current_analisis_laboratorio.indexOf(value)]:
                          null,
                          value: _current_analisis_laboratorio[
                              _current_analisis_laboratorio.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              _current_analisis_laboratorio[
                                  _current_analisis_laboratorio
                                      .indexOf(value)] = value2;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                _current_analisis_laboratorio[
                            _current_analisis_laboratorio.indexOf(value)] ==
                        analisis_laboratorio[1]
                    ? Column(
                      children: <Widget>[
                        Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    decoration: (InputDecoration(
                                      labelText: "Hemoglobina",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    decoration: (InputDecoration(
                                      labelText: "Hematocrito",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {},
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
                                  labelText: "Neutrofilos",
                                  icon: Icon(FontAwesomeIcons.tint),
                                )),
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                decoration: (InputDecoration(
                                  labelText: "Linfocitos",
                                  icon: Icon(FontAwesomeIcons.tint),
                                )),
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
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
                                  labelText: "Eosinofilos",
                                  icon: Icon(FontAwesomeIcons.tint),
                                )),
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                decoration: (InputDecoration(
                                  labelText: "Basofilos",
                                  icon: Icon(FontAwesomeIcons.tint),
                                )),
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
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
                                  labelText: "Monocitos",
                                  icon: Icon(FontAwesomeIcons.tint),
                                )),
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ],
                      )
                      ],
                    )
                    : Container(),

                    _current_analisis_laboratorio[
                            _current_analisis_laboratorio.indexOf(value)] ==
                        analisis_laboratorio[2]
                    ? Column(
                      children: <Widget>[
                        Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    decoration: (InputDecoration(
                                      labelText: "Hemoglobina glucosilada",
                                      labelStyle: TextStyle(fontSize: 12),
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    decoration: (InputDecoration(
                                      labelText: "Glicemia",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {},
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
                                  labelText: "Otros",
                                  icon: Icon(FontAwesomeIcons.tint),
                                )),
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ],
                      )
                      ],
                    )
                    : Container(),

                    _current_analisis_laboratorio[
                            _current_analisis_laboratorio.indexOf(value)] ==
                        analisis_laboratorio[3]
                    ? Column(
                      children: <Widget>[
                        Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    decoration: (InputDecoration(
                                      labelText: "Tiempo sangrado",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    decoration: (InputDecoration(
                                      labelText: "Tiempo coagulacion",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {},
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
                                  labelText: "Cuenta plaquetas",
                                  icon: Icon(FontAwesomeIcons.tint),
                                )),
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                decoration: (InputDecoration(
                                  labelText: "Tiempo protrombina",
                                  labelStyle: TextStyle(fontSize: 13),
                                  icon: Icon(FontAwesomeIcons.tint),
                                )),
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
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
                                  labelText: "Tiempo tromboplastina",
                                  labelStyle: TextStyle(fontSize: 13),
                                  icon: Icon(FontAwesomeIcons.tint),
                                )),
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                decoration: (InputDecoration(
                                  labelText: "INR",
                                  icon: Icon(FontAwesomeIcons.tint),
                                )),
                                keyboardType: TextInputType.text,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ],
                      ),
                      ],
                    )
                    : Container(),
              ],
            );
          }).toList()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _current_analisis_laboratorio.last != analisis_laboratorio.first && analisis_laboratorio.last.length > 2
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_analisis_laboratorio.add(Util()
                        .ajustarlistas(analisis_laboratorio, _current_analisis_laboratorio));
                    _current_analisis_laboratorio
                        .add(_items_analisis_laboratorio.last.first.value);
                  });
                },
              )
                  : Container(),
              _current_analisis_laboratorio.length > 1
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _current_analisis_laboratorio.removeLast();
                    _items_analisis_laboratorio.removeLast();
                  });
                },
              )
                  : Container(),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Modelo de estudio"),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Maxilar superior",
                      icon: Icon(FontAwesomeIcons.teethOpen),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Maxilar inferior",
                      icon: Icon(FontAwesomeIcons.teethOpen),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Datos de la cirugia"),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Diagnostico",
                icon: Icon(FontAwesomeIcons.fileMedical),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Pronostico",
                icon: Icon(FontAwesomeIcons.fileMedical),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Tratamiento",
                  icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Plan de Tratamiento"),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Antisepsia",
                icon: Icon(FontAwesomeIcons.pastafarianism),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Anestesia",
                icon: Icon(FontAwesomeIcons.syringe),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Incision",
                icon: Icon(FontAwesomeIcons.highlighter),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Diseccion mucoperiostica",
                icon: Icon(FontAwesomeIcons.highlighter),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Osteotomia-Ostectomia",
                icon: Icon(FontAwesomeIcons.bone),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Operacion",
                icon: Icon(FontAwesomeIcons.userMd),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Cuidados herida",
                icon: Icon(FontAwesomeIcons.bandAid),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Sutura",
                icon: Icon(FontAwesomeIcons.bandAid),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Indicaciones post-operatorias"),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Primeras 24h",
                icon: Icon(FontAwesomeIcons.clock),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "despues de 24h",
                icon: Icon(FontAwesomeIcons.clock),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Incidentes en el procedimiento",
                icon: Icon(FontAwesomeIcons.userInjured),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Receta"),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Analgesicos", icon: Icon(FontAwesomeIcons.syringe)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Antibioticos",
                icon: Icon(FontAwesomeIcons.pastafarianism),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Ansioliticos",
                icon: Icon(FontAwesomeIcons.userMinus),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Otros",
                icon: Icon(FontAwesomeIcons.pills),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Nombre del cirujano",
                icon: Icon(FontAwesomeIcons.userMd),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Nombre del ayudante",
                icon: Icon(FontAwesomeIcons.userNurse),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Nombre del instrumentista",
                icon: Icon(FontAwesomeIcons.userNurse),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Nombre del asistente circulante",
                icon: Icon(FontAwesomeIcons.userNurse),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Hora inicio",
                      icon: Icon(FontAwesomeIcons.clock),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: (InputDecoration(
                      labelText: "Hora termino",
                      icon: Icon(FontAwesomeIcons.clock),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: (InputDecoration(
                labelText: "Valor del tratamiento quirurgico",
                icon: Icon(FontAwesomeIcons.dollarSign),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(
              DateFormat("y-M-d").format(fecha_retiosutura),
              style: TextStyle(
                  fontSize: 20.0, color: Theme.of(context).accentColor),
            ),
            subtitle: Text("Retiro de sutura"),
            onTap: () {
              Util()
                  .selectDate(context, fecha_retiosutura, DateTime.now())
                  .then((fecha) {
                setState(() {
                  fecha_retiosutura = fecha;
                });
              });
            },
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Estado postquirurgico del paciente",
                  icon: Icon(FontAwesomeIcons.userAlt)),
              keyboardType: TextInputType.text,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(
              DateFormat("y-M-d").format(fecha_alta),
              style: TextStyle(
                  fontSize: 20.0, color: Theme.of(context).accentColor),
            ),
            subtitle: Text("Dado de alta"),
            onTap: () {
              Util()
                  .selectDate(context, fecha_alta, DateTime.now())
                  .then((fecha) {
                setState(() {
                  fecha_alta = fecha;
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
