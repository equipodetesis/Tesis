import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class Clientes{
  String Nombre,edad,EstadoCivil,foto;

  EnumProperty funcion={

  } as EnumProperty;
  Clientes(this.Nombre, this.edad, this.EstadoCivil,this.foto);

  Future<void> nuevoCLiente() async {
    final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addCliente',
    );
    dynamic resp = await callable.call(<String, dynamic>{
      'Nombre': Nombre,
      //"Apellido": ,
      //"email": ,
      "EstadoCivil": EstadoCivil ,
      //"direccion": ,
      //"procedencia":,
      //"Telefono":,
      //"Ocupacion":,
      //"Sexo":,
      //"fecha_inicio":,
      //"emergencia":,
      //"referencia":,
      "foto": foto,
    });
  }

}