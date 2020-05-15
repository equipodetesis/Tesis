import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/Adulto.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
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
  List<DropdownMenuItem> _itemslocal;
  List<String> listlocales = ["Ninguna", "Hospital", "Clínica"];
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
  List<List<DropdownMenuItem>> _items_revision_organos = List();

  List _sometido = [
    "Ninguna",
    "Operaciones",
    "Transfuciones",
    "Radioteparia",
  ];
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

  List<DropdownMenuItem> _items_higiene = List();

  List<DropdownMenuItem> _items_calculo = List();

  List<DropdownMenuItem> _items_salivacion = List();
  @override
  void initState() {
    Provider.of<Adulto>(context, listen: false).Userid=Provider.of<LoginState>(context, listen: false).uid;
    Provider.of<Adulto>(context, listen: false).clienteid=Provider.of<General>(context, listen: false).pacienteid;
    if(Provider.of<Adulto>(context, listen: false).fecha == "") Provider.of<Adulto>(context, listen: false).fecha=DateFormat("dd-MM-yyyy").format(DateTime.now());
    if(Provider.of<Adulto>(context, listen: false).fecha_ultima_visita == "")Provider.of<Adulto>(context, listen: false).fecha_ultima_visita = DateFormat("y-M-d").format(DateTime.now());
    if(Provider.of<Adulto>(context, listen: false).fecha_ultimo_examen_medico == "")Provider.of<Adulto>(context, listen: false).fecha_ultimo_examen_medico = DateFormat("y-M-d").format(DateTime.now());

    _items_higiene = Util().getDropdownMenuItem(opciones1);
    if(Provider.of<Adulto>(context, listen: false).nivel_higiene_oral == "") Provider.of<Adulto>(context, listen: false).nivel_higiene_oral = _items_higiene.first.value;
    print(Provider.of<Adulto>(context, listen: false).nivel_higiene_oral);
    _items_calculo = Util().getDropdownMenuItem(opciones2);
    if(Provider.of<Adulto>(context, listen: false).prescencia_calculo == "")Provider.of<Adulto>(context, listen: false).prescencia_calculo = _items_calculo.first.value;
    _items_salivacion = Util().getDropdownMenuItem(opciones2);
    if(Provider.of<Adulto>(context, listen: false).salivacion == "") Provider.of<Adulto>(context, listen: false).salivacion = _items_salivacion.first.value;
    _itemslocal = Util().getDropdownMenuItem(listlocales);
    if(Provider.of<Adulto>(context, listen: false).hospital == "")  Provider.of<Adulto>(context, listen: false).hospital = _itemslocal.first.value;
    _items_enfermedades.addAll(Util().setitemlist(_enfermedades, Provider.of<Adulto>(context, listen: false).enfermedades));
    Provider.of<Adulto>(context, listen: false).enfermedades.add(_items_enfermedades.last.first.value);
    _items_revision_organos.addAll(Util().setitemlist(_revision_organos, Provider.of<Adulto>(context, listen: false).revision_organos));
    Provider.of<Adulto>(context, listen: false).revision_organos.add(_items_revision_organos.last.first.value);
    _items_sometido.addAll(Util().setitemlist(_sometido, Provider.of<Adulto>(context, listen: false).sometido));
    Provider.of<Adulto>(context, listen: false).sometido.add(_items_sometido.last.first.value);
    print(Provider.of<Adulto>(context, listen: false).desc_operacion);
    if(Provider.of<Adulto>(context, listen: false).editable == false) Provider.of<Adulto>(context, listen: false).checklist();
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text("Motivo e historia"),
              ),
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
          children: <Widget>[motivoHistoria(), historiaMedica(), revision_organos_y_sistemas()],
        ),
      ),
    );
  }

  Widget motivoHistoria() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              /*************************************************************************
               * ************************************************************************
               * ***************************************************************************
               * ***/
              initialValue: Provider.of<Adulto>(context).motivo,
              decoration: InputDecoration(
                  labelText: "Motivo de la consulta",
                  icon: Icon(FontAwesomeIcons.fileAlt)),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              onChanged: (value){
                Provider.of<Adulto>(context).cambiado=true;
                Provider.of<Adulto>(context).motivo=value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              initialValue: Provider.of<Adulto>(context).historia,
              decoration: InputDecoration(
                  labelText: "Historia de la enfermedad actual",
                  icon: Icon(FontAwesomeIcons.fileAlt)),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              onChanged: (value){
                Provider.of<Adulto>(context).cambiado=true;
                Provider.of<Adulto>(context).historia = value;
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(
              Provider.of<Adulto>(context).fecha,
              style: TextStyle(
                  fontSize: 20.0, color: Provider.of<Adulto>(context).editable ? Theme.of(context).accentColor : Colors.grey),
            ),
            subtitle: Text("Ultima visita odontologica"),
            onTap: () {
              Provider.of<Adulto>(context).editable ?
              Util()
                  .selectDate(context, DateFormat("y-M-d").parse(Provider.of<Adulto>(context).fecha_ultima_visita), DateTime.now())
                  .then((fecha) {
                setState(() {
                  Provider.of<Adulto>(context).fecha_ultima_visita = DateFormat("y-M-d").format(fecha);
                  Provider.of<Adulto>(context).cambiado=true;
                });
              })
              : null;
            },
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              initialValue: Provider.of<Adulto>(context).tratamiento_recibido,
              decoration: InputDecoration(
                  labelText: "Tratamiento Recibido",
                  icon: Icon(FontAwesomeIcons.bandAid)),
              keyboardType: TextInputType.text,
              onChanged: (value){
                Provider.of<Adulto>(context).tratamiento_recibido = value;
                Provider.of<Adulto>(context).cambiado=true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              initialValue: Provider.of<Adulto>(context).dientes_perdidos,
              decoration: InputDecoration(
                  labelText: "Dientes Perdidos",
                  icon: Icon(FontAwesomeIcons.tooth)),
              keyboardType: TextInputType.number,
              onChanged: (value){
                Provider.of<Adulto>(context).dientes_perdidos = value;
                Provider.of<Adulto>(context).cambiado=true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              initialValue: Provider.of<Adulto>(context).causa_dientesperdidos,
              decoration: InputDecoration(
                  labelText: "Causa de Pérdida",
                  icon: Icon(FontAwesomeIcons.tooth)),
              keyboardType: TextInputType.text,
              onChanged: (value){
                Provider.of<Adulto>(context).causa_dientesperdidos = value;
                Provider.of<Adulto>(context).cambiado=true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              initialValue: Provider.of<Adulto>(context).experiencias_exodoncias,
              decoration: InputDecoration(
                  labelText: "Experiencias de exodoncias previas",
                  icon: Icon(FontAwesomeIcons.teeth)),
              keyboardType: TextInputType.text,
              onChanged: (value){
                Provider.of<Adulto>(context).experiencias_exodoncias = value;
                Provider.of<Adulto>(context).cambiado=true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              initialValue: Provider.of<Adulto>(context).higiene_oral,
              decoration: InputDecoration(
                  labelText: "Higiene oral",
                  icon: Icon(FontAwesomeIcons.teeth)),
              keyboardType: TextInputType.text,
              onChanged: (value){
                Provider.of<Adulto>(context).higiene_oral = value;
                Provider.of<Adulto>(context).cambiado=true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              initialValue: Provider.of<Adulto>(context).tipo_cepillo,
              decoration: InputDecoration(
                  labelText: "Tipo de Cepillo",
                  icon: Icon(FontAwesomeIcons.tooth)),
              keyboardType: TextInputType.text,
              onChanged: (value){
                Provider.of<Adulto>(context).tipo_cepillo = value;
                Provider.of<Adulto>(context).cambiado=true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              initialValue: Provider.of<Adulto>(context).tecnica_cepillado,
              decoration: InputDecoration(
                  labelText: "Técnica de cepillado",
                  icon: Icon(FontAwesomeIcons.teeth)),
              keyboardType: TextInputType.text,
              onChanged: (value){
                Provider.of<Adulto>(context).tecnica_cepillado = value;
                Provider.of<Adulto>(context).cambiado=true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              initialValue: Provider.of<Adulto>(context).frecuencia_cepillado,
              decoration: InputDecoration(
                  labelText: "Frecuencia de cepillado",
                  icon: Icon(FontAwesomeIcons.teeth)),
              keyboardType: TextInputType.text,
              onChanged: (value){
                Provider.of<Adulto>(context).frecuencia_cepillado = value;
                Provider.of<Adulto>(context).cambiado=true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              initialValue: Provider.of<Adulto>(context).ayudas_higiene_extras,
              decoration: InputDecoration(
                  labelText: "Otras ayuda para la higiene oral",
                  icon: Icon(FontAwesomeIcons.plusCircle)),
              keyboardType: TextInputType.text,
              onChanged: (value){
                Provider.of<Adulto>(context).ayudas_higiene_extras = value;
                Provider.of<Adulto>(context).cambiado=true;
              },
            ),
          ),
        ],
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
                  value: Provider.of<Adulto>(context).cuidadoMedico,
                  activeColor: Provider.of<Adulto>(context).editable ? Theme.of(context).accentColor : Colors.grey,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).editable ?
                    setState(() {
                      Provider.of<Adulto>(context).cuidadoMedico = value;
                      Provider.of<Adulto>(context).cambiado = true;
                    }) : null ;
                  },
                )
              ],
            ),
          ),
          Provider.of<Adulto>(context).cuidadoMedico
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
                        disabledHint: Text(Provider.of<Adulto>(context).hospital),
                        items: Provider.of<Adulto>(context, listen: false).editable ? _itemslocal : null,
                        value: Provider.of<Adulto>(context).hospital,
                        onChanged: (value) {
                          setState(() {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Provider.of<Adulto>(context).hospital = value;
                            Provider.of<Adulto>(context).cambiado = true;
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
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
                  decoration: (InputDecoration(
                    labelText: "Expediente",
                    icon: Icon(FontAwesomeIcons.fileAlt),
                  )),
                  keyboardType: TextInputType.number,
                  initialValue: Provider.of<Adulto>(context).expediente,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).expediente = value;
                    Provider.of<Adulto>(context).cambiado = true;
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text(
                  Provider.of<Adulto>(context).fecha_ultimo_examen_medico,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Provider.of<Adulto>(context).editable ? ThemeData().accentColor : Colors.grey,
                  ),
                ),
                subtitle: Text("Ultimo examen medico"),
                onTap: () {
                  Provider.of<Adulto>(context).editable ?
                  Util()
                      .selectDate(
                      context, DateFormat("y-M-d").parse(Provider.of<Adulto>(context).fecha_ultimo_examen_medico), DateTime.now())
                      .then((fecha) {
                    setState(() {
                      Provider.of<Adulto>(context).fecha_ultimo_examen_medico = DateFormat("y-M-d").format(fecha);
                    });
                  })
                  : null;
                },
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
                  decoration: (InputDecoration(
                    labelText: "Nombre del medico",
                    icon: Icon(FontAwesomeIcons.userMd),
                  )),
                  keyboardType: TextInputType.text,
                  initialValue: Provider.of<Adulto>(context).nombredelmedico,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).nombredelmedico = value;
                    Provider.of<Adulto>(context).cambiado = true;
                  },
                ),
              )
            ],
          )
              : Container(),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              decoration: (InputDecoration(
                labelText: "Describa drogas o medicamentos que toma",
                icon: Icon(FontAwesomeIcons.pills),
              )),
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).medicamentos,
              onChanged: (value) {
                Provider.of<Adulto>(context).medicamentos = value;
                Provider.of<Adulto>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text("Enfermedades"),
          ),
          Column(
            children: Provider.of<Adulto>(context).enfermedades.map((value) {
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
                        disabledHint: Text(Provider.of<Adulto>(context).enfermedades[Provider.of<Adulto>(context).enfermedades.indexOf(value)]),
                        items: _items_enfermedades[Provider.of<Adulto>(context).enfermedades.indexOf(value)] == _items_enfermedades.last && Provider.of<Adulto>(context).editable ?
                        _items_enfermedades[Provider.of<Adulto>(context).enfermedades.indexOf(value)]:
                        null,
                        value: Provider.of<Adulto>(context).enfermedades[
                        Provider.of<Adulto>(context).enfermedades.indexOf(value)],
                        itemHeight: 48,
                        onChanged: (selection) {
                          setState(() {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Provider.of<Adulto>(context).enfermedades[
                            Provider.of<Adulto>(context).enfermedades.indexOf(value)] = selection;
                            Provider.of<Adulto>(context).enfermedades =
                                Provider.of<Adulto>(context).enfermedades;
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
              Provider.of<Adulto>(context).enfermedades.last != _enfermedades.first && _enfermedades.last.length > 2 && Provider.of<Adulto>(context).editable
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_enfermedades.add(Util()
                        .ajustarlistas(_enfermedades, Provider.of<Adulto>(context).enfermedades));
                    Provider.of<Adulto>(context).enfermedades
                        .add(_items_enfermedades.last.first.value);
                  });
                },
              )
                  : Container(),
              Provider.of<Adulto>(context).enfermedades.length > 1 && Provider.of<Adulto>(context).editable
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    Provider.of<Adulto>(context).enfermedades.removeLast();
                    _items_enfermedades.removeLast();
                  });
                },
              )
                  : Container(),
            ],
          ),
          Provider.of<Adulto>(context).enfermedades.first != _enfermedades.first
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
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
                  decoration: (InputDecoration(
                    labelText: "Que enfermedad",
                    icon: Icon(FontAwesomeIcons.briefcaseMedical),
                  )),
                  keyboardType: TextInputType.text,
                  initialValue:
                  Provider.of<Adulto>(context).enfermedad_persiste,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).enfermedad_persiste = value;
                    Provider.of<Adulto>(context).cambiado = true;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
                  decoration: (InputDecoration(
                    labelText: "Inicio",
                    icon: Icon(FontAwesomeIcons.calendarDay),
                  )),
                  keyboardType: TextInputType.text,
                  initialValue: Provider.of<Adulto>(context).iniciacion_enf,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).iniciacion_enf = value;
                    Provider.of<Adulto>(context).cambiado = true;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
                  decoration: (InputDecoration(
                    labelText: "Curso",
                    icon: Icon(FontAwesomeIcons.calendarWeek),
                  )),
                  keyboardType: TextInputType.text,
                  initialValue: Provider.of<Adulto>(context).curso,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).curso = value;
                    Provider.of<Adulto>(context).cambiado = true;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
                  decoration: (InputDecoration(
                    labelText: "Tratamiento",
                    icon: Icon(FontAwesomeIcons.capsules),
                  )),
                  keyboardType: TextInputType.text,
                  initialValue: Provider.of<Adulto>(context).tratamiento,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).tratamiento = value;
                    Provider.of<Adulto>(context).cambiado = true;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
                  decoration: (InputDecoration(
                    labelText: "Estado Actual",
                    icon: Icon(FontAwesomeIcons.userInjured),
                  )),
                  keyboardType: TextInputType.text,
                  initialValue: Provider.of<Adulto>(context).estadoactual,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).estadoactual = value;
                    Provider.of<Adulto>(context).cambiado = true;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
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
                    Provider.of<Adulto>(context).cambiado = true;
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
              children: Provider.of<Adulto>(context).sometido.map((value) {
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
                              disabledHint: Text(Provider.of<Adulto>(context).sometido[Provider.of<Adulto>(context).sometido.indexOf(value)]),
                              items: _items_sometido[Provider.of<Adulto>(context).sometido.indexOf(value)] == _items_sometido.last && Provider.of<Adulto>(context).editable ?
                              _items_sometido[Provider.of<Adulto>(context).sometido.indexOf(value)]:
                              null,
                              value: Provider.of<Adulto>(context).sometido[Provider.of<Adulto>(context).sometido.indexOf(value)],
                              onChanged: (value2) {
                                setState(() {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  Provider.of<Adulto>(context).sometido[Provider.of<Adulto>(context).sometido.indexOf(value)] =
                                      value2;
                                  Provider.of<Adulto>(context).sometido=Provider.of<Adulto>(context).sometido;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Provider.of<Adulto>(context).sometido[Provider.of<Adulto>(context).sometido.indexOf(value)] == _sometido[1]
                        ? Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                        enabled: Provider.of<Adulto>(context).editable,
                        decoration: InputDecoration(
                            labelText: "Describa operacion",
                            icon: Icon(FontAwesomeIcons.pills)),
                        keyboardType: TextInputType.text,
                        initialValue: Provider.of<Adulto>(context).desc_operacion,
                        onChanged: (value) {
                          Provider.of<Adulto>(context).desc_operacion=value;
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
              Provider.of<Adulto>(context).sometido.last != _sometido.first && _items_sometido.last.length > 2 && Provider.of<Adulto>(context).editable
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
                          Util().ajustarlistas(_sometido, Provider.of<Adulto>(context).sometido));
                      Provider.of<Adulto>(context).sometido.add(_items_sometido.last.first.value);
                      Provider.of<Adulto>(context).sometido=Provider.of<Adulto>(context).sometido;
                    });
                  },
                ),
              )
                  : Container(),
              Provider.of<Adulto>(context).sometido.length > 1 && Provider.of<Adulto>(context).editable
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    Provider.of<Adulto>(context).sometido.removeLast();
                    _items_sometido.removeLast();
                    Provider.of<Adulto>(context).sometido=Provider.of<Adulto>(context).sometido;
                  });
                },
              )
                  : Container(),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              decoration: (InputDecoration(
                labelText: "Vacunas recibidas especifique",
                icon: Icon(FontAwesomeIcons.plusCircle),
              )),
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).vacunas_recibidas,
              onChanged: (value) {
                Provider.of<Adulto>(context).vacunas_recibidas = value;
                Provider.of<Adulto>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              decoration: InputDecoration(
                  labelText: "Historia familiar",
                  icon: Icon(FontAwesomeIcons.fileAlt)),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              initialValue: Provider.of<Adulto>(context).historia_familiar,
              onChanged: (value) {
                Provider.of<Adulto>(context).historia_familiar = value;
                Provider.of<Adulto>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              decoration: InputDecoration(
                  labelText: "Historia personal y social",
                  icon: Icon(FontAwesomeIcons.fileAlt)),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              initialValue: Provider.of<Adulto>(context).historia_personal_social,
              onChanged: (value) {
                Provider.of<Adulto>(context).historia_personal_social = value;
                Provider.of<Adulto>(context).cambiado = true;
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
            children: Provider.of<Adulto>(context).revision_organos.map((value) {
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
                        disabledHint: Text(Provider.of<Adulto>(context).revision_organos[
                        Provider.of<Adulto>(context).revision_organos.indexOf(value)]),
                        items: _items_revision_organos[Provider.of<Adulto>(context).revision_organos.indexOf(value)] == _items_revision_organos.last && Provider.of<Adulto>(context).editable
                            ? _items_revision_organos[Provider.of<Adulto>(context).revision_organos.indexOf(value)]
                            : null,
                        value: Provider.of<Adulto>(context).revision_organos[
                        Provider.of<Adulto>(context).revision_organos.indexOf(value)],
                        itemHeight: 48,
                        onChanged: (selection) {
                          setState(() {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Provider.of<Adulto>(context).revision_organos[Provider.of<Adulto>(context).revision_organos.indexOf(value)] = selection;
                            Provider.of<Adulto>(context).revision_organos =
                                Provider.of<Adulto>(context).revision_organos;
                            //DUDAS
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
              Provider.of<Adulto>(context).revision_organos.last != _revision_organos.first && _items_revision_organos.last.length > 2 && Provider.of<Adulto>(context).editable
                  ? FlatButton(
                child: Text(
                  "Añadir",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_revision_organos.add(Util().ajustarlistas(
                        _revision_organos, Provider.of<Adulto>(context).revision_organos));
                    Provider.of<Adulto>(context).revision_organos
                        .add(_items_revision_organos.last.first.value);
                    Provider.of<Adulto>(context).revision_organos =
                        Provider.of<Adulto>(context).revision_organos;
                  });
                },
              )
                  : Container(),
              Provider.of<Adulto>(context).revision_organos.length > 1 && Provider.of<Adulto>(context).editable
                  ? FlatButton(
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _items_revision_organos.removeLast();
                    Provider.of<Adulto>(context).revision_organos.removeLast();
                    Provider.of<Adulto>(context).revision_organos =
                        Provider.of<Adulto>(context).revision_organos;
                  });
                },
              )
                  : Container(),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
              decoration: InputDecoration(
                  labelText: "Describa si es necesario",
                  icon: Icon(FontAwesomeIcons.fileAlt)),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              initialValue: Provider.of<Adulto>(context).describa_revision,
              onChanged: (value) {
                Provider.of<Adulto>(context).describa_revision = value;
                Provider.of<Adulto>(context).cambiado = true;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
              enabled: Provider.of<Adulto>(context).editable,
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
                Provider.of<Adulto>(context).cambiado = true;
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
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
                  decoration: (InputDecoration(
                    labelText: "Minima",
                    icon: Icon(FontAwesomeIcons.thermometerEmpty),
                  )),
                  keyboardType: TextInputType.text,
                  initialValue: Provider.of<Adulto>(context).presionsan_min,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).presionsan_min = value;
                    Provider.of<Adulto>(context).cambiado = true;
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
                  decoration: (InputDecoration(
                    labelText: "Maxima",
                    icon: Icon(FontAwesomeIcons.thermometerFull),
                  )),
                  keyboardType: TextInputType.text,
                  initialValue: Provider.of<Adulto>(context).presionsan_max,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).presionsan_max = value;
                    Provider.of<Adulto>(context).cambiado = true;
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
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
                  decoration: (InputDecoration(
                    labelText: "Pulsaciones",
                    icon: Icon(FontAwesomeIcons.heartbeat),
                  )),
                  keyboardType: TextInputType.text,
                  initialValue: Provider.of<Adulto>(context).pulsaciones,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).pulsaciones = value;
                    Provider.of<Adulto>(context).cambiado = true;
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
                  enabled: Provider.of<Adulto>(context).editable,
                  decoration: (InputDecoration(
                    labelText: "Ritmo",
                    icon: Icon(FontAwesomeIcons.heartbeat),
                  )),
                  keyboardType: TextInputType.text,
                  initialValue: Provider.of<Adulto>(context).ritmo,
                  onChanged: (value) {
                    Provider.of<Adulto>(context).ritmo = value;
                    Provider.of<Adulto>(context).cambiado = true;
                  },
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
            decoration: (InputDecoration(
              labelText: "Temperatura, (Tomela de ser necesario)",
              icon: Icon(FontAwesomeIcons.fire),
            )),
            keyboardType: TextInputType.text,
            initialValue: Provider.of<Adulto>(context).temperatura,
            onChanged: (value) {
              Provider.of<Adulto>(context).temperatura = value;
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
            decoration: (InputDecoration(
              labelText: "Region vestibular",
              icon: Icon(FontAwesomeIcons.fileAlt),
            )),
            keyboardType: TextInputType.text,
            initialValue: Provider.of<Adulto>(context).region_vestibular,
            onChanged: (value) {
              Provider.of<Adulto>(context).region_vestibular = value;
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
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
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextFormField(
            style: TextStyle(color: Provider.of<Adulto>(context).editable ? null : Colors.grey),
            enabled: Provider.of<Adulto>(context).editable,
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
              Provider.of<Adulto>(context).cambiado = true;
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
                  disabledHint: Text(Provider.of<Adulto>(context).nivel_higiene_oral),
                  items: Provider.of<Adulto>(context).editable ? _items_higiene : null,
                  value: Provider.of<Adulto>(context).nivel_higiene_oral,
                  onChanged: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Provider.of<Adulto>(context).nivel_higiene_oral = value;
                      Provider.of<Adulto>(context).cambiado = true;
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
                  disabledHint: Text(Provider.of<Adulto>(context).prescencia_calculo),
                  items: Provider.of<Adulto>(context).editable ? _items_calculo : null,
                  value: Provider.of<Adulto>(context).prescencia_calculo,
                  onChanged: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Provider.of<Adulto>(context).prescencia_calculo = value;
                      Provider.of<Adulto>(context).cambiado = true;

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
                  disabledHint: Text(Provider.of<Adulto>(context).salivacion),
                  items: Provider.of<Adulto>(context).editable ? _items_salivacion : null,
                  value: Provider.of<Adulto>(context).salivacion,
                  onChanged: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Provider.of<Adulto>(context).salivacion = value;
                      Provider.of<Adulto>(context).salivacion = value;
                      Provider.of<Adulto>(context).cambiado = true;

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
