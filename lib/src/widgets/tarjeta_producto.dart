import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/pages/edit_product.dart';

class ProductCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String name;
  final String price;

  const ProductCardWidget({
    required this.imagePath,
    required this.title,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.0, bottom: 20.0, left: 60, right: 60),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        color: Color(0xFF443F85),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Image.network(
              imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 100.0),
                      GestureDetector(
                        onTap: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProduct(),),
                          );
                        }),
                        child: Icon(
                          Icons.edit,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Acción al presionar el botón
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     padding: EdgeInsets.symmetric(
                  //         vertical: 16.0, horizontal: 40.0),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
                  //     primary: Colors.black,
                  //   ),
                  //   child: Text(
                  //     'Comprar',
                  //     style: TextStyle(fontSize: 20.0),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
