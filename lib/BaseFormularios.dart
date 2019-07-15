import 'package:flutter/material.dart';
import 'ListItem.dart';
class Baseformularios extends StatelessWidget{
  final ListItem header;

  Baseformularios(this.header);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Historias clinicas"),),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                backgroundImage: AssetImage(header.imagen),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0,100.0 ,0.0, 0.0),

                  child:  Text(header.Nombre,),
                ),
              ),

              decoration: BoxDecoration(color: Colors.black26,),
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