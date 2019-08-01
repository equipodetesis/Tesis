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
        itemBuilder:(context,index)=> Column(
          children: <Widget>[
             Divider(height: 10.0),
            ListTile(
              leading: CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.lightBlueAccent,
                backgroundImage: AssetImage('Imagenes/incognito.png'),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    items[index].Nombre,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    items[index].fechacita,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
            )
            ) ],
        )
      ) ,
    );
  }

}