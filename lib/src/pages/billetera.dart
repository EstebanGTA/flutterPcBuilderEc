import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/widgets/menu.dart';
import 'package:pcbuilderec/src/widgets/menu_flotante.dart';
import 'package:pcbuilderec/src/widgets/side_medu.dart';

class Billetera extends StatelessWidget {
  const Billetera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      endDrawer: const SideMenuDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Saldo no Disponible',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'No se encontraron valores',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 6,
                  color: Color(0xFF443F85),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Historial',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        size: 100.0,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Tu billetera está vacía.',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const MenuFlotante(),
        ],
      ),
    );
  }
}
