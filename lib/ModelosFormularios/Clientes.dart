import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class Clientes{
  String nombre,apellido,sexo,estado_civil,direccion,emergencia,procedencia,telefono,ocupacion,referencia,fecha_inicio,foto,userid;
  int edad;

  Clientes(this.nombre, this.apellido, this.sexo, this.estado_civil,
      this.direccion, this.emergencia, this.procedencia, this.telefono,
      this.ocupacion, this.referencia, this.fecha_inicio, this.foto,
      this.userid, this.edad);
  //Las funcionse son addCliente y updateCliente
  Future<void> addCLiente() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addCliente',
    );
    dynamic resp = await callable.call(<String, dynamic>{
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
    }).whenComplete((){print("Ingresado con exito");});
  }
  Future<void> updateCLiente() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'updateCliente',
    );
    dynamic resp = await callable.call(<String, dynamic>{
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
    }).whenComplete((){print("Ingresado con exito");});
  }

}