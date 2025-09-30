import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/circular_transition.dart';
import '../utils/responsive_app.dart';

import '../widgets/login_widgets/login_header.dart';
import '../widgets/general_widgets/main_button.dart';
import '../widgets/general_widgets/text_field_forms.dart';
import '../widgets/login_widgets/reset_password_button.dart';

import 'splash_page.dart';

class LoginPage extends StatefulWidget {

  final bool showPassword;

  const LoginPage( { super.key, this.showPassword = false } );

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  final controllerEmail = TextEditingController();

  final controllerPassword = TextEditingController();

  final controllerCode = TextEditingController(); // Controlador exclusivo para el campo de código

  final _formKey = GlobalKey<FormState>();

  bool bEmailError = false;
  bool bPassError = false;
  bool showPasswordField = false; // Add a state variable to control visibility
  bool showCodeField = false; // Nueva variable para controlar la visibilidad del campo de código

  @override
  void initState() {
    super.initState();
    if (widget.showPassword) {
      showPasswordField = true;
    }
  }

  @override
  Widget build( BuildContext context ) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFEFDE5),
                Color(0xFFFAFAEC),
              ],
            ),
          ),
          child: Center( // Wrap the entire content in a Center widget to ensure horizontal centering
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Adjust size to fit content
                  children: [
                    const LoginHeader(),
                    Stack(
                      children: [
                        Container(
                          width: ResponsiveApp.dWidth(360.0),
                          height: ResponsiveApp.dHeight(412.0),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/background2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align( // Center the Column inside the Stack
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: ResponsiveApp.dHeight(96.0)),
                              if (!showCodeField) ...[
                                TextFieldForms(
                                  controller: controllerEmail,
                                  sLabel: 'Número de Teléfono', // Cambiado de 'Correo electrónico'
                                  keyboardType: TextInputType.phone, // Configura el teclado numérico
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly, // Acepta solo números
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      setState(() => bEmailError = true);
                                      return 'Por favor ingresa un número de teléfono'; // Mensaje actualizado
                                    }
                                    return null;
                                  },
                                  bError: bEmailError,
                                ),
                              ],
                              if (showPasswordField && !showCodeField) ...[
                                SizedBox(height: ResponsiveApp.dHeight(32.0)),
                                TextFieldForms(
                                  controller: controllerPassword, // Controlador exclusivo para la contraseña
                                  sLabel: 'Contraseña',
                                  bIsPassword: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      setState(() => bPassError = true);
                                      return 'Por favor ingresa un valor';
                                    }
                                    return null;
                                  },
                                  bError: bPassError,
                                ),
                                SizedBox(height: ResponsiveApp.dHeight(4.0)),
                                ResetPasswordButton(),
                              ],
                              if (showCodeField) ...[
                                SizedBox(height: ResponsiveApp.dHeight(32.0)),
                                TextFieldForms(
                                  controller: controllerCode, // Controlador exclusivo para el código
                                  sLabel: 'Código',
                                  keyboardType: TextInputType.number, // Configura el teclado numérico
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly, // Acepta solo números
                                    LengthLimitingTextInputFormatter(6), // Limita a 6 caracteres
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty || value.length != 6) {
                                      setState(() => bPassError = true);
                                      return 'Por favor ingresa un código de 6 dígitos';
                                    }
                                    return null;
                                  },
                                  bError: bPassError,
                                  textStyle: GoogleFonts.poppins( // Usa la nueva propiedad textStyle
                                    letterSpacing: 8.0, // Agrega más separación entre caracteres
                                    color: Colors.black, // Cambié a un color definido directamente
                                    fontSize: ResponsiveApp.dSize(14.0),
                                  ),
                                ),
                              ],
                              SizedBox(
                                height: ResponsiveApp.dHeight(34.0), // Ajuste para mantener la altura consistente
                              ),
                              MainButton(
                                sLabel: showCodeField ? 'Confirmar' : (showPasswordField ? 'Iniciar sesión' : 'Siguiente'),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (!showPasswordField) {
                                      setState(() => showPasswordField = true);
                                    } else if (!showCodeField) {
                                      setState(() => showCodeField = true);
                                    } else {
                                      Navigator.pushReplacement(
                                        context,
                                        CircularTransition(page: const SplashPage()),
                                      );
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}