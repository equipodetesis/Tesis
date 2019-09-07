import 'package:flutter/material.dart';
import 'ListItem.dart' as lista;
import 'ListController.dart';
class principal extends StatefulWidget{
  final String title;
  final List<lista.ListItem> items;
  principal({Key key, this.title, this.items}):super(key:key);
  @override
  PrincipalState createState() => new PrincipalState(title,items);


}

class PrincipalState extends State<principal> {
  final String title;
  final List<lista.ListItem> items;
  Icon actionIcon= Icon(Icons.search,color: Colors.white);
  bool _IsSearching;
  String _searchText = "";
  final key =  GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery =  TextEditingController();
  Widget appBarTitle =  Text("Historias clinicas", style:TextStyle(color: Colors.white),);

  PrincipalState(this.title, this.items){
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            )
        ],
      ),
      body: ListController(items, _IsSearching,_searchText),
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