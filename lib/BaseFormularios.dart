import 'package:flutter/material.dart';
import 'Formularios/I_II_III_IV.dart';
import 'ListItem.dart';
<<<<<<< HEAD

=======
import 'package:expedientesodontologicos_app/Formularios/General_I.dart';
import 'package:expedientesodontologicos_app/Formularios/motivo_e_historia_II_III.dart';
>>>>>>> 078ffe48abe8362b6ee055cf3eaec2cdf7900f48
class Baseformularios extends StatefulWidget {
  final ListItem header;
  Baseformularios(this.header);
  @override
  _BaseformulariosState createState() => _BaseformulariosState(header);
}

class _BaseformulariosState extends State<Baseformularios> {
  final ListItem header;
<<<<<<< HEAD
  _BaseformulariosState(this.header);

  Widget bodycontent = Center(child: Text('My Page!'));
=======
>>>>>>> 078ffe48abe8362b6ee055cf3eaec2cdf7900f48

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
<<<<<<< HEAD
            AspectRatio(
              aspectRatio: 0.001/0.001,
              child:  DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AspectRatio(
                        child:CircleAvatar(
                          backgroundImage: AssetImage("Imagenes/zelda.jpg"),
                          backgroundColor: Colors.black12,
                          foregroundColor:Colors.white ,
                        ),
                        aspectRatio: 0.001/0.0004,
                      ),

                      Text(header.Nombre,
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MaterialButton(
                        onPressed: (){
                          //funcion de la camara aqui
                        },
                        child: Text("Cambiar foto",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  )
              ),
=======
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
>>>>>>> 078ffe48abe8362b6ee055cf3eaec2cdf7900f48
            ),

            ListTile(
              title: Text("General"),
<<<<<<< HEAD
              onTap: (){
                setState(() {
                  bodycontent = General_I();
                });
                Navigator.pop(context);
=======
              onTap: () {
                setState(() {
                  bodycontent = General_I();
                  Navigator.pop(context);
                });
>>>>>>> 078ffe48abe8362b6ee055cf3eaec2cdf7900f48
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

<<<<<<< HEAD


=======
>>>>>>> 078ffe48abe8362b6ee055cf3eaec2cdf7900f48
}
