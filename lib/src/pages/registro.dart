import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      fit: StackFit.loose,
      children: [
        Image.asset(
          'images/fondo.jpeg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    card(context),
                    SizedBox(height: 20.0),
                    SizedBox(
                      height: 90.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "¿Ya tienes una cuenta? Inicia sesión",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget card(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/logo.png",
                height: 200,
                width: 200,
              ),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                labelText: "Nombre",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.text,
              obscureText: false,
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese su nombre.';
                } else if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]+$').hasMatch(value)) {
                  return 'Solo se permiten letras en el campo de nombre.';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                labelText: "E-mail",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese su correo electrónico.';
                } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                    .hasMatch(value)) {
                  return 'Por favor, ingrese un correo electrónico válido.';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                labelText: "Contraseña",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, ingrese su contraseña.';
                } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*$').hasMatch(value)) {
                  return 'Debe contener al menos una mayúscula, una minúscula y un número.';
                }
                return null;
              },
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.white),
                labelText: "Repetir Contraseña",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: _confirmPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, repita su contraseña.';
                } else if (value != _passwordController.text) {
                  return 'Las contraseñas no coinciden.';
                }
                return null;
              },
            ),
            buttonIconRound(
              onPressed: () {
                // Validar el formulario antes de mostrar la alerta de éxito
                if (_formKey.currentState?.validate() ?? false) {
                  _showSuccessAlert(context);
                }
              },
              text: "Registrarse",
              colorButton: Color.fromARGB(255, 63, 64, 64),
              colorText: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
  Widget buttonIconRound({
    required void Function()? onPressed,
    required String text,
    IconData? iconData,
    Color colorButton = Colors.white,
    Color colorText = Colors.white,
    Color? colorBorder,
  }) {
    if (colorBorder == null) colorBorder = colorButton;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: ElevatedButton.icon(
        icon: iconData == null ? Container() : Icon(iconData, color: colorText),
        label: Text(
          text,
          style: TextStyle(
            color: colorText,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15.0),
          primary: colorButton,
          onPrimary: Colors.black,
        ),
        onPressed: onPressed,
      ),
    );
  }
  // Función para mostrar la alerta de éxito
  void _showSuccessAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("¡Registro exitoso!"),
          content: Text("Su cuenta ha sido registrada con éxito."),
          actions: [
            TextButton(
              onPressed: () {
                // Limpiar todos los controladores de texto
                _nameController.clear();
                _emailController.clear();
                _passwordController.clear();
                _confirmPasswordController.clear();
                // Cerrar la alerta
                Navigator.of(context).pop();
              },
              child: Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }
}