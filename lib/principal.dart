
import 'package:expedientesodontologicos_app/Loggin/LoginState.dart';
import 'package:expedientesodontologicos_app/Menus/Constansts.dart';
import 'package:expedientesodontologicos_app/NewCliente.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BaseFormularios.dart';
import 'ListItem.dart' as lista;
import 'ListController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ModelosFormularios/General.dart';

class principal extends StatefulWidget{


  principal({Key key,}):super(key:key);
  @override
  PrincipalState createState() => new PrincipalState();

}

class PrincipalState extends State<principal> {

  final List<lista.ListItem> items=List<lista.ListItem>();
 Firestore database=Firestore.instance;
  Icon actionIcon= Icon(Icons.search,color: Colors.white);
  bool _IsSearching;
  String _searchText = "";
  final key =  GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery =  TextEditingController();
  Widget appBarTitle =  Text("Historias clinicas", style:TextStyle(color: Colors.white),);


  PrincipalState(){
    _searchQuery.addListener((){
      if(_searchQuery.text.isEmpty){
        setState(() {
          _IsSearching=true;
          _searchText="";
        });
      }
      else{
        setState(() {
          _IsSearching=true;
          _searchText=_searchQuery.text;
        });
      }
    });

  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    database.settings(persistenceEnabled: true);
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Provider.of<General>(context).clear();
           Navigator.push(context,  MaterialPageRoute(builder: (context) => NewCliente()));
        },
        hoverColor: Colors.black,
        isExtended: true,
        tooltip: "Agregar nuevo paciente",
      ),
      appBar: AppBar(
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: (){
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon =  Icon(Icons.close, color: Colors.white,);
                  this.appBarTitle =  TextField(
                    controller: _searchQuery,
                    style: new TextStyle(
                      color: Colors.white,

                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Buscar...",
                        hintStyle:  TextStyle(color: Colors.white)
                    ),
                  );
                  _handleSearchStart();
                }
                else{
                  _handleSearchEnd();
                }
              }
              );
            },
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String eleccion){
                return PopupMenuItem<String>(
                  value: eleccion,
                  child: Text(eleccion),
                );
              }).toList();
            },
            onSelected: (String elegido){
              if(elegido == Constants.SignOut)
                Provider.of<LoginState>(context).logout();
            },
          )
        ],

      ),
      body: ListController( _IsSearching,_searchText,database),
    );

  }
  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon =Icon(Icons.search, color: Colors.white,);
      this.appBarTitle =
          Text("Historias clinicas", style:  TextStyle(color: Colors.white),);
      _IsSearching = false;
      _searchQuery.clear();
    });
  }

}