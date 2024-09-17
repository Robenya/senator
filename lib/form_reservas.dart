import 'package:flutter/material.dart';
import 'package:senatour/horarios.dart';
import 'package:senatour/personar.dart';

//Valores para guardar las reservaciones
List<String> horarios = ['6pm-8pm', '8pm-10pm'];
Map<String, List<String>> reservas = {
  'Ember': [],
  'Zao': [],
  'Grappa': [],
  'Larimar': []
};

class FormularioReservacion extends StatefulWidget {
  final String restaurante;
  final IconData icon; // Añadimos el icono como parámetro

  const FormularioReservacion(
      {super.key, required this.restaurante, required this.icon});

  @override
  State<FormularioReservacion> createState() => _FormularioReservacionState();
}

class _FormularioReservacionState extends State<FormularioReservacion> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nombreControlador = TextEditingController();

    void limpiarform() {
      setState(() {
        nombreControlador.text = '';
        CantidadPersonas.cantidad = 1;
      });
    }

    void crearReservacion() {
      String nombre = nombreControlador.text;

      if (nombre.isEmpty) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text(
                    'Por favor, escribe un nombre para la reservacion.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      } else {
        reservas[widget.restaurante]!.add(
            '$nombre - ${CantidadPersonas.cantidad} personas - ${HorariosDropdown.valorPrimero}');

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Completado'),
                content: Text('La reservacion de $nombre se ha completado!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
        limpiarform();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Reservación en ${widget.restaurante}'),
        backgroundColor:
            Theme.of(context).colorScheme.primaryFixedDim.withOpacity(0.5),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          // Fondo de icono
          Positioned.fill(
            child: Opacity(
                opacity: 0.3,
                child: Icon(widget.icon,
                    size: 400,
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5))),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                TextField(
                  controller: nombreControlador,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                  ),
                ),
                const SizedBox(height: 20),
                CantidadPersonas(seleccion: widget.restaurante),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text('Horario:    ', style: TextStyle(fontSize: 17)),
                    HorariosDropdown(),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    crearReservacion();
                  },
                  child: const Text('Reservar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
