import 'package:flutter/material.dart';

class General_I extends StatefulWidget{
  @override
  State<General_I> createState() {

    return General_I_State();
  }

}
class General_I_State extends State<General_I>{
  TextEditingController nombre,sexo,estado_civil,direccion,emergencia,procedencia,telefono,ocupacion,referencia,fecha_inicio,edad;
  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextFormField(
          controller: nombre,
        ),
      TextFormField(
      controller: sexo,

      ),

      TextFormField(
      controller: estado_civil,

    ),
        TextFormField(
          controller: direccion,

        ),
        TextFormField(
          controller: procedencia,

        ),
        TextFormField(
          controller: telefono,

        )
        ,
        TextFormField(
          controller: ocupacion,

        )
        ,
        TextFormField(
          controller: this.emergencia,

        ),
        TextFormField(
          controller: referencia,

        ),
        TextFormField(
          controller: fecha_inicio,

        ),
        TextFormField(
          controller: edad,

        )
   ]
    )
    );
  }

}