import 'package:flutter/material.dart';

class Buscador extends StatelessWidget implements PreferredSizeWidget {
  const Buscador({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nombre del producto:',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
