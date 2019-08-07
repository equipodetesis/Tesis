import 'package:flutter/material.dart';
import 'ListItem.dart';
class Baseformularios extends StatelessWidget{
  final ListItem header;

  Baseformularios(this.header);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Historias clinicas"),
       centerTitle: true,
      ),
      body: Center(child: Text('My Page!')),
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
                    onPressed: (){
                      //funcion de la camara aqui
                    },
                    child: Text("Cambiar foto"),
                  )
                ],
              )
            ),
            ListTile(
              title: Text("General"),
              onTap: (){
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