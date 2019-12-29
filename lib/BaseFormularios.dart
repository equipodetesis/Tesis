import 'package:expedientesodontologicos_app/Imagenes/SubirFoto.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Formularios/I_II_III_IV.dart';
import 'Formularios/V_VI_VII.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Historias clinicas"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: (){
              print(Provider.of<General>(context).nombre);
              Provider.of<General>(context).addCLiente();
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
                        ),),
                        Row(
                          children: <Widget>[
                            MaterialButton(
                              onPressed: () async {
                                //funcion de la camara aqui
                                SubirFoto f;
                                await f.tomarFoto(header.Nombre+"_foto");
                              },
                              child: Text("Tomar foto",style: TextStyle(color: Colors.white),),
                            ),
                            MaterialButton(
                              onPressed: () async {
                                //funcion de la camara aqui
                                SubirFoto f;
                                await f.galeryFoto(header.Nombre+"_foto");
                              },
                              child: Text("Cambiar foto",style: TextStyle(color: Colors.white),),
                            )
                          ],
                        )
                      ],
                    )
                ),

    ),

            ListTile(
              title: Text("General"),
              onTap: (){
                setState(() {
                  bodycontent = I_II_III_IV();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Historia Medica"),
              onTap: (){
                setState(() {
                  bodycontent = V_VI_VII();
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
