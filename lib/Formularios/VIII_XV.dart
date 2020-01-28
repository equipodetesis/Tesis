import 'package:expedientesodontologicos_app/ModelosFormularios/Adulto.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TabBar(
            tabs: <Widget>[
              
              Tab(
                child: Text("Signos Vitales"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            signos_vitales()
          ],
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
                      icon: Icon(FontAwesomeIcons.briefcaseMedical),
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
                      icon: Icon(FontAwesomeIcons.briefcaseMedical),
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
                      icon: Icon(FontAwesomeIcons.briefcaseMedical),
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
                      icon: Icon(FontAwesomeIcons.briefcaseMedical),
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
                icon: Icon(FontAwesomeIcons.briefcaseMedical),
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
                icon: Icon(FontAwesomeIcons.briefcaseMedical),
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
                icon: Icon(FontAwesomeIcons.briefcaseMedical),
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
                icon: Icon(FontAwesomeIcons.briefcaseMedical),
              )),
              minLines: 1,
              maxLines: 6,
              keyboardType: TextInputType.text,
              initialValue: Provider.of<Adulto>(context).examenfisico_caracuello,
              onChanged: (value) {
                Provider.of<Adulto>(context).examenfisico_caracuello = value;
              },
            ),
          ),
        ],
      ),
    );
  }

}
