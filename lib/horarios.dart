//Widget para la seleccion de los dos horarios disponibles, igual en cada restaurante

import 'package:flutter/material.dart';
import 'package:senatour/form_reservas.dart';

class HorariosDropdown extends StatefulWidget {
  static var valorPrimero = horarios.first;

  const HorariosDropdown({super.key});

  @override
  State<HorariosDropdown> createState() => _HorariosDropdownState();
}

class _HorariosDropdownState extends State<HorariosDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: HorariosDropdown.valorPrimero,
      items: horarios.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          HorariosDropdown.valorPrimero = value!;
        });
      },
    );
  }
}
