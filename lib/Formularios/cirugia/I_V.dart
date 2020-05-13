import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Cirugia.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
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
  List<String> adicciones = [
    "Ninguna",
    "Tabaco",
    "Alcohol",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_adicciones = List();

  List<String> alergias = [
    "Ninguna",
    "Antibioticos",
    "Anestesicos",
    "Analgesicos",
    "Alimentos",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_alergias = List();

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

  List<String> genitourinario = [
    "Ninguna",
    "Infeccion",
    "Insuficiencia renal",
    "Dialisis",
    "sindrome nefrotico",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_genitourinario = List();

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

  List<String> musculo_esqueleto = [
    "Ninguna",
    "Artrosis",
    "Artritis",
    "Miopatia",
    "Neuropatia",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_musculo_esqueleto = List();

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

  List<String> tegumentario = [
    "Ninguna",
    "Piel",
    "Pelo",
    "Glandulas cutaneas",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_tegumentario = List();

  List<String> clasificacion_asa = [
    "1",
    "2",
    "3",
    "4",
    "5"
  ];

  List<DropdownMenuItem> _items_clasificacion_asa = List();

  List<String> craneoforma = [
    "Dolicocefalico",
    "Mesocefalico",
    "Braquiocefalico"
  ];

  List<DropdownMenuItem> _items_craneoforma = List();

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

  List<String> radiografia = [
    "Ninguna",
    "Periapical",
    "Oclusal",
    "Ortopantomografia",
    "Otras"
  ];

  List<List<DropdownMenuItem>> _items_radiografia = List();

  List<String> analisis_laboratorio = [
    "Ninguna",
    "Biometria hematica completa",
    "Quimica sanguinea",
    "Pruebas basicas de valoracion de la hemostasia"
  ];
  List<List<DropdownMenuItem>> _items_analisis_laboratorio = List();

  DateTime fecha_retiosutura = DateTime.now();
  DateTime fecha_alta = DateTime.now();

  FocusNode madreNode;

  @override
  void initState() {
    madreNode = FocusNode();
    Provider.of<Cirugia>(context, listen: false).checklist();
    Provider.of<Cirugia>(context, listen: false).Userid = Provider.of<LoginState>(context, listen: false).uid;
    Provider.of<Cirugia>(context, listen: false).clienteid = Provider.of<General>(context, listen: false).pacienteid;
    Provider.of<Cirugia>(context, listen: false).fecha=DateFormat("dd-MM-yyyy").format(DateTime.now());
    print(Provider.of<Cirugia>(context, listen: false).adicciones);
    _items_clasificacion_asa = Util().getDropdownMenuItem(clasificacion_asa);
    if (Provider.of<Cirugia>(context, listen: false).clasificacion_asa == "") Provider.of<Cirugia>(context, listen: false).clasificacion_asa = _items_clasificacion_asa.first.value;
    _items_craneoforma = Util().getDropdownMenuItem(craneoforma);
    if (Provider.of<Cirugia>(context, listen: false).craneo_tipo == "") Provider.of<Cirugia>(context, listen: false).craneo_tipo = _items_craneoforma.first.value;
    _items_adicciones.addAll(Util().setitemlist(adicciones, Provider.of<Cirugia>(context, listen: false).adicciones));
    Provider.of<Cirugia>(context, listen: false).adicciones.add(_items_adicciones.last.first.value);
    _items_alergias.addAll(Util().setitemlist(alergias, Provider.of<Cirugia>(context, listen: false).alergias));
    Provider.of<Cirugia>(context, listen: false).alergias.add(_items_alergias.last.first.value);
    _items_digestivo.addAll(Util().setitemlist(digestivo, Provider.of<Cirugia>(context, listen: false).digestivo));
    Provider.of<Cirugia>(context, listen: false).digestivo.add(_items_digestivo.last.first.value);
    _items_respiratorio.addAll(Util().setitemlist(respiratorio, Provider.of<Cirugia>(context, listen: false).respiratorio));
    Provider.of<Cirugia>(context, listen: false).respiratorio.add(_items_respiratorio.last.first.value);
    _items_cardiovascular.addAll(Util().setitemlist(cardiovascular, Provider.of<Cirugia>(context, listen: false).cardiovascular));
    Provider.of<Cirugia>(context, listen: false).cardiovascular.add(_items_cardiovascular.last.first.value);
    _items_genitourinario.addAll(Util().setitemlist(genitourinario, Provider.of<Cirugia>(context, listen: false).genitourinario));
    Provider.of<Cirugia>(context, listen: false).genitourinario.add(_items_genitourinario.last.first.value);
    _items_endocrino.addAll(Util().setitemlist(endocrino, Provider.of<Cirugia>(context, listen: false).endocrino));
    Provider.of<Cirugia>(context, listen: false).endocrino.add(_items_endocrino.last.first.value);
    _items_hematologicos.addAll(Util().setitemlist(hematologicos, Provider.of<Cirugia>(context, listen: false).hematologico));
    Provider.of<Cirugia>(context, listen: false).hematologico.add(_items_hematologicos.last.first.value);
    _items_neurologico.addAll(Util().setitemlist(neurologico, Provider.of<Cirugia>(context, listen: false).neurologico));
    Provider.of<Cirugia>(context, listen: false).neurologico.add(_items_neurologico.last.first.value);
    _items_musculo_esqueleto.addAll(Util().setitemlist(musculo_esqueleto, Provider.of<Cirugia>(context, listen: false).musculo_esqueleto));
    Provider.of<Cirugia>(context, listen: false).musculo_esqueleto.add(_items_musculo_esqueleto.last.first.value);
    _items_inmunologico.addAll(Util().setitemlist(inmunologico, Provider.of<Cirugia>(context, listen: false).inmunologico));
    Provider.of<Cirugia>(context, listen: false).inmunologico.add(_items_inmunologico.last.first.value);
    _items_tegumentario.addAll(Util().setitemlist(tegumentario, Provider.of<Cirugia>(context, listen: false).tegumentario));
    Provider.of<Cirugia>(context, listen: false).tegumentario.add(_items_tegumentario.last.first.value);
    _items_temporomandibular.addAll(Util().setitemlist(temporomandibular, Provider.of<Cirugia>(context, listen: false).temporomandibular));
    Provider.of<Cirugia>(context, listen: false).temporomandibular.add(_items_temporomandibular.last.first.value);
    _items_radiografia.addAll(Util().setitemlist(radiografia, Provider.of<Cirugia>(context, listen: false).radiografia));
    Provider.of<Cirugia>(context, listen: false).radiografia.add(_items_radiografia.last.first.value);
    _items_analisis_laboratorio.addAll(Util().setitemlist(analisis_laboratorio, Provider.of<Cirugia>(context, listen: false).analisis_laboratorio));
    Provider.of<Cirugia>(context, listen: false).analisis_laboratorio.add(_items_analisis_laboratorio.last.first.value);
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
              initialValue: Provider.of<Cirugia>(context).padecimiento_actual,
              decoration: InputDecoration(labelText: "Padecimiento actual", icon: Icon(FontAwesomeIcons.userInjured)),
              keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 6,
              onChanged: (value) {
                Provider.of<Cirugia>(context).padecimiento_actual = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).antec_pato_madre,
              decoration: InputDecoration(labelText: "Madre", icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_madre = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
              focusNode: madreNode,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).antec_pato_abuelama,
              decoration: InputDecoration(labelText: "Abuela materna", icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_abuelama = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).antec_pato_abueloma,
              decoration: InputDecoration(labelText: "Abuelo materno", icon: Icon(FontAwesomeIcons.male)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_abueloma = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).antec_pato_padre,
              decoration: InputDecoration(labelText: "Padre", icon: Icon(FontAwesomeIcons.male)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_padre = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).antec_pato_abuelopa,
              decoration: InputDecoration(labelText: "Abuelo paterno", icon: Icon(FontAwesomeIcons.male)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_abuelopa = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).antec_pato_abuelapa,
              decoration: InputDecoration(labelText: "abuela paterna", icon: Icon(FontAwesomeIcons.female)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antec_pato_abuelapa = value;
                Provider.of<Cirugia>(context).cambiado = true;
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
                    initialValue: Provider.of<Cirugia>(context).grupo_sanguineo,
                    decoration: InputDecoration(labelText: "Grupo sanguineo", icon: Icon(FontAwesomeIcons.tint)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).grupo_sanguineo = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).factor_rh,
                    decoration: InputDecoration(labelText: "Factor Rh", icon: Icon(FontAwesomeIcons.tint)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).factor_rh = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).inmunizaciones_infancia,
              decoration: InputDecoration(labelText: "Inmunizaciones infancia", icon: Icon(FontAwesomeIcons.baby)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).inmunizaciones_infancia = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).inmunizaciones_adulto,
              decoration: InputDecoration(labelText: "inmunizaciones adulto", icon: Icon(FontAwesomeIcons.male)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).inmunizaciones_adulto = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Adicciones"),
          ),
          Column(
              children: Provider.of<Cirugia>(context).adicciones.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).adicciones[Provider.of<Cirugia>(context).adicciones.indexOf(value)]),
                          items: _items_adicciones[Provider.of<Cirugia>(context).adicciones.indexOf(value)] == _items_adicciones.last ? _items_adicciones[Provider.of<Cirugia>(context).adicciones.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).adicciones[Provider.of<Cirugia>(context).adicciones.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).adicciones[Provider.of<Cirugia>(context).adicciones.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).adicciones[Provider.of<Cirugia>(context).adicciones.indexOf(value)] == adicciones.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_adiccion,
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
                            Provider.of<Cirugia>(context).cambiado = true;
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
              Provider.of<Cirugia>(context).adicciones.last != adicciones.first && adicciones.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_adicciones.add(Util().ajustarlistas(adicciones, Provider.of<Cirugia>(context).adicciones));
                          Provider.of<Cirugia>(context).adicciones.add(_items_adicciones.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).adicciones.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).adicciones.removeLast();
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
              initialValue: Provider.of<Cirugia>(context).regimen_alimenticio,
              decoration: InputDecoration(labelText: "Regimen alimenticio", icon: Icon(FontAwesomeIcons.hamburger)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).regimen_alimenticio = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).condiciones_habitacionales,
              decoration: InputDecoration(labelText: "Condiciones habitacionales", icon: Icon(FontAwesomeIcons.houzz)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).condiciones_habitacionales = value;
                Provider.of<Cirugia>(context).cambiado = true;
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
              initialValue: Provider.of<Cirugia>(context).enfermedades_infancia,
              decoration: InputDecoration(labelText: "Enfermedades propias de la infancias", icon: Icon(FontAwesomeIcons.baby)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).enfermedades_infancia = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).antecedentes_traumaticos,
              decoration: InputDecoration(labelText: "Antecedentes traumaticos", icon: Icon(FontAwesomeIcons.userInjured)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antecedentes_traumaticos = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).antecedentes_quirurgicos,
              decoration: InputDecoration(labelText: "Antecedentes quirurgicos", icon: Icon(FontAwesomeIcons.userMd)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antecedentes_quirurgicos = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Alergias"),
          ),
          Column(
              children: Provider.of<Cirugia>(context).alergias.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).alergias[Provider.of<Cirugia>(context).alergias.indexOf(value)]),
                          items: _items_alergias[Provider.of<Cirugia>(context).alergias.indexOf(value)] == _items_alergias.last ? _items_alergias[Provider.of<Cirugia>(context).alergias.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).alergias[Provider.of<Cirugia>(context).alergias.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).alergias[Provider.of<Cirugia>(context).alergias.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).alergias[Provider.of<Cirugia>(context).alergias.indexOf(value)] == alergias.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_alergia,
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
                            Provider.of<Cirugia>(context).cambiado = true;
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
              Provider.of<Cirugia>(context).alergias.last != alergias.first && alergias.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_alergias.add(Util().ajustarlistas(alergias, Provider.of<Cirugia>(context).alergias));
                          Provider.of<Cirugia>(context).alergias.add(_items_alergias.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).alergias.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).alergias.removeLast();
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
              initialValue: Provider.of<Cirugia>(context).transfuciones,
              decoration: InputDecoration(labelText: "transfusiones", icon: Icon(FontAwesomeIcons.vials)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).transfuciones = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).radio_quimioterapia,
              decoration: InputDecoration(labelText: "¿Ha recibido radioterapia y/o quimioterapia", icon: Icon(FontAwesomeIcons.radiationAlt)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).radio_quimioterapia = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).experiencia_anestesia,
              decoration: InputDecoration(labelText: "Experiencia previa con anestesia", icon: Icon(FontAwesomeIcons.syringe)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).experiencia_anestesia = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
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
              children: Provider.of<Cirugia>(context).digestivo.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).digestivo[Provider.of<Cirugia>(context).digestivo.indexOf(value)]),
                          items: _items_digestivo[Provider.of<Cirugia>(context).digestivo.indexOf(value)] == _items_digestivo.last ? _items_digestivo[Provider.of<Cirugia>(context).digestivo.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).digestivo[Provider.of<Cirugia>(context).digestivo.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).digestivo[Provider.of<Cirugia>(context).digestivo.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).digestivo[Provider.of<Cirugia>(context).digestivo.indexOf(value)] == digestivo.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_digestivo,
                          decoration: InputDecoration(
                              labelText: "otra",
                              icon: Icon(
                                FontAwesomeIcons.cookieBite,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            Provider.of<Cirugia>(context).otra_digestivo = value;
                            Provider.of<Cirugia>(context).cambiado = true;
                          },
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Provider.of<Cirugia>(context).digestivo.first != digestivo.first
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tratamiento_digestivo,
                    decoration: InputDecoration(labelText: "Tratamiento", icon: Icon(FontAwesomeIcons.pills)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tratamiento_digestivo = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).digestivo.last != digestivo.first && digestivo.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_digestivo.add(Util().ajustarlistas(digestivo, Provider.of<Cirugia>(context).digestivo));
                          Provider.of<Cirugia>(context).digestivo.add(_items_digestivo.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).digestivo.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).digestivo.removeLast();
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
              children: Provider.of<Cirugia>(context).respiratorio.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).respiratorio[Provider.of<Cirugia>(context).respiratorio.indexOf(value)]),
                          items: _items_respiratorio[Provider.of<Cirugia>(context).respiratorio.indexOf(value)] == _items_respiratorio.last ? _items_respiratorio[Provider.of<Cirugia>(context).respiratorio.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).respiratorio[Provider.of<Cirugia>(context).respiratorio.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).respiratorio[Provider.of<Cirugia>(context).respiratorio.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).respiratorio[Provider.of<Cirugia>(context).respiratorio.indexOf(value)] == respiratorio.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_respiratorio,
                          decoration: InputDecoration(
                              labelText: "otra",
                              icon: Icon(
                                FontAwesomeIcons.running,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            Provider.of<Cirugia>(context).otra_respiratorio = value;
                            Provider.of<Cirugia>(context).cambiado = true;
                          },
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Provider.of<Cirugia>(context).respiratorio.first != respiratorio.first
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tratamiento_respiratorio,
                    decoration: InputDecoration(labelText: "Tratamiento", icon: Icon(FontAwesomeIcons.pills)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tratamiento_respiratorio = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).respiratorio.last != respiratorio.first && respiratorio.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_respiratorio.add(Util().ajustarlistas(respiratorio, Provider.of<Cirugia>(context).respiratorio));
                          Provider.of<Cirugia>(context).respiratorio.add(_items_respiratorio.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).respiratorio.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).respiratorio.removeLast();
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
              children: Provider.of<Cirugia>(context).cardiovascular.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).cardiovascular[Provider.of<Cirugia>(context).cardiovascular.indexOf(value)]),
                          items: _items_cardiovascular[Provider.of<Cirugia>(context).cardiovascular.indexOf(value)] == _items_cardiovascular.last ? _items_cardiovascular[Provider.of<Cirugia>(context).cardiovascular.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).cardiovascular[Provider.of<Cirugia>(context).cardiovascular.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).cardiovascular[Provider.of<Cirugia>(context).cardiovascular.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).cardiovascular[Provider.of<Cirugia>(context).cardiovascular.indexOf(value)] == cardiovascular.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_cardiovascular,
                          decoration: InputDecoration(
                              labelText: "otra",
                              icon: Icon(
                                FontAwesomeIcons.heart,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            Provider.of<Cirugia>(context).otra_cardiovascular = value;
                            Provider.of<Cirugia>(context).cambiado = true;
                          },
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Provider.of<Cirugia>(context).cardiovascular.first != cardiovascular.first
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tratamiento_cardiovascular,
                    decoration: InputDecoration(labelText: "Tratamiento", icon: Icon(FontAwesomeIcons.pills)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tratamiento_cardiovascular = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).cardiovascular.last != cardiovascular.first && cardiovascular.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_cardiovascular.add(Util().ajustarlistas(cardiovascular, Provider.of<Cirugia>(context).cardiovascular));
                          Provider.of<Cirugia>(context).cardiovascular.add(_items_cardiovascular.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).cardiovascular.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).cardiovascular.removeLast();
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
              children: Provider.of<Cirugia>(context).genitourinario.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).genitourinario[Provider.of<Cirugia>(context).genitourinario.indexOf(value)]),
                          items: _items_genitourinario[Provider.of<Cirugia>(context).genitourinario.indexOf(value)] == _items_genitourinario.last ? _items_genitourinario[Provider.of<Cirugia>(context).genitourinario.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).genitourinario[Provider.of<Cirugia>(context).genitourinario.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).genitourinario[Provider.of<Cirugia>(context).genitourinario.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).genitourinario[Provider.of<Cirugia>(context).genitourinario.indexOf(value)] == genitourinario.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_genitourinario,
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.venusMars,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            Provider.of<Cirugia>(context).otra_genitourinario = value;
                            Provider.of<Cirugia>(context).cambiado = true;
                          },
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Provider.of<Cirugia>(context).genitourinario.first != genitourinario.first
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tratamiento_genitourinario,
                    decoration: InputDecoration(labelText: "Tratamiento", icon: Icon(FontAwesomeIcons.pills)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tratamiento_genitourinario = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).genitourinario.last != genitourinario.first && genitourinario.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_genitourinario.add(Util().ajustarlistas(genitourinario, Provider.of<Cirugia>(context).genitourinario));
                          Provider.of<Cirugia>(context).genitourinario.add(_items_genitourinario.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).genitourinario.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).genitourinario.removeLast();
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
              children: Provider.of<Cirugia>(context).endocrino.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).endocrino[Provider.of<Cirugia>(context).endocrino.indexOf(value)]),
                          items: _items_endocrino[Provider.of<Cirugia>(context).endocrino.indexOf(value)] == _items_endocrino.last ? _items_endocrino[Provider.of<Cirugia>(context).endocrino.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).endocrino[Provider.of<Cirugia>(context).endocrino.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).endocrino[Provider.of<Cirugia>(context).endocrino.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).endocrino[Provider.of<Cirugia>(context).endocrino.indexOf(value)] == endocrino.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_endocrino,
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.drawPolygon,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            Provider.of<Cirugia>(context).otra_endocrino = value;
                            Provider.of<Cirugia>(context).cambiado = true;
                          },
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Provider.of<Cirugia>(context).endocrino.first != endocrino.first
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tratamiento_endocrino,
                    decoration: InputDecoration(labelText: "Tratamiento", icon: Icon(FontAwesomeIcons.pills)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tratamiento_endocrino = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).endocrino.last != endocrino.first && endocrino.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_endocrino.add(Util().ajustarlistas(endocrino, Provider.of<Cirugia>(context).endocrino));
                          Provider.of<Cirugia>(context).endocrino.add(_items_endocrino.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).endocrino.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).endocrino.removeLast();
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
              children: Provider.of<Cirugia>(context).hematologico.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).hematologico[Provider.of<Cirugia>(context).hematologico.indexOf(value)]),
                          items: _items_hematologicos[Provider.of<Cirugia>(context).hematologico.indexOf(value)] == _items_hematologicos.last ? _items_hematologicos[Provider.of<Cirugia>(context).hematologico.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).hematologico[Provider.of<Cirugia>(context).hematologico.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).hematologico[Provider.of<Cirugia>(context).hematologico.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).hematologico[Provider.of<Cirugia>(context).hematologico.indexOf(value)] == hematologicos.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_hematologico,
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.tint,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            Provider.of<Cirugia>(context).otra_hematologico = value;
                            Provider.of<Cirugia>(context).cambiado = true;
                          },
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Provider.of<Cirugia>(context).hematologico.first != hematologicos.first
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tratamiento_hematologico,
                    decoration: InputDecoration(labelText: "Tratamiento", icon: Icon(FontAwesomeIcons.pills)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tratamiento_hematologico = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).hematologico.last != hematologicos.first && hematologicos.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_hematologicos.add(Util().ajustarlistas(hematologicos, Provider.of<Cirugia>(context).hematologico));
                          Provider.of<Cirugia>(context).hematologico.add(_items_hematologicos.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).hematologico.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).hematologico.removeLast();
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
              children: Provider.of<Cirugia>(context).neurologico.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).neurologico[Provider.of<Cirugia>(context).neurologico.indexOf(value)]),
                          items: _items_neurologico[Provider.of<Cirugia>(context).neurologico.indexOf(value)] == _items_neurologico.last ? _items_neurologico[Provider.of<Cirugia>(context).neurologico.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).neurologico[Provider.of<Cirugia>(context).neurologico.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).neurologico[Provider.of<Cirugia>(context).neurologico.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).neurologico[Provider.of<Cirugia>(context).neurologico.indexOf(value)] == neurologico.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_neurologico,
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.brain,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            Provider.of<Cirugia>(context).otra_neurologico = value;
                            Provider.of<Cirugia>(context).cambiado = true;
                          },
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Provider.of<Cirugia>(context).neurologico.first != neurologico.first
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tratamiento_neurologico,
                    decoration: InputDecoration(labelText: "Tratamiento", icon: Icon(FontAwesomeIcons.pills)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tratamiento_neurologico = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).neurologico.last != neurologico.first && neurologico.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_neurologico.add(Util().ajustarlistas(neurologico, Provider.of<Cirugia>(context).neurologico));
                          Provider.of<Cirugia>(context).neurologico.add(_items_neurologico.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).neurologico.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).neurologico.removeLast();
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
              children: Provider.of<Cirugia>(context).musculo_esqueleto.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).musculo_esqueleto[Provider.of<Cirugia>(context).musculo_esqueleto.indexOf(value)]),
                          items: _items_musculo_esqueleto[Provider.of<Cirugia>(context).musculo_esqueleto.indexOf(value)] == _items_musculo_esqueleto.last ? _items_musculo_esqueleto[Provider.of<Cirugia>(context).musculo_esqueleto.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).musculo_esqueleto[Provider.of<Cirugia>(context).musculo_esqueleto.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).musculo_esqueleto[Provider.of<Cirugia>(context).musculo_esqueleto.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).musculo_esqueleto[Provider.of<Cirugia>(context).musculo_esqueleto.indexOf(value)] == musculo_esqueleto.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_musculo_esqueleto,
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.bone,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            Provider.of<Cirugia>(context).otra_musculo_esqueleto = value;
                            Provider.of<Cirugia>(context).cambiado = true;
                          },
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Provider.of<Cirugia>(context).musculo_esqueleto.first != musculo_esqueleto.first
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tratamiento_musculo_esqueleto,
                    decoration: InputDecoration(labelText: "Tratamiento", icon: Icon(FontAwesomeIcons.pills)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tratamiento_musculo_esqueleto = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).musculo_esqueleto.last != musculo_esqueleto.first && musculo_esqueleto.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_musculo_esqueleto.add(Util().ajustarlistas(musculo_esqueleto, Provider.of<Cirugia>(context).musculo_esqueleto));
                          Provider.of<Cirugia>(context).musculo_esqueleto.add(_items_musculo_esqueleto.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).musculo_esqueleto.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).musculo_esqueleto.removeLast();
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
              children: Provider.of<Cirugia>(context).inmunologico.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).inmunologico[Provider.of<Cirugia>(context).inmunologico.indexOf(value)]),
                          items: _items_inmunologico[Provider.of<Cirugia>(context).inmunologico.indexOf(value)] == _items_inmunologico.last ? _items_inmunologico[Provider.of<Cirugia>(context).inmunologico.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).inmunologico[Provider.of<Cirugia>(context).inmunologico.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).inmunologico[Provider.of<Cirugia>(context).inmunologico.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).inmunologico[Provider.of<Cirugia>(context).inmunologico.indexOf(value)] == inmunologico.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_inmunologico,
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.pastafarianism,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            Provider.of<Cirugia>(context).otra_inmunologico = value;
                            Provider.of<Cirugia>(context).cambiado = true;
                          },
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Provider.of<Cirugia>(context).inmunologico.first != inmunologico.first
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tratamiento_inmunologico,
                    decoration: InputDecoration(labelText: "Tratamiento", icon: Icon(FontAwesomeIcons.pills)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tratamiento_inmunologico = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).inmunologico.last != inmunologico.first && inmunologico.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_inmunologico.add(Util().ajustarlistas(inmunologico, Provider.of<Cirugia>(context).inmunologico));
                          Provider.of<Cirugia>(context).inmunologico.add(_items_inmunologico.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).inmunologico.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).inmunologico.removeLast();
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
              children: Provider.of<Cirugia>(context).tegumentario.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).tegumentario[Provider.of<Cirugia>(context).tegumentario.indexOf(value)]),
                          items: _items_tegumentario[Provider.of<Cirugia>(context).tegumentario.indexOf(value)] == _items_tegumentario.last ? _items_tegumentario[Provider.of<Cirugia>(context).tegumentario.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).tegumentario[Provider.of<Cirugia>(context).tegumentario.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).tegumentario[Provider.of<Cirugia>(context).tegumentario.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).tegumentario[Provider.of<Cirugia>(context).tegumentario.indexOf(value)] == tegumentario.last
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: Provider.of<Cirugia>(context).otra_tegumentario,
                          decoration: InputDecoration(
                              labelText: "otra ",
                              icon: Icon(
                                FontAwesomeIcons.allergies,
                                color: Colors.blue,
                              ),
                              labelStyle: TextStyle(color: Colors.blue)),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            Provider.of<Cirugia>(context).otra_tegumentario = value;
                            Provider.of<Cirugia>(context).cambiado = true;
                          },
                        ),
                      )
                    : Container(),
              ],
            );
          }).toList()),
          Provider.of<Cirugia>(context).tegumentario.first != tegumentario.first
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tratamiento_tegumentario,
                    decoration: InputDecoration(labelText: "Tratamiento", icon: Icon(FontAwesomeIcons.pills)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tratamiento_tegumentario = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).tegumentario.last != tegumentario.first && tegumentario.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_tegumentario.add(Util().ajustarlistas(tegumentario, Provider.of<Cirugia>(context).tegumentario));
                          Provider.of<Cirugia>(context).tegumentario.add(_items_tegumentario.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).tegumentario.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).tegumentario.removeLast();
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
                    value: Provider.of<Cirugia>(context).clasificacion_asa,
                    onChanged: (value) {
                      setState(() {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Provider.of<Cirugia>(context).clasificacion_asa = value;
                        Provider.of<Cirugia>(context).cambiado = true;
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
                    initialValue: Provider.of<Cirugia>(context).frecuencia_cardiaca,
                    decoration: (InputDecoration(
                      labelText: "Frec cardiaca",
                      icon: Icon(FontAwesomeIcons.heartbeat),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).frecuencia_cardiaca = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tension_arterial,
                    decoration: (InputDecoration(
                      labelText: "Tension arterial",
                      icon: Icon(FontAwesomeIcons.heartbeat),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tension_arterial = value;
                      Provider.of<Cirugia>(context).cambiado = true;
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
                    initialValue: Provider.of<Cirugia>(context).frecuencia_respiratoria,
                    decoration: (InputDecoration(
                      labelText: "Frec respiratoria",
                      labelStyle: TextStyle(fontSize: 14),
                      icon: Icon(FontAwesomeIcons.biking),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).frecuencia_respiratoria = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).temperatura,
                    decoration: (InputDecoration(
                      labelText: "Temperatura",
                      icon: Icon(FontAwesomeIcons.thermometerHalf),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).temperatura = value;
                      Provider.of<Cirugia>(context).cambiado = true;
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
                    initialValue: Provider.of<Cirugia>(context).peso,
                    decoration: (InputDecoration(
                      labelText: "Peso (kg)",
                      icon: Icon(FontAwesomeIcons.weight),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).peso = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).talla,
                    decoration: (InputDecoration(
                      labelText: "Talla",
                      icon: Icon(FontAwesomeIcons.tshirt),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).talla = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).constitucion_fisica,
              decoration: InputDecoration(labelText: "Constitucion fisica", icon: Icon(FontAwesomeIcons.running)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).constitucion_fisica = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
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
                    value: Provider.of<Cirugia>(context).craneo_tipo,
                    onChanged: (value) {
                      setState(() {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Provider.of<Cirugia>(context).craneo_tipo = value;
                        Provider.of<Cirugia>(context).cambiado = true;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Exostosis")),
              Checkbox(
                value: Provider.of<Cirugia>(context).exostosis,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).exostosis = value;
                    Provider.of<Cirugia>(context).cambiado = true;
                  });
                },
              ),
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Endostosis")),
              Checkbox(
                value: Provider.of<Cirugia>(context).exostosis,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).endostosis = value;
                    Provider.of<Cirugia>(context).cambiado = true;
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
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Transversal")),
              Checkbox(
                value: Provider.of<Cirugia>(context).asimetrias_transversales,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).asimetrias_transversales = value;
                    Provider.of<Cirugia>(context).cambiado = true;
                  });
                },
              ),
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Longitudinal")),
              Checkbox(
                value: Provider.of<Cirugia>(context).asimetrias_longitudinales,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).asimetrias_longitudinales = value;
                    Provider.of<Cirugia>(context).cambiado = true;
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
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Enoftalmo")),
              Checkbox(
                value: Provider.of<Cirugia>(context).enoftalmo,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).enoftalmo = value;
                    Provider.of<Cirugia>(context).cambiado = true;
                  });
                },
              ),
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Exoftalmo")),
              Checkbox(
                value: Provider.of<Cirugia>(context).exoftalmo,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).exoftalmo = value;
                    Provider.of<Cirugia>(context).cambiado = true;
                  });
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).movilidad,
              decoration: (InputDecoration(
                labelText: "Movilidad",
                icon: Icon(FontAwesomeIcons.eye),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).movilidad = value;
                Provider.of<Cirugia>(context).cambiado = true;
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
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Midriasis")),
              Checkbox(
                value: Provider.of<Cirugia>(context).midriasis,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).midriasis = value;
                    Provider.of<Cirugia>(context).cambiado = true;
                  });
                },
              ),
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Miosis")),
              Checkbox(
                value: Provider.of<Cirugia>(context).miosis,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).miosis = value;
                    Provider.of<Cirugia>(context).cambiado = true;
                  });
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).reflejo_pupilar,
              decoration: (InputDecoration(
                labelText: "Reflejo pupilar",
                icon: Icon(FontAwesomeIcons.eye),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).reflejo_pupilar = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).nariz,
              decoration: InputDecoration(labelText: "Nariz", icon: Icon(FontAwesomeIcons.userAlt)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).nariz = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
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
              initialValue: Provider.of<Cirugia>(context).color_piel,
              decoration: (InputDecoration(
                labelText: "Color",
                icon: Icon(FontAwesomeIcons.diagnoses),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).color_piel = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Row(
            children: <Widget>[
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Palida")),
              Checkbox(
                value: Provider.of<Cirugia>(context).palida,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).palida = value;
                    Provider.of<Cirugia>(context).cambiado = true;
                  });
                },
              ),
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Cianotica")),
              Checkbox(
                value: Provider.of<Cirugia>(context).cianotica,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).cianotica = value;
                    Provider.of<Cirugia>(context).cambiado = true;
                  });
                },
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Enrojecida")),
              Checkbox(
                value: Provider.of<Cirugia>(context).enrojecida,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).enrojecida = value;
                    Provider.of<Cirugia>(context).cambiado = true;
                  });
                },
              ),
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Manchas")),
              Checkbox(
                value: Provider.of<Cirugia>(context).manchas,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).manchas = value;
                    Provider.of<Cirugia>(context).cambiado = true;
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
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Hipotonico")),
              Checkbox(
                value: Provider.of<Cirugia>(context).hipotonico,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).hipotonico = value;
                    Provider.of<Cirugia>(context).cambiado = true;
                  });
                },
              ),
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Expanded(child: Text("Hipertonido")),
              Checkbox(
                value: Provider.of<Cirugia>(context).hipertonico,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).hipertonico = value;
                    Provider.of<Cirugia>(context).cambiado = true;
                  });
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(margin: EdgeInsets.only(right: 10, left: 10), child: Icon(FontAwesomeIcons.briefcaseMedical)),
              Text("Espastico"),
              Checkbox(
                value: Provider.of<Cirugia>(context).espasticos,
                onChanged: (value) {
                  setState(() {
                    Provider.of<Cirugia>(context).espasticos = value;
                    Provider.of<Cirugia>(context).cambiado = true;
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
              initialValue: Provider.of<Cirugia>(context).ganglios_linfaticos,
              decoration: InputDecoration(labelText: "Ganglios linfaticos", icon: Icon(FontAwesomeIcons.userAlt)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).ganglios_linfaticos = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Articulacion temporomandibular"),
          ),
          Column(
              children: Provider.of<Cirugia>(context).temporomandibular.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).temporomandibular[Provider.of<Cirugia>(context).temporomandibular.indexOf(value)]),
                          items: _items_temporomandibular[Provider.of<Cirugia>(context).temporomandibular.indexOf(value)] == _items_temporomandibular.last ? _items_temporomandibular[Provider.of<Cirugia>(context).temporomandibular.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).temporomandibular[Provider.of<Cirugia>(context).temporomandibular.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).temporomandibular[Provider.of<Cirugia>(context).temporomandibular.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
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
          Provider.of<Cirugia>(context).temporomandibular.first != temporomandibular.first
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).tratamiento_temporomandibular,
                    decoration: InputDecoration(
                        labelText: "Describa",
                        icon: Icon(
                          FontAwesomeIcons.female,
                          color: Colors.blue,
                        ),
                        labelStyle: TextStyle(color: Colors.blue)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).tratamiento_temporomandibular = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).temporomandibular.last != temporomandibular.first && temporomandibular.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_temporomandibular.add(Util().ajustarlistas(temporomandibular, Provider.of<Cirugia>(context).temporomandibular));
                          Provider.of<Cirugia>(context).temporomandibular.add(_items_temporomandibular.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).temporomandibular.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).temporomandibular.removeLast();
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
              initialValue: Provider.of<Cirugia>(context).labios,
              decoration: InputDecoration(labelText: "Labios", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).labios = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).carrillos,
              decoration: InputDecoration(labelText: "Carrillos", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).carrillos = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).paladar_duro,
              decoration: InputDecoration(labelText: "Paladar duro", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).paladar_duro = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).paladar_blando,
              decoration: InputDecoration(labelText: "Paladar blando", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).paladar_blando = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).orafaringe,
              decoration: InputDecoration(labelText: "Orafaringe", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).orafaringe = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).piso_boca,
              decoration: InputDecoration(labelText: "Piso de la boca", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).piso_boca = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).lengua,
              decoration: InputDecoration(labelText: "Lengua", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).lengua = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).encia,
              decoration: InputDecoration(labelText: "Encia", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).encia = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).dientes,
              decoration: InputDecoration(labelText: "Dientes", icon: Icon(FontAwesomeIcons.teethOpen)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).dientes = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
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
              children: Provider.of<Cirugia>(context).radiografia.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).radiografia[Provider.of<Cirugia>(context).radiografia.indexOf(value)]),
                          items: _items_radiografia[Provider.of<Cirugia>(context).radiografia.indexOf(value)] == _items_radiografia.last ? _items_radiografia[Provider.of<Cirugia>(context).radiografia.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).radiografia[Provider.of<Cirugia>(context).radiografia.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).radiografia[Provider.of<Cirugia>(context).radiografia.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
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
          Provider.of<Cirugia>(context).radiografia.first == radiografia.last
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).otra_radiografia,
                    decoration: InputDecoration(
                        labelText: "Describa",
                        icon: Icon(
                          FontAwesomeIcons.vectorSquare,
                          color: Colors.blue,
                        ),
                        labelStyle: TextStyle(color: Colors.blue)),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).otra_radiografia = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Provider.of<Cirugia>(context).radiografia.last != radiografia.first && radiografia.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_radiografia.add(Util().ajustarlistas(radiografia, Provider.of<Cirugia>(context).radiografia));
                          Provider.of<Cirugia>(context).radiografia.add(_items_radiografia.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).radiografia.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).radiografia.removeLast();
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
              initialValue: Provider.of<Cirugia>(context).interpretacion_radiografica,
              decoration: InputDecoration(labelText: "Interpretacion radiografica", icon: Icon(FontAwesomeIcons.vectorSquare)),
              keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 6,
              onChanged: (value) {
                Provider.of<Cirugia>(context).interpretacion_radiografica = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Analisis de laboratorio clinico"),
          ),
          Column(
              children: Provider.of<Cirugia>(context).analisis_laboratorio.map((value) {
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
                          disabledHint: Text(Provider.of<Cirugia>(context).analisis_laboratorio[Provider.of<Cirugia>(context).analisis_laboratorio.indexOf(value)]),
                          items: _items_analisis_laboratorio[Provider.of<Cirugia>(context).analisis_laboratorio.indexOf(value)] == _items_analisis_laboratorio.last ? _items_analisis_laboratorio[Provider.of<Cirugia>(context).analisis_laboratorio.indexOf(value)] : null,
                          value: Provider.of<Cirugia>(context).analisis_laboratorio[Provider.of<Cirugia>(context).analisis_laboratorio.indexOf(value)],
                          onChanged: (value2) {
                            setState(() {
                              FocusScope.of(context).requestFocus(FocusNode());
                              Provider.of<Cirugia>(context).analisis_laboratorio[Provider.of<Cirugia>(context).analisis_laboratorio.indexOf(value)] = value2;
                              Provider.of<Cirugia>(context).cambiado = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Provider.of<Cirugia>(context).analisis_laboratorio[Provider.of<Cirugia>(context).analisis_laboratorio.indexOf(value)] == analisis_laboratorio[1]
                    ? Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    initialValue: Provider.of<Cirugia>(context).hemoglobina,
                                    decoration: (InputDecoration(
                                      labelText: "Hemoglobina",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).hemoglobina = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    initialValue: Provider.of<Cirugia>(context).hematocrito,
                                    decoration: (InputDecoration(
                                      labelText: "Hematocrito",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).hematocrito = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
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
                                    initialValue: Provider.of<Cirugia>(context).neutrofilos,
                                    decoration: (InputDecoration(
                                      labelText: "Neutrofilos",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).neutrofilos = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    initialValue: Provider.of<Cirugia>(context).linfocitos,
                                    decoration: (InputDecoration(
                                      labelText: "Linfocitos",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).linfocitos = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
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
                                    initialValue: Provider.of<Cirugia>(context).eosinofilos,
                                    decoration: (InputDecoration(
                                      labelText: "Eosinofilos",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).eosinofilos = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    initialValue: Provider.of<Cirugia>(context).basofilos,
                                    decoration: (InputDecoration(
                                      labelText: "Basofilos",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).basofilos = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
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
                                    initialValue: Provider.of<Cirugia>(context).monocitos,
                                    decoration: (InputDecoration(
                                      labelText: "Monocitos",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).monocitos = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : Container(),
                Provider.of<Cirugia>(context).analisis_laboratorio[Provider.of<Cirugia>(context).analisis_laboratorio.indexOf(value)] == analisis_laboratorio[2]
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
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).hemoglobina_glucolisada = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    initialValue: Provider.of<Cirugia>(context).glicemia,
                                    decoration: (InputDecoration(
                                      labelText: "Glicemia",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).glicemia = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
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
                                    initialValue: Provider.of<Cirugia>(context).otros_sangre,
                                    decoration: (InputDecoration(
                                      labelText: "Otros",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).otros_sangre = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : Container(),
                Provider.of<Cirugia>(context).analisis_laboratorio[Provider.of<Cirugia>(context).analisis_laboratorio.indexOf(value)] == analisis_laboratorio[3]
                    ? Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    initialValue: Provider.of<Cirugia>(context).tiempo_sangrado,
                                    decoration: (InputDecoration(
                                      labelText: "Tiempo sangrado",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).tiempo_sangrado = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    initialValue: Provider.of<Cirugia>(context).tiempo_coagulacion,
                                    decoration: (InputDecoration(
                                      labelText: "Tiempo coagulacion",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).tiempo_coagulacion = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
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
                                    initialValue: Provider.of<Cirugia>(context).cuenta_plaquetas,
                                    decoration: (InputDecoration(
                                      labelText: "Cuenta plaquetas",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).cuenta_plaquetas = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    initialValue: Provider.of<Cirugia>(context).tiempo_protombina,
                                    decoration: (InputDecoration(
                                      labelText: "Tiempo protrombina",
                                      labelStyle: TextStyle(fontSize: 13),
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).tiempo_protombina = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
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
                                    initialValue: Provider.of<Cirugia>(context).tiempo_tromboplastina,
                                    decoration: (InputDecoration(
                                      labelText: "Tiempo tromboplastina",
                                      labelStyle: TextStyle(fontSize: 13),
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).tiempo_tromboplastina = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    initialValue: Provider.of<Cirugia>(context).inr,
                                    decoration: (InputDecoration(
                                      labelText: "INR",
                                      icon: Icon(FontAwesomeIcons.tint),
                                    )),
                                    keyboardType: TextInputType.text,
                                    onChanged: (value) {
                                      Provider.of<Cirugia>(context).inr = value;
                                      Provider.of<Cirugia>(context).cambiado = true;
                                    },
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
              Provider.of<Cirugia>(context).analisis_laboratorio.last != analisis_laboratorio.first && analisis_laboratorio.last.length > 2
                  ? FlatButton(
                      child: Text(
                        "Añadir",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          _items_analisis_laboratorio.add(Util().ajustarlistas(analisis_laboratorio, Provider.of<Cirugia>(context).analisis_laboratorio));
                          Provider.of<Cirugia>(context).analisis_laboratorio.add(_items_analisis_laboratorio.last.first.value);
                        });
                      },
                    )
                  : Container(),
              Provider.of<Cirugia>(context).analisis_laboratorio.length > 1
                  ? FlatButton(
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        setState(() {
                          Provider.of<Cirugia>(context).analisis_laboratorio.removeLast();
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
                    initialValue: Provider.of<Cirugia>(context).maxilar_superior,
                    decoration: (InputDecoration(
                      labelText: "Maxilar superior",
                      icon: Icon(FontAwesomeIcons.teethOpen),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).maxilar_superior = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).maxilar_inferior,
                    decoration: (InputDecoration(
                      labelText: "Maxilar inferior",
                      icon: Icon(FontAwesomeIcons.teethOpen),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).maxilar_inferior = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
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
              initialValue: Provider.of<Cirugia>(context).diagnostico,
              decoration: (InputDecoration(
                labelText: "Diagnostico",
                icon: Icon(FontAwesomeIcons.fileMedical),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).diagnostico = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).pronostico,
              decoration: (InputDecoration(
                labelText: "Pronostico",
                icon: Icon(FontAwesomeIcons.fileMedical),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).pronostico = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).tratamiento,
              decoration: InputDecoration(labelText: "Tratamiento", icon: Icon(FontAwesomeIcons.pills)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).tratamiento = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
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
              initialValue: Provider.of<Cirugia>(context).antisepsia,
              decoration: (InputDecoration(
                labelText: "Antisepsia",
                icon: Icon(FontAwesomeIcons.pastafarianism),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antisepsia = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).anestesia,
              decoration: (InputDecoration(
                labelText: "Anestesia",
                icon: Icon(FontAwesomeIcons.syringe),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).anestesia = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).incision,
              decoration: (InputDecoration(
                labelText: "Incision",
                icon: Icon(FontAwesomeIcons.highlighter),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).incision = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).diseccion_mucoperiostica,
              decoration: (InputDecoration(
                labelText: "Diseccion mucoperiostica",
                icon: Icon(FontAwesomeIcons.highlighter),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).diseccion_mucoperiostica = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).osteotomia_ostectomia,
              decoration: (InputDecoration(
                labelText: "Osteotomia-Ostectomia",
                icon: Icon(FontAwesomeIcons.bone),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).osteotomia_ostectomia = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).operacion,
              decoration: (InputDecoration(
                labelText: "Operacion",
                icon: Icon(FontAwesomeIcons.userMd),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).operacion = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).cuidados_herida,
              decoration: (InputDecoration(
                labelText: "Cuidados herida",
                icon: Icon(FontAwesomeIcons.bandAid),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).cuidados_herida = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).sutura,
              decoration: (InputDecoration(
                labelText: "Sutura",
                icon: Icon(FontAwesomeIcons.bandAid),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).sutura = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
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
              initialValue: Provider.of<Cirugia>(context).primeras_24h,
              decoration: (InputDecoration(
                labelText: "Primeras 24h",
                icon: Icon(FontAwesomeIcons.clock),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).primeras_24h = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).despues_24h,
              decoration: (InputDecoration(
                labelText: "despues de 24h",
                icon: Icon(FontAwesomeIcons.clock),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).despues_24h = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).incidentes,
              decoration: (InputDecoration(
                labelText: "Incidentes en el procedimiento",
                icon: Icon(FontAwesomeIcons.userInjured),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).incidentes = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
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
              initialValue: Provider.of<Cirugia>(context).analgesicos,
              decoration: InputDecoration(labelText: "Analgesicos", icon: Icon(FontAwesomeIcons.syringe)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).analgesicos = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).antibioticos,
              decoration: (InputDecoration(
                labelText: "Antibioticos",
                icon: Icon(FontAwesomeIcons.pastafarianism),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).antibioticos = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).ansioliticos,
              decoration: (InputDecoration(
                labelText: "Ansioliticos",
                icon: Icon(FontAwesomeIcons.userMinus),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).ansioliticos = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).otros_medicamentos,
              decoration: (InputDecoration(
                labelText: "Otros",
                icon: Icon(FontAwesomeIcons.pills),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).otros_medicamentos = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).nombre_cirujano,
              decoration: (InputDecoration(
                labelText: "Nombre del cirujano",
                icon: Icon(FontAwesomeIcons.userMd),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).nombre_cirujano = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).nombre_ayudante,
              decoration: (InputDecoration(
                labelText: "Nombre del ayudante",
                icon: Icon(FontAwesomeIcons.userNurse),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).nombre_ayudante = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).nombre_instrumentista,
              decoration: (InputDecoration(
                labelText: "Nombre del instrumentista",
                icon: Icon(FontAwesomeIcons.userNurse),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).nombre_instrumentista = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).nombre_asistente,
              decoration: (InputDecoration(
                labelText: "Nombre del asistente circulante",
                icon: Icon(FontAwesomeIcons.userNurse),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).nombre_asistente = value;
                Provider.of<Cirugia>(context).cambiado = true;
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
                      labelText: "Hora inicio",
                      icon: Icon(FontAwesomeIcons.clock),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).hora_inicio = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    initialValue: Provider.of<Cirugia>(context).hora_termino,
                    decoration: (InputDecoration(
                      labelText: "Hora termino",
                      icon: Icon(FontAwesomeIcons.clock),
                    )),
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      Provider.of<Cirugia>(context).hora_termino = value;
                      Provider.of<Cirugia>(context).cambiado = true;
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).valor_tratamiento,
              decoration: (InputDecoration(
                labelText: "Valor del tratamiento quirurgico",
                icon: Icon(FontAwesomeIcons.dollarSign),
              )),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).valor_tratamiento = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(
              DateFormat("y-M-d").format(fecha_retiosutura),
              style: TextStyle(fontSize: 20.0, color: Theme.of(context).accentColor),
            ),
            subtitle: Text("Retiro de sutura"),
            onTap: () {
              Util().selectDate(context, fecha_retiosutura, DateTime.now()).then((fecha) {
                setState(() {
                  fecha_retiosutura = fecha;
                  Provider.of<Cirugia>(context).retiro_sutura = DateFormat("y-M-d").format(fecha);
                });
              });
            },
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              initialValue: Provider.of<Cirugia>(context).estado_postquirurgico,
              decoration: InputDecoration(labelText: "Estado postquirurgico del paciente", icon: Icon(FontAwesomeIcons.userAlt)),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                Provider.of<Cirugia>(context).estado_postquirurgico = value;
                Provider.of<Cirugia>(context).cambiado = true;
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(
              DateFormat("y-M-d").format(fecha_alta),
              style: TextStyle(fontSize: 20.0, color: Theme.of(context).accentColor),
            ),
            subtitle: Text("Dado de alta"),
            onTap: () {
              Util().selectDate(context, fecha_alta, DateTime.now()).then((fecha) {
                setState(() {
                  fecha_alta = fecha;
                  Provider.of<Cirugia>(context).dado_alta = DateFormat("y-M-d").format(fecha);
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
