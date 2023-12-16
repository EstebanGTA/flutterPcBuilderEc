import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/pages/laptop.dart';
import 'package:pcbuilderec/src/pages/licencias.dart';
import 'package:pcbuilderec/src/pages/pc.dart';
import 'package:pcbuilderec/src/pages/componentes.dart';
import 'package:pcbuilderec/src/pages/accesorios.dart';
import 'package:pcbuilderec/src/pages/juegos.dart';
import 'package:pcbuilderec/src/widgets/menu.dart';
import 'package:pcbuilderec/src/widgets/menu_flotante.dart';
import 'package:pcbuilderec/src/widgets/side_medu.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key});

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
                  buildCategoryImages(context),
                ],
              ),
            ),
          ),
          const MenuFlotante(),
        ],
      ),
    );
  }

  Widget buildCategoryImages(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        buildImageWithText(context, 'images/laptop.PNG', 'Laptops', LaptopBD()),
        buildImageWithText(context, 'images/pc.PNG', 'PCs', PcBD()),
        buildImageWithText(
            context, 'images/componentes.PNG', 'Componentes', ComponentesBD()),
        buildImageWithText(
            context, 'images/accesorios.PNG', 'Accesorios', AccesoriosBD()),
        buildImageWithText(context, 'images/licencias.jpeg',
            'Licencias / Antivirus', LicenciasBD()),
        buildImageWithText(context, 'images/juegos.jpg', 'Juegos', Juegos()),
      ],
    );
  }

  Widget buildImageWithText(
      BuildContext context, String imagePath, String text, Widget page) {
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
              child: Image.asset(
                imagePath,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
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
