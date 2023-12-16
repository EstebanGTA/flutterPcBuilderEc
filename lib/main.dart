import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/pages/accesorios.dart';
import 'package:pcbuilderec/src/pages/add_accesorios.dart';
import 'package:pcbuilderec/src/pages/add_component.dart';
import 'package:pcbuilderec/src/pages/add_licencias.dart';
import 'package:pcbuilderec/src/pages/add_pc.dart';
import 'package:pcbuilderec/src/pages/add_producto.dart';
import 'package:pcbuilderec/src/pages/add_products.dart';
import 'package:pcbuilderec/src/pages/componentes.dart';
import 'package:pcbuilderec/src/pages/edit_accesorios.dart';
import 'package:pcbuilderec/src/pages/edit_componentes.dart';
import 'package:pcbuilderec/src/pages/edit_licencias.dart';
import 'package:pcbuilderec/src/pages/edit_pc.dart';
import 'package:pcbuilderec/src/pages/edit_product.dart';
import 'package:pcbuilderec/src/pages/inicio.dart';
import 'package:pcbuilderec/src/pages/juegos.dart';
import 'package:pcbuilderec/src/pages/laptop.dart';
import 'package:pcbuilderec/src/pages/licencias.dart';
import 'package:pcbuilderec/src/pages/login.dart';
import 'package:pcbuilderec/src/pages/mi_perfil.dart';
import 'package:pcbuilderec/src/pages/pc.dart';
import 'package:pcbuilderec/src/pages/registro.dart';
// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PcBuilderEc',
      debugShowCheckedModeBanner: false,
      initialRoute: "Inicio",
      routes: {
        "Inicio": (context) => InicioPage(),
        "login": (context) => LoginPage(),
        "registro": (context) => RegistroPage(),
        // "carrito": (context) => CarritoCompras(),
        "laptop": (context) => LaptopBD(),
        // "billetera":(context)  => Billetera(),
        "Pc": (context) => PcBD(),
        "Componentes": (context) => ComponentesBD(),
        "Accesorios": (context) => AccesoriosBD(),
        "Licencias": (context) => LicenciasBD(),
        "Juegos": (context) => Juegos(),
        "Perfil": (context) => MiPerfil(),
        // Rutas para agregar los productos a cada uno
        "addAdmin": (context) => AddProducts(),
        "add": (context) => AddProduct(),
        "addPc": (context) => AddPc(),
        "addComponent": (context) => AddComponent(),
        "addAccesorios": (context) => AddAccesorios(),
        "addLicencias": (context) => AddLicencias(),
        // Rutas para editar los productos
        "editProduct": (context) => const EditProduct(),
        "editPc": (context) => const EditPc(),
        "editComponent": (context) => const EditComponent(),
        "editAccesorio": (context) => const EditAccesorios(),
        "editLicencia": (context) => const EditLicencias(),
      },
    );
  }
}
