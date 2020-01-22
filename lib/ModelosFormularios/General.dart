
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class General {
  String nombre,apellido,sexo,estado_civil,direccion,emergencia,procedencia,telefono,ocupacion,referencia,fecha_inicio,foto,userid,pacienteid;
  String edad;
 bool cambiado=false;
  General();


  void fromJson(Map<String, dynamic> data) {
    userid = data["UserID"];
    nombre=data['Nombre'];
    apellido=data["Apellido"];
    estado_civil=data["EstadoCivil"] ;
    direccion=data["direccion"];
    procedencia=data["procedencia"];
    telefono=data["Telefono"];
    ocupacion=data["Ocupacion"];
    sexo=data["Sexo"];
    fecha_inicio=data["fecha_inicio"];
    emergencia=data["emergencia"];
    referencia=data["referencia"];
    foto=data["foto"];
    edad=data["edad"];

  }
  Map<String,dynamic> toMap()=>{
     "UserID":userid,
     'Nombre': nombre,
     "Apellido": apellido,
     "EstadoCivil": estado_civil ,
     "direccion": direccion,
     "procedencia":procedencia,
     "Telefono":telefono,
     "Ocupacion":ocupacion,
     "Sexo":sexo,
     "fecha_inicio":fecha_inicio,
     "emergencia":emergencia,
     "referencia":referencia,
     "foto": foto,
     "edad":edad,
   };
  void clear(){
    userid = "";
    nombre="";
    apellido="";
    estado_civil="" ;
    direccion="";
    procedencia="";
    telefono="";
    ocupacion="";
    sexo=null;
    fecha_inicio="";
    emergencia="";
    referencia="";
    foto="";
    edad="";
    pacienteid="";
  }
  //Las funcionse son addCliente y updateCliente
  Future<void> addCLiente() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addCliente',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print("Ingresado con exito");});
  }
  Future<void> updateCLiente() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'UpdateCliente',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print("Ingresado con exito");});
  }

}