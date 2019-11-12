import 'package:flutter/material.dart';
import 'ListItem.dart';
import 'package:expedientesodontologicos_app/Formularios/General_I.dart';
import 'package:expedientesodontologicos_app/Formularios/motivo_e_historia_II_III.dart';
class Baseformularios extends StatefulWidget {
  final ListItem header;
  Baseformularios(this.header);
  @override
  _BaseformulariosState createState() => _BaseformulariosState(header);
}

class _BaseformulariosState extends State<Baseformularios> {
  final ListItem header;

  _BaseformulariosState(this.header);
  Widget bodycontent = Center(child: Text('My Page!'));
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Historias clinicas"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: (){

            },
          )
        ],
      ),
      body: bodycontent,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(header.imagen),
                    ),
                    Text(header.Nombre,
                      textScaleFactor: 15.0,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
//funcion de la camara aqui
                      },
                      child: Text("Cambiar foto"),
                    )
                  ],
                )
            ),
            ListTile(
              title: Text("General"),
              onTap: () {
                setState(() {
                  bodycontent = General_I();
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: Text("Peridograma"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motivo_historia()),
                );
              },
            ),
            ListTile(
              title: Text("Restaurativa"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Control de placa"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Cirugia"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Endodoncia"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

}
