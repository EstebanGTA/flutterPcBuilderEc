import 'package:flutter/material.dart';
import 'package:pcbuilderec/services/accesorios_service.dart';
import 'package:pcbuilderec/src/widgets/buscador.dart';
import 'package:pcbuilderec/src/widgets/menu.dart';
import 'package:pcbuilderec/src/widgets/menu_flotante.dart';
import 'package:pcbuilderec/src/widgets/side_medu.dart';
import 'package:pcbuilderec/src/widgets/tarjeta_producto.dart';

class AccesoriosBD extends StatefulWidget {
  const AccesoriosBD({
    Key? key,
  }) : super(key: key);

  @override
  State<AccesoriosBD> createState() => _AccesoriosBDState();
}

class _AccesoriosBDState extends State<AccesoriosBD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      endDrawer: const SideMenuDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'ACCESORIOS',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Center(
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
          Expanded(
            child: FutureBuilder(
              future: getProductAccesorios(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error al cargar los datos'),
                  );
                } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No hay datos disponibles'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            ProductCardWidget(
                              imagePath: 'images/laptop1.PNG',
                              name: snapshot.data![index]['descripcion'] ??
                                  'Nombre Predeterminado',
                              title: snapshot.data![index]['nombre'] ??
                                  'Nombre Predeterminado',
                              price:
                                  '\$${snapshot.data![index]['precio_unitario'] ?? 'Precio Predeterminado'}',
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  await Navigator.pushNamed(
                                      context, 'editAccesorio',
                                      arguments: {
                                        'uid': snapshot.data![index]['uid'],
                                        'nombre': snapshot.data![index]
                                            ['nombre'],
                                        'descripcion': snapshot.data![index]
                                            ['descripcion'],
                                        'iva':
                                            '${snapshot.data![index]['iva']}',
                                        'precio_unitario':
                                            '${snapshot.data![index]['precio_unitario']}',
                                        'precio_adquisicion':
                                            '${snapshot.data![index]['precio_adquisicion']}',
                                        'stock':
                                            '${snapshot.data![index]['stock']}',
                                        'imagen': snapshot.data![index]
                                            ['imagen'],
                                        'marca': snapshot.data![index]['marca'],
                                        'modelo': snapshot.data![index]
                                            ['modelo'],
                                        'tipo_producto': snapshot.data![index]
                                            ['tipo_producto'],
                                      });
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .blue, // Puedes ajustar el color según tus preferencias
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.edit,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: MenuFlotante(),
    );
  }
}
