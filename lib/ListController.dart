import 'package:flutter/material.dart';
import 'ListItem.dart';
import 'BaseFormularios.dart';
class ListController extends StatelessWidget{
  List<ListItem> preitems=new List<ListItem>();
  bool search;
  String searchtext;
  ListController( List<ListItem> items, bool search,String searchtext){
    this.preitems=items;
    this.search=search;
    this.searchtext=searchtext;
  }

  @override
  Widget build(BuildContext context) {
    List<ListItem> items= new List<ListItem>();

    if(search){
      for(int i=0;i<preitems.length;i++){
        if(preitems[i].Nombre.toLowerCase().contains(searchtext.toLowerCase())){
          items.add(preitems[i]);
        }
      }
    }
    else
      List<ListItem> items=preitems;

    return ListView.builder(
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
                    Text(
                      items[index].Nombre,
                      style:  TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Baseformularios(items[index])),
                  );},
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child:  Text(
                    items[index].fechacita,
                    style:  TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                )
            ) ],

        )
    );
  }
}