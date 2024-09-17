import 'package:flutter/material.dart';
import 'package:senatour/form_reservas.dart';

//Pagina de Reservaciones
class Reservaciones extends StatelessWidget {
  const Reservaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: reservas.entries.map((entry) {
        String restaurante = entry.key;
        List<String> reservaciones = entry.value;

        return ExpansionTile(
          title: Text('$restaurante - ${reservaciones.length} reserva(s)'),
          children: reservaciones.map((reserva) {
            return ListTile(
              title: Text(reserva),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
