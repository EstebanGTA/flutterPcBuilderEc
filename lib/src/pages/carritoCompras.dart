import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/widgets/menu.dart';
import 'package:pcbuilderec/src/widgets/menu_flotante.dart';
import 'package:pcbuilderec/src/widgets/product_car.dart';
import 'package:pcbuilderec/src/widgets/side_medu.dart';

class CarritoCompras extends StatelessWidget {
  const CarritoCompras({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 75,
                          color: Colors.black,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tu carrito de compras está vacío',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Agrega productos para tu setup Gaming..!',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 6,
                    color: Color(0xFF443F85),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            30.0), 
                    child: Text(
                      'Sigue explorando',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const ProductCar(),
          const MenuFlotante(),
        ],
      ),
    );
  }
}
