import 'package:flutter/material.dart';

class ControldePlaca{
  void algo(){
    Widget diente= Container(
      padding: EdgeInsets.fromLTRB(5.0, 0.0,0.0,0.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(child: Image.asset("Imagenes/dientearr.png")/*,color: Colors.cyan,size: 40.0)*/,
            padding:EdgeInsets.fromLTRB(0.0,1.0,90.0,0.0) ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(child:  Image.asset("Imagenes/dienteizq.png"),/*color: Colors.cyan,size: 50.0,)*/
                padding: EdgeInsets.fromLTRB(5.0, 0.0,0.0,0.0),
              ),
              Container(child: Image.asset("Imagenes/dienteder.png"),/*color: Colors.cyan,size: 50.0),*/
                padding:EdgeInsets.fromLTRB(0.0, 0.0,100.0,0.0) ,
              ),

            ],
          ),
          Container(child: Image.asset("Imagenes/dienteabajo.png"),/*color: Colors.cyan,size: 40.0),*/
            padding: EdgeInsets.fromLTRB(0.0, 0.0,90.0,0.0),

          ),

        ],
      ),
    );
  }
}