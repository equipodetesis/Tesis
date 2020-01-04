
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class General with ChangeNotifier{
  String nombre,apellido,sexo,estado_civil,direccion,emergencia,procedencia,telefono,ocupacion,referencia,fecha_inicio,foto,userid;
  String edad;

   void set(nombre,apellido,edad,sexo,estadocivil,direccion,emergenia,procedencia,telefono,ocupacion,referencia,fecha_inicio,foto,userid){
     this.nombre=nombre;
     this.apellido=apellido;
     this.edad=edad;
     this.sexo=sexo;
     this.estado_civil=estado_civil;
     this.direccion=direccion;
     this.emergencia=emergencia;
     this.procedencia=procedencia;
     this.telefono=telefono;
     this.ocupacion=ocupacion;
     this.referencia=referencia;
     this.fecha_inicio=fecha_inicio;
     this.foto=foto;
     this.userid=userid;
     notifyListeners();
   }

  General.fromJson(Map<String, dynamic> data)
  :userid = data["UserID"],
  nombre=data['Nombre'],
  apellido=data["Apellido"],
   estado_civil=data["EstadoCivil"] ,
   direccion=data["direccion"],
  procedencia=data["procedencia"],
  telefono=data["Telefono"],
  ocupacion=data["Ocupacion"],
  sexo=data["Sexo"],
  fecha_inicio=data["fecha_inicio"],
  emergencia=data["emergencia"],
  referencia=data["referencia"],
   foto=data["foto"],
  edad=data["edad"];

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
  //Las funcionse son addCliente y updateCliente
  Future<void> addCLiente() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addCliente',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print("Ingresado con exito");});
  }
  Future<void> updateCLiente() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'updateCliente',
    );
    dynamic resp = await callable.call(this.toMap()).whenComplete((){print("Ingresado con exito");});
  }

}