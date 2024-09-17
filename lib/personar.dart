import 'package:flutter/material.dart';

class CantidadPersonas extends StatefulWidget {
  final String seleccion;
  static int cantidad = 1;
  const CantidadPersonas({super.key, required this.seleccion});

  @override
  State<CantidadPersonas> createState() => _CantidadPersonasState();
}

class _CantidadPersonasState extends State<CantidadPersonas> {
  void cambiarCantidad(String cambio) {
    if (cambio == '-') {
      if (CantidadPersonas.cantidad > 1) {
        setState(() {
          CantidadPersonas.cantidad--;
        });
      }
    } else if (cambio == '+') {
      setState(() {
        switch (widget.seleccion) {
          case 'Ember':
            if (CantidadPersonas.cantidad < 3) {
              CantidadPersonas.cantidad++;
            }
            break;
          case 'Zao':
            if (CantidadPersonas.cantidad < 2) {
              CantidadPersonas.cantidad++;
            }
            break;
          case 'Grappa':
            if (CantidadPersonas.cantidad < 3) {
              CantidadPersonas.cantidad++;
            }
            break;
          case 'Larimar':
            if (CantidadPersonas.cantidad < 4) {
              CantidadPersonas.cantidad++;
            }
            break;
          default:
            CantidadPersonas.cantidad = 1;
            break;
        }
      });
    } else {
      setState(() {
        CantidadPersonas.cantidad = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Personas:    ', style: TextStyle(fontSize: 17)),
        OutlinedButton(
            onPressed: () {
              cambiarCantidad('-');
            },
            child: const Icon(Icons.remove, size: 15)),
        const SizedBox(width: 20),
        Text(CantidadPersonas.cantidad.toString()),
        const SizedBox(width: 20),
        OutlinedButton(
            onPressed: () {
              cambiarCantidad('+');
            },
            child: const Icon(Icons.add, size: 15)),
      ],
    );
  }
}
