import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/widgets/menu.dart';
import 'package:pcbuilderec/src/widgets/menu_flotante.dart';
import 'package:pcbuilderec/src/widgets/side_medu.dart';

class MiPerfil extends StatelessWidget {
  const MiPerfil({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Menu(),
      endDrawer: SideMenuDrawer(),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(
                  'Nombre del usuario',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Widget que muestra el correo electrónico
                Text(
                  'Correo Electrónico: usuario@example.com',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20),
                // Widget que muestra la sección de pedidos
                Text(
                  'Mis Pedidos:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Puedes agregar más widgets aquí para mostrar la información de los pedidos
                SizedBox(height: 20),
                // Widget que muestra más servicios
                Text(
                  'Otros Servicios:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Puedes agregar más widgets aquí para mostrar otros servicios

                // Puedes continuar agregando más secciones según tus necesidades
              ],
            ),
          )),
          MenuFlotante(),
        ],
      ),
    );
  }
}
