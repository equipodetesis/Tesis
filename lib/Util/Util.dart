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

  Future<DateTime> selectDate(BuildContext context, DateTime fecha_inicio, DateTime fecha_fin) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: fecha_inicio,
        firstDate: DateTime(1900, 1),
        lastDate: fecha_fin);
    if (picked != null && picked != fecha_inicio)
      return picked;
    else
      return fecha_inicio;
  }
}