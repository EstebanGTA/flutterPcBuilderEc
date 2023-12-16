import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/pages/add_accesorios.dart';
import 'package:pcbuilderec/src/pages/add_component.dart';
import 'package:pcbuilderec/src/pages/add_licencias.dart';
import 'package:pcbuilderec/src/pages/add_pc.dart';
import 'package:pcbuilderec/src/pages/add_producto.dart';
import 'package:pcbuilderec/src/pages/inicio.dart';
import 'package:pcbuilderec/src/pages/juegos.dart';
import 'package:pcbuilderec/src/widgets/menu.dart';
import 'package:pcbuilderec/src/widgets/menu_flotante.dart';
import 'package:pcbuilderec/src/widgets/side_medu.dart';

class AddProducts extends StatelessWidget {
  const AddProducts({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      endDrawer: const SideMenuDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InicioPage()),
                      );
                    },
                    child: Image.asset(
                      'images/inicio.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Categorías',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Color.fromARGB(255, 31, 31, 31),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  buildCategoryIcons(context),
                ],
              ),
            ),
          ),
          const MenuFlotante(),
        ],
      ),
    );
  }

  Widget buildCategoryIcons(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        buildIconWithText(context, Icons.laptop, 'Laptops', AddProduct()),
        buildIconWithText(context, Icons.desktop_windows, 'PCs', AddPc()),
        buildIconWithText(context, Icons.memory, 'Componentes', AddComponent()),
        buildIconWithText(
            context, Icons.headset, 'Accesorios', AddAccesorios()),
        buildIconWithText(context, Icons.security, 'Licencias', AddLicencias()),
        buildIconWithText(context, Icons.videogame_asset, 'Juegos', Juegos()),
      ],
    );
  }

  Widget buildIconWithText(
      BuildContext context, IconData icon, String text, Widget page) {
    return GestureDetector(
      onTap: () {
        // Navegar a la página correspondiente
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Icon(
                icon,
                size: 100.0,
                color: Color(0xFF1D1856),
              ),
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
