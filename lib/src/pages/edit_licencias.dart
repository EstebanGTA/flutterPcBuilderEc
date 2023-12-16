import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pcbuilderec/services/licencias_service.dart';
import 'package:pcbuilderec/src/widgets/menu.dart';
import 'package:pcbuilderec/src/widgets/menu_flotante.dart';
import 'package:pcbuilderec/src/widgets/side_medu.dart';

class EditLicencias extends StatefulWidget {
  const EditLicencias({Key? key}) : super(key: key);

  @override
  State<EditLicencias> createState() => _EditLicenciasState();
}

class _EditLicenciasState extends State<EditLicencias> {
  // Se utiliza para cada input
  TextEditingController nombreController = TextEditingController(text: '');
  TextEditingController ivaController = TextEditingController(text: '');
  TextEditingController finGarantiaController = TextEditingController(text: '');
  DateTime selectedDate = DateTime.now();
  TextEditingController tipoProductController = TextEditingController(text: '');
  TextEditingController marcaController = TextEditingController(text: '');
  TextEditingController modeloController = TextEditingController(text: '');
  TextEditingController unitarioController = TextEditingController(text: '');
  TextEditingController adquisicionController = TextEditingController(text: '');
  TextEditingController stockController = TextEditingController(text: '');
  TextEditingController urlController = TextEditingController(text: '');
  TextEditingController descripcionController = TextEditingController(text: '');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        finGarantiaController.text = picked.toLocal().toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    nombreController.text = arguments?['nombre'] ?? '';
    descripcionController.text = arguments?['descripcion'] ?? '';
    ivaController.text = arguments?['iva'] ?? '';
    unitarioController.text = arguments?['precio_unitario'] ?? '';
    adquisicionController.text = arguments?['precio_adquisicion'] ?? '';
    stockController.text = arguments?['stock'] ?? '';
    urlController.text = arguments?['imagen'] ?? '';
    marcaController.text = arguments?['marca'] ?? '';
    modeloController.text = arguments?['modelo'] ?? '';
    tipoProductController.text = arguments?['tipo_producto'] ?? '';

    return Scaffold(
      appBar: const Menu(),
      endDrawer: const SideMenuDrawer(),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    TextField(
                      controller: nombreController,
                      decoration: const InputDecoration(
                        hintText: 'Nuevo nompre del Producto',
                      ),
                    ),
                    TextField(
                      controller: ivaController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Iva',
                      ),
                    ),
                    TextField(
                      controller: finGarantiaController,
                      decoration: const InputDecoration(
                        hintText: 'Fin de la garantía',
                      ),
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                    TextField(
                      controller: tipoProductController,
                      decoration: const InputDecoration(
                        hintText: 'Tipo producto',
                      ),
                    ),
                    TextField(
                      controller: marcaController,
                      decoration: const InputDecoration(
                        hintText: 'Marca',
                      ),
                    ),
                    TextField(
                      controller: modeloController,
                      decoration: const InputDecoration(
                        hintText: 'Modelo',
                      ),
                    ),
                    TextField(
                      controller: unitarioController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Precio unitario',
                      ),
                    ),
                    TextField(
                      controller: adquisicionController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Precio adquisición',
                      ),
                    ),
                    TextField(
                      controller: stockController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Stock',
                      ),
                    ),
                    TextField(
                      controller: urlController,
                      decoration: const InputDecoration(
                        hintText: 'Imagen',
                      ),
                    ),
                    TextField(
                      controller: descripcionController,
                      decoration: const InputDecoration(
                        hintText: 'Descripción del Producto',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_validateFields()) {
                            DateTime finGarantia =
                                DateTime.parse(finGarantiaController.text);
                            await updateProductLicencias(
                              arguments?['uid'],
                              nombreController.text,
                              descripcionController.text,
                              int.parse(ivaController.text),
                              finGarantia,
                              int.parse(unitarioController.text),
                              int.parse(adquisicionController.text),
                              int.parse(stockController.text),
                              urlController.text,
                              marcaController.text,
                              modeloController.text,
                              tipoProductController.text,
                            ).then((_) {
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: const Text('Actualizar')),
                  ],
                ),
              ),
            ],
          )),
        ),
        const MenuFlotante(),
      ]),
    );
  }

  bool _validateFields() {
    if (nombreController.text.isEmpty ||
        ivaController.text.isEmpty ||
        finGarantiaController.text.isEmpty ||
        tipoProductController.text.isEmpty ||
        marcaController.text.isEmpty ||
        modeloController.text.isEmpty ||
        unitarioController.text.isEmpty ||
        adquisicionController.text.isEmpty ||
        stockController.text.isEmpty ||
        urlController.text.isEmpty ||
        descripcionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todos los campos son obligatorios')),
      );
      return false;
    }
    return true;
  }
}
