import 'package:flutter/material.dart';
import 'package:senatour/form_reservas.dart';

class Restaurantes extends StatelessWidget {
  const Restaurantes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Seleccione el restaurante preferido:',
            style: TextStyle(fontSize: 19)),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardRestaurante(title: 'Ember', icon: Icons.local_fire_department),
            SizedBox(width: 20),
            CardRestaurante(title: 'Zao', icon: Icons.ramen_dining),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardRestaurante(title: 'Grappa', icon: Icons.local_pizza),
            SizedBox(width: 20),
            CardRestaurante(title: 'Larimar', icon: Icons.set_meal),
          ],
        ),
      ],
    );
  }
}

class CardRestaurante extends StatelessWidget {
  final String title;
  final IconData icon;
//Widgets de las tarjetas de cada restaurante
  const CardRestaurante({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.secondary,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FormularioReservacion(restaurante: title, icon: icon),
            ),
          );
        },
        child: SizedBox(
          width: 170,
          height: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 80, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 10),
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
