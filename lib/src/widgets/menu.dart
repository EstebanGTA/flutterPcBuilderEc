import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/pages/inicio.dart';
import 'package:pcbuilderec/src/widgets/logo.dart';

class Menu extends StatelessWidget implements PreferredSizeWidget {
  const Menu({Key? key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF1D1856),
      title: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => InicioPage()),
          );
        },
        child: Row(
          children: [LogoContainer(url: 'images/logo.png')],
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }
}
