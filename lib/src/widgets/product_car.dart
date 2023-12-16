import 'package:flutter/material.dart';

class ProductCar extends StatelessWidget implements PreferredSizeWidget {
  const ProductCar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.all(50.0),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        color: Color(0xFF443F85),
        child: Column(
          children: [
            Image.network(
              'images/logo.png',
              width: 200,
              height: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Text(
                    'LAPTOP LENOVO IP S145-14API AMD 3020E 1.2GHZ-4GB-500GB-BLACK-14"HD-W10',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      'Agregar al Carrito',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
