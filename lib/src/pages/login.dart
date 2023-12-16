import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pcbuilderec/src/pages/inicio.dart';
import 'package:pcbuilderec/src/pages/registro.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    card(context),
                    SizedBox(height: 20.0),
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
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: "Ingrese su correo electrónico",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su correo electrónico.';
                    } else if (!RegExp(
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                        .hasMatch(value)) {
                      return 'Por favor, ingrese un correo electrónico válido.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: "Ingrese su contraseña",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su contraseña.';
                    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*$').hasMatch(value)) {
                      return 'Debe contener al menos una mayúscula, una minúscula y un número.';
                    }
                    return null;
                  },
                ),
              ),
              buttonIconRound(
                onPressed: () {
                  // Validar los campos antes de permitir el inicio de sesión
                  if (_formKey.currentState?.validate() ?? false) {
                    // Realizar la acción de inicio de sesión solo si la validación es exitosa
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InicioPage()),
                    );
                  }
                },
                text: "Ingresar",
                colorButton: Color.fromARGB(255, 63, 64, 64),
                colorText: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistroPage()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Crear cuenta",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistroPage(),
                            ),
                          );
                        },
                    ),
                  ),
                ),
              ),
            ],
          ),
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
          padding: EdgeInsets.all(16.0),
          primary: colorButton,
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
            side: BorderSide(color: colorBorder),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}