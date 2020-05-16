import 'package:flutter/material.dart';

class Util {
  List<DropdownMenuItem> getDropdownMenuItem(List items){
    List<DropdownMenuItem> menuItems = List<DropdownMenuItem>();
    for(String item in items){
      menuItems.add(DropdownMenuItem(
          child: Text(item),
          value: item));
    }
    return menuItems;
  }

  List<DropdownMenuItem> ajustarlistas(
      List listacompleta, List listaseleccionadas,
      {int exception}) {
    if (listaseleccionadas.length == 0) {
      return getDropdownMenuItem(listacompleta);
    } else {
      List listtemp = List();
      listtemp.addAll(listacompleta);
      int i = 0;
      listaseleccionadas.forEach((value) {
        if (i != exception) {
          listtemp.remove(value);
        } else {}
        i++;
      });

      return getDropdownMenuItem(listtemp);
    }
  }

  List<List<DropdownMenuItem>> setitemlist(List listacompleta, List listaseleccionadas) {
    List<List<DropdownMenuItem>> listaprocesada = List();
    List<String> list_temp = List();
    listaprocesada.add(Util().ajustarlistas(listacompleta, List()));
    listaseleccionadas.forEach((element) {
      list_temp.add(element);
      listaprocesada.add(Util().ajustarlistas(listacompleta, list_temp));
    });
    return listaprocesada;
  }

  Future<DateTime> selectDate(BuildContext context, DateTime fecha_inicio, DateTime fecha_fin) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: fecha_inicio,
        lastDate: fecha_fin);
    if (picked != null && picked != fecha_inicio)
      return picked;
    else
      return DateTime.now();
  }
}