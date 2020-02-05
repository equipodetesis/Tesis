import 'package:expedientesodontologicos_app/Imagenes/SubirFoto.dart';
import 'package:expedientesodontologicos_app/ModelosFormularios/General.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Formularios/I_II_III_IV.dart';
import 'Formularios/V_VI_VII.dart';
import 'ListItem.dart';
import 'ModelosFormularios/Adulto.dart';

class Baseformularios extends StatefulWidget {
  Baseformularios();
  @override
  _BaseformulariosState createState() => _BaseformulariosState();
}

class _BaseformulariosState extends State<Baseformularios> {

  _BaseformulariosState();
  I_II_III_IV formI= I_II_III_IV();
  String nombre="Nuevo registro";
  bool actualizacion=false;
  Widget bodycontent ;
  String foto;
  @override
  void initState() {
    bodycontent=formI;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    if(!Provider.of<General>(context).actualizar){
     Provider.of<General>(context).foto="https://firebasestorage.googleapis.com/v0/b/expedientes-odontologicos.appspot.com/o/54462699_10214142660262421_7801861136030105600_n.jpg?alt=media&token=5060a01b-917e-42e5-ac5c-6cd8bff61f3b";
     foto=Provider.of<General>(context).foto;

    }else{
      actualizacion=true;
      foto=Provider.of<General>(context).foto;
      nombre=Provider.of<General>(context).nombre;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Historias clinicas"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: (){

                //updates
                if(Provider.of<General>(context).cambiado){
                  print(Provider.of<General>(context).pacienteid+"!!!!!!");
                  Provider.of<General>(context).updateCLiente();

                }
                if(Provider.of<Adulto>(context).cambiado){
                  Provider.of<Adulto>(context).addAdult();
                }
                Navigator.pop(context);

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
                          backgroundImage: NetworkImage(foto),
                          backgroundColor: Colors.black12,
                          foregroundColor:Colors.white ,
                        ),
                        aspectRatio: 0.001/0.0004,
                      ),

                      Text(nombre,
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
                                Provider.of<General>(context).foto=await f.tomarFoto(Provider.of<General>(context).nombre+"_foto");
                                setState(() {
                                  foto=Provider.of<General>(context).foto;
                                });


                              },
                              child: Text("Tomar foto",style: TextStyle(color: Colors.white),),
                            ),
                            MaterialButton(
                              onPressed: () async {
                                //funcion de la camara aqui
                                SubirFoto f;
                                Provider.of<General>(context).foto=await f.galeryFoto(Provider.of<General>(context).nombre+"_foto");
                                setState(() {
                                  foto=Provider.of<General>(context).foto;
                                });


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
