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
            AspectRatio(
              aspectRatio: 0.001/0.001,
              child:  DrawerHeader(
                decoration: BoxDecoration(

                  gradient: LinearGradient(colors: [Colors.white,Colors.blueAccent])

                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AspectRatio(
                        child:CircleAvatar(
                          backgroundImage: NetworkImage(header.imagen),
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