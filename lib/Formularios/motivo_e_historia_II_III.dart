import 'package:flutter/material.dart';

class motivo_historia extends StatefulWidget {
  @override
  _motivo_historiaState createState() => _motivo_historiaState();
}

class _motivo_historiaState extends State<motivo_historia> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return "por favor llene el campo";
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: (){
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Procesando datos"),));
              },
              child: Text("Submit"),
            ),
          )
        ],
      ),
    );
  }
}
