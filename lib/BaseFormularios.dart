import 'package:flutter/material.dart';
import 'Formularios/I_II_III_IV.dart';
import 'ListItem.dart';

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
            ),

            ListTile(
              title: Text("General"),
              onTap: (){
                setState(() {
                  bodycontent = General_I();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Peridograma"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Restaurativa"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Control de placa"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Cirugia"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Endodoncia"),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

}
