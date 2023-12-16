import 'package:cloud_firestore/cloud_firestore.dart';

// Este es el aparatdo de las Licencias y antivirus
FirebaseFirestore db = FirebaseFirestore.instance;

// Obtener la lista de Licencias
Future<List> getProductLicencias() async {
  List product = [];
  CollectionReference collectionReference = db.collection('licencias_antivirus');

  QuerySnapshot queryProduct = await collectionReference.get();

  for (var doc in queryProduct.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final licencias = {
      'uid': doc.id,
      'nombre': data['nombre'],
      'descripcion': data['descripcion'],
      'iva': data['iva'],
      'fin_garantia': data['fin_garantia'],
      'precio_unitario': data['precio_unitario'],
      'precio_adquisicion': data['precio_adquisicion'],
      'stock': data['stock'],
      'imagen': data['imagen'],
      'marca': data['marca'],
      'modelo': data['modelo'],
      'tipo_producto': data['tipo_producto'],
    };
    product.add(licencias);
  }

  return product;
}

// Enviar un producto a Licencias
Future<void> addProductLicencias(
    String nombre,
    String descripcion,
    int iva,
    DateTime finGarantia,
    int unitario,
    int adquisicion,
    int stock,
    String url,
    String marca,
    String modelo,
    String tipoProduct) async {
  await db.collection('licencias_antivirus').add({
    'nombre': nombre,
    'descripcion': descripcion,
    'iva': iva,
    'fin_garantia': finGarantia,
    'precio_unitario': unitario,
    'precio_adquisicion': adquisicion,
    'stock': stock,
    'imagen': url,
    'marca': marca,
    'modelo': modelo,
    'tipo_producto': tipoProduct
  });
}

// Editar un producto de Licencias
Future<void> updateProductLicencias(
    String uid,
    String nombre,
    String descripcion,
    int iva,
    DateTime finGarantia,
    int unitario,
    int adquisicion,
    int stock,
    String url,
    String marca,
    String modelo,
    String tipoProduct) async {
  await db.collection('licencias_antivirus').doc(uid).set({
    'nombre': nombre,
    'descripcion': descripcion,
    'iva': iva,
    'fin_garantia': finGarantia,
    'precio_unitario': unitario,
    'precio_adquisicion': adquisicion,
    'stock': stock,
    'imagen': url,
    'marca': marca,
    'modelo': modelo,
    'tipo_producto': tipoProduct
  });
}

