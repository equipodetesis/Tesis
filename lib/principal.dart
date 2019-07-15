import 'package:flutter/material.dart';
import 'ListItem.dart' as lista;
import 'BaseFormularios.dart';
class principal extends StatelessWidget{

  final String title;
  final List<lista.ListItem> items;

  principal(this.title, this.items);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder:(context,index){
          final lista.ListItem item=items[index];

          return Container(
            height: 100.0,

            child:ListTile(

              title: Text(item.Nombre),
              leading: CircleAvatar(
                backgroundImage:AssetImage(item.imagen) ,

              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Baseformularios(item)),
                );
              },

            ) ,
          );


        } ,
      ) ,
    );
  }

}