import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:expedientesodontologicos_app/Util/Util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewCliente extends StatefulWidget{

  @override
  _NewClienteState createState() => _NewClienteState();
}

class _NewClienteState extends State<NewCliente> {
  List sexos = ["Masculino", "Femenino"];

  List<DropdownMenuItem> _sexolist;

  String _currentsexo;

  String fecha_inicio="";

  DateTime fecha = DateTime.now();
 bool enviado=false,error=false;
  @override
  Widget build(BuildContext context) {
    _sexolist = Util().getDropdownMenuItem(sexos);
    _currentsexo = sexos[0];
    Provider.of<General>(context).foto="https://firebasestorage.googleapis.com/v0/b/expedientes-odontologicos.appspot.com/o/doctor-symbol-physician-medicine-health-care-clinic-doctor-of-medicine-doctors-visit-logo-png-clip-art.png?alt=media&token=71369a9b-7e9d-42f1-bc0e-17a81d517093";

      Provider.of<General>(context).sexo = _currentsexo;
      print("hola");
      Provider.of<General>(context).fecha_inicio=DateFormat("y-M-d").format(fecha);
      fecha_inicio=Provider.of<General>(context).fecha_inicio;

    return Scaffold(
      appBar: AppBar(
        title: Text("Historias clinicas"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: (){
              showDialog(context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Enviando"),
                      content:Container(
                          height: 250,
                          width: 500,
                          child: Center(child: CircularProgressIndicator(),)),

                    );
                  }

              );
                if(Provider.of<General>(context).cambiado){
                  Provider.of<General>(context).cambiado=false;
                  print("Holas");
                Provider.of<General>(context).addCLiente().then((algo){
                  Navigator.pop(context);
                  showDialog(context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Exito"),
                          content:Text("Guardado"),
                          actions: <Widget>[
                            Center(
                              child: FlatButton(
                                child: Text("Aceptar"),
                                onPressed: (){
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            )
                          ],
                        );
                      }

                  );
                 }).catchError((onError,trace){
                  Navigator.pop(context);
                  showDialog(context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Eror"),
                          content:Text(onError.toString()),
                          actions: <Widget>[
                            Center(
                              child: FlatButton(
                                child: Text("Aceptar"),
                                onPressed: (){
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            )
                          ],
                        );
                      }

                  );

                });


              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration(
                  labelText: "Nombre",
                  icon: Icon(Icons.person),
                )),
                //controller: nombre,
                initialValue: Provider.of<General>(context).nombre,
                keyboardType: TextInputType.text,
                onChanged: ((value){
                  if(value!=null || value.length>0) {
                    Provider.of<General>(context).userid = Provider.of<LoginState>(context).uid;
                    Provider.of<General>(context).nombre = value;
                    Provider.of<General>(context).cambiado=true;

                  }
                }),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Icon(FontAwesomeIcons.venusMars),
                  margin: EdgeInsets.all(10),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(1),
                    child: DropdownButton(
                      isExpanded: true,
                      items: _sexolist,
                      value: Provider.of<General>(context).sexo,
                      onChanged: (value) {

                          Provider.of<General>(context).userid = Provider.of<LoginState>(context).uid;
                          Provider.of<General>(context).sexo = value;
                          Provider.of<General>(context).cambiado=true;

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
                  labelText: "Estado civil",
                  icon: Icon(FontAwesomeIcons.userFriends),
                )),
                //controller: estado_civil,
                keyboardType: TextInputType.text,
                initialValue: Provider.of<General>(context).estado_civil,
                onChanged: (value){
                  Provider.of<General>(context).estado_civil = value;
                  Provider.of<General>(context).userid = Provider.of<LoginState>(context).uid;
                  Provider.of<General>(context).cambiado=true;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration(
                  labelText: "Direccion",
                  icon: Icon(Icons.location_on),
                )),
                //controller: direccion,
                keyboardType: TextInputType.text,
                initialValue: Provider.of<General>(context).direccion,
                onChanged: (value){
                  Provider.of<General>(context).userid = Provider.of<LoginState>(context).uid;
                  Provider.of<General>(context).direccion = value;
                  Provider.of<General>(context).cambiado=true;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration(
                  labelText: "Procedencia",
                  icon: Icon(FontAwesomeIcons.city),
                )),
                //controller: procedencia,
                keyboardType: TextInputType.text,
                initialValue: Provider.of<General>(context).procedencia,
                onChanged: (value){
                  Provider.of<General>(context).userid = Provider.of<LoginState>(context).uid;
                  Provider.of<General>(context).procedencia = value;
                  Provider.of<General>(context).cambiado=true;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration(
                  labelText: "Telefono",
                  icon: Icon(Icons.phone_android),
                )),
                //controller: telefono,
                keyboardType: TextInputType.phone,
                initialValue: Provider.of<General>(context).telefono,
                onChanged: (value){
                  Provider.of<General>(context).userid = Provider.of<LoginState>(context).uid;
                  Provider.of<General>(context).telefono = value;
                  Provider.of<General>(context).cambiado=true;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration(
                  labelText: "Ocupacion",
                  icon: Icon(Icons.work),
                )),
                //controller: ocupacion,
                keyboardType: TextInputType.text,
                initialValue: Provider.of<General>(context).ocupacion,
                onChanged: (value){
                  Provider.of<General>(context).ocupacion = value;
                  Provider.of<General>(context).userid = Provider.of<LoginState>(context).uid;
                  Provider.of<General>(context).cambiado=true;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration(
                  labelText: "Emergencia",
                  icon: Icon(Icons.report_problem),
                )),
                //controller: emergencia,
                keyboardType: TextInputType.text,
                initialValue: Provider.of<General>(context).emergencia,
                onChanged: (value){
                  Provider.of<General>(context).emergencia = value;
                  Provider.of<General>(context).userid = Provider.of<LoginState>(context).uid;
                  Provider.of<General>(context).cambiado=true;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration(
                  labelText: "Referencia",
                  icon: Icon(Icons.record_voice_over),
                )),
                //controller: referencia,
                keyboardType: TextInputType.text,
                initialValue: Provider.of<General>(context).referencia,
                onChanged: (value){
                  Provider.of<General>(context).referencia = value;
                  Provider.of<General>(context).userid = Provider.of<LoginState>(context).uid;
                  Provider.of<General>(context).cambiado=true;
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                Provider.of<General>(context).fecha_inicio,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              subtitle: Text("Fecha de inicio"),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: (InputDecoration(
                  labelText: "Edad",
                  icon: Icon(Icons.cake),
                )),
                //controller: edad,
                keyboardType: TextInputType.number,
                initialValue: Provider.of<General>(context).edad,
                onChanged: (value){
                  Provider.of<General>(context).edad = value;
                  Provider.of<General>(context).userid = Provider.of<LoginState>(context).uid;
                  Provider.of<General>(context).cambiado=true;
                },
              ),
            ),
          ])),
    );
  }
}