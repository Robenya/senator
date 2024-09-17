import 'package:flutter/material.dart';
import 'package:senatour/reservaciones.dart';
import 'package:senatour/restaurantes.dart';

void main() {
  runApp(const Senatour());
}

class Senatour extends StatelessWidget {
  const Senatour({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Senatour Turistico',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 66, 5, 5)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selecPagina = 0;

  @override
  Widget build(BuildContext context) {
    Widget pagina;
    switch (selecPagina) {
      case 0:
        pagina = const Restaurantes();
        break;
      case 1:
        pagina = const Reservaciones();
        break;
      default:
        throw UnimplementedError('No hay widget para $selecPagina');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Santour Turistico'),
            centerTitle: true,
            backgroundColor:
                Theme.of(context).colorScheme.primaryFixedDim.withOpacity(0.9),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  child: pagina,
                )),
                NavigationBar(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(Icons.restaurant),
                        label: 'Restaurantes',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.menu_book),
                        label: 'Reservaciones',
                      ),
                    ],
                    selectedIndex: selecPagina,
                    onDestinationSelected: (value) {
                      setState(() {
                        selecPagina = value;
                      });
                    },
                    indicatorColor:
                        Theme.of(context).colorScheme.inversePrimary),
              ],
            ),
          ),
        );
      },
    );
  }
}
