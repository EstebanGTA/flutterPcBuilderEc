import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/pages/add_products.dart';
import 'package:pcbuilderec/src/pages/inicio.dart';
import 'package:pcbuilderec/src/pages/mi_perfil.dart';

class MenuFlotante extends StatelessWidget implements PreferredSizeWidget {
  const MenuFlotante({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF1D1856),
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIconButton(context, Icons.home, InicioPage()),
          // buildIconButton(context, Icons.shopping_cart_sharp, "carrito"),
          buildIconButton(context, Icons.add, AddProducts()),
        ],
      ),
    );
  }
  Widget buildIconButton(BuildContext context, IconData icon, Widget page) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
        size: 30.0,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
