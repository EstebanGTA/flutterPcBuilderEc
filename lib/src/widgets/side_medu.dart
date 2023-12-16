import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/pages/add_component.dart';
import 'package:pcbuilderec/src/pages/add_pc.dart';
import 'package:pcbuilderec/src/pages/add_producto.dart';
import 'package:pcbuilderec/src/pages/add_products.dart';
import 'package:pcbuilderec/src/pages/login.dart';
import 'package:pcbuilderec/src/widgets/logo.dart';
// Para el Wasa
import 'package:url_launcher/url_launcher.dart';

class SideMenuDrawer extends StatelessWidget implements PreferredSizeWidget {
  const SideMenuDrawer({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF1D1856),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(50),
              child: LogoContainer(url: 'images/logo.png'),
            ),
            _buildDrawerButton(
              icon: Icons.add_box_outlined,
              label: 'Agregar Productos',
              onPressed: () {
                final route =
                    MaterialPageRoute(builder: (car) => AddProducts());
                Navigator.push(context, route);
              },
            ),
            Divider(
              height: 20,
              color: Colors.white,
            ),
            // _buildDrawerButton(
            //   icon: Icons.message,
            //   label: 'Pedidos (WhatsApp)',
            //   onPressed: () {
            //     _launchWhatsAppOne();
            //   },
            // ),
            // Divider(
            //   height: 20,
            //   color: Colors.white,
            // ),
            // _buildDrawerButton(
            //   icon: Icons.account_balance_wallet,
            //   label: 'Billetera',
            //   onPressed: () {
            //     final route =
            //         MaterialPageRoute(builder: (billetera) => Billetera());
            //     Navigator.push(context, route);
            //   },
            // ),
            // Divider(
            //   height: 20,
            //   color: Colors.white,
            // ),
            _buildDrawerButton(
              icon: Icons.headset,
              label: 'Soporte Técnico',
              onPressed: () {
                _launchWhatsAppTwo();
              },
            ),
            Divider(
              height: 20,
              color: Colors.white,
            ),
            _buildDrawerButton(
              icon: Icons.exit_to_app,
              label: 'Cerrar Sesión',
              onPressed: () {
                final route =
                    MaterialPageRoute(builder: (billetera) => LoginPage());
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }

  _launchWhatsAppOne() async {
    // URL del enlace de WhatsApp
    String url = 'https://wa.link/uahkr5';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace de WhatsApp.';
    }
  }

  _launchWhatsAppTwo() async {
    // URL del enlace de WhatsApp
    String url = 'https://wa.link/caq80h';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace de WhatsApp.';
    }
  }

  Widget _buildDrawerButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(
            icon,
            size: 25,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
