import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/widgets/buscador.dart';
import 'package:pcbuilderec/src/widgets/menu.dart';
import 'package:pcbuilderec/src/widgets/menu_flotante.dart';
import 'package:pcbuilderec/src/widgets/side_medu.dart';
import 'package:pcbuilderec/src/widgets/tarjeta_producto.dart';

class Juegos extends StatelessWidget {
  late final GlobalKey<FormState> _formKey;

  Juegos({Key? key}) : super(key: key) {
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      endDrawer: const SideMenuDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 15),
            Column(
              children: [
                Text(
                  'JUEGOS',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      'Buscar',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Buscador(),
                SizedBox(height: 5),
                Text('Proximamente MISO', style: TextStyle(fontSize: 20),)
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MenuFlotante(), 
    );
  }
}
