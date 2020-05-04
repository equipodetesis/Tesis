import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class Diente{
  String codigo = '',userid="",pacienteid="",fecha="";
  bool cara_arriba =  false, cara_izquierda =  false, cara_derecha =  false, cara_abajo =  false;
  void fromjson(Map<String, dynamic> data){
    codigo=data["Codigo"];
    cara_arriba=data["Cara_superior"];
    cara_abajo=data["Cara_inferior"];
    cara_derecha=data["Cara_derecha"];
    cara_izquierda=data["Cara_izquierda"];
  }
  Map<String,dynamic> toMap()=>{
    "ClienteID":pacienteid,
    "UserID":userid,
    "Fecha":fecha,
    "CodigoDiente":codigo,
    "Cara_superior":cara_arriba,
    "Cara_inferior":cara_abajo,
    "Cara_derecha":cara_derecha,
    "Cara_izquierda":cara_izquierda,
  };
  Future<void> addDiente() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addDiente',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print("Diente+");});
  }
}