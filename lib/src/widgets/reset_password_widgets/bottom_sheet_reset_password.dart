import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../pages/reset_password_page.dart';
import '../../pages/login_page.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';
import '../../utils/slide_transition.dart';
import '../../utils/circular_transition.dart';

import '../general_widgets/main_button.dart';
import '../general_widgets/poppins_text.dart';
import '../general_widgets/text_field_forms.dart';
import '../general_widgets/title_bottom_sheet.dart';

class BottomSheetResetPassword extends StatefulWidget {

  const BottomSheetResetPassword( { super.key } );

  @override
  State<BottomSheetResetPassword> createState() => _BottomSheetResetPasswordState();

}

class _BottomSheetResetPasswordState extends State<BottomSheetResetPassword> {

  final emailController = TextEditingController();
  final codeController = TextEditingController(); // Controlador para el campo de código

  final _formKey = GlobalKey<FormState>();

  bool bError = false;

  @override
  Widget build( BuildContext context ) {

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
      padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 24.0 ) ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleBottomSheet( sTitle: 'Recuperar contraseña' ),
          SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
          PoppinsText(
            sText: 'Enviaremos un código a tu télefono para que puedas cambiar tu contraseña',
            dFontSize: ResponsiveApp.dSize( 13.0 ),
            colorText: ColorsApp.textColor,
            iMaxLines: 4
          ),
          Padding(
            padding: EdgeInsets.symmetric( vertical: ResponsiveApp.dHeight( 40.0 ) ),
            child: Form(
              key: _formKey,
              child: TextFieldForms(
                sLabel: 'Número de Teléfono', // Cambiado para reflejar el propósito
                controller: emailController,
                keyboardType: TextInputType.phone, // Configura el teclado numérico
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Acepta solo números
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    setState(() => bError = true);
                    return 'Por favor ingresa un número de teléfono';
                  }
                  return null;
                },
                bError: bError
              )
            )
          ),
          MainButton(
            textColor: ColorsApp.primaryColor,
            backgroundColor: ColorsApp.primaryLightColor,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context); // Cierra el BottomSheet anterior
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true, // Permite que el BottomSheet se expanda con el teclado
                  isDismissible: false, // Evita que se cierre al hacer clic fuera del BottomSheet
                  builder: (BuildContext context) {
                    return SingleChildScrollView( // Permite que el contenido sea desplazable si es necesario
                      child: Container(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom, // Ajusta el espacio para el teclado
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white, // Fondo blanco para mantener consistencia
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: ResponsiveApp.dWidth(24.0)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  PoppinsText(
                                    sText: 'Restablecer contraseña',
                                    dFontSize: ResponsiveApp.dSize(16.0),
                                    colorText: ColorsApp.secondaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Cierra el segundo BottomSheet
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        isDismissible: false,
                                        builder: (BuildContext context) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(horizontal: ResponsiveApp.dWidth(24.0)),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const TitleBottomSheet(sTitle: 'Recuperar contraseña'),
                                                SizedBox(height: ResponsiveApp.dHeight(32.0)),
                                                PoppinsText(
                                                  sText: 'Enviaremos un código a tu télefono para que puedas cambiar tu contraseña',
                                                  dFontSize: ResponsiveApp.dSize(13.0),
                                                  colorText: ColorsApp.textColor,
                                                  iMaxLines: 4,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(vertical: ResponsiveApp.dHeight(40.0)),
                                                  child: Form(
                                                    key: _formKey,
                                                    child: TextFieldForms(
                                                      sLabel: 'Número de Teléfono',
                                                      controller: emailController,
                                                      keyboardType: TextInputType.phone,
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter.digitsOnly,
                                                      ],
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          setState(() => bError = true);
                                                          return 'Por favor ingresa un número de teléfono';
                                                        }
                                                        return null;
                                                      },
                                                      bError: bError,
                                                    ),
                                                  ),
                                                ),
                                                MainButton(
                                                  sLabel: 'Enviar código',
                                                  backgroundColor: ColorsApp.primaryLightColor,
                                                  textColor: ColorsApp.primaryColor,
                                                  onPressed: () {
                                                    if (_formKey.currentState!.validate()) {
                                                      Navigator.pop(context);
                                                      showModalBottomSheet(
                                                        context: context,
                                                        isScrollControlled: true,
                                                        isDismissible: false,
                                                        builder: (BuildContext context) {
                                                          return SingleChildScrollView(
                                                            child: Container(
                                                              padding: EdgeInsets.only(
                                                                bottom: MediaQuery.of(context).viewInsets.bottom,
                                                              ),
                                                              decoration: const BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(16.0),
                                                                  topRight: Radius.circular(16.0),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets.symmetric(horizontal: ResponsiveApp.dWidth(24.0)),
                                                                child: Column(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        PoppinsText(
                                                                          sText: 'Restablecer contraseña',
                                                                          dFontSize: ResponsiveApp.dSize(16.0),
                                                                          colorText: ColorsApp.secondaryColor,
                                                                          fontWeight: FontWeight.w500,
                                                                        ),
                                                                        ElevatedButton(
                                                                          onPressed: () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          style: ElevatedButton.styleFrom(
                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                                                                            backgroundColor: ColorsApp.closeButtonColor,
                                                                            minimumSize: Size(ResponsiveApp.dSize(40.0), ResponsiveApp.dSize(40.0)),
                                                                            padding: const EdgeInsets.all(0.0),
                                                                          ),
                                                                          child: Icon(
                                                                            Icons.close_rounded,
                                                                            size: ResponsiveApp.dSize(18.0),
                                                                            color: ColorsApp.primaryColor,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(height: ResponsiveApp.dHeight(32.0)),
                                                                    PoppinsText(
                                                                      sText: 'Ingresa el código que hemos enviado a tu teléfono',
                                                                      dFontSize: ResponsiveApp.dSize(13.0),
                                                                      colorText: ColorsApp.textColor,
                                                                      iMaxLines: 4,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: ResponsiveApp.dHeight(40.0)),
                                                                      child: Form(
                                                                        child: TextFieldForms(
                                                                          controller: codeController,
                                                                          sLabel: 'Código',
                                                                          keyboardType: TextInputType.number,
                                                                          inputFormatters: [
                                                                            FilteringTextInputFormatter.digitsOnly,
                                                                            LengthLimitingTextInputFormatter(6),
                                                                          ],
                                                                          validator: (value) {
                                                                            if (value!.isEmpty || value.length != 6) {
                                                                              return 'Por favor ingresa un código válido';
                                                                            }
                                                                            return null;
                                                                          },
                                                                          bError: false,
                                                                          autofocus: true,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    MainButton(
                                                                      sLabel: 'Confirmar',
                                                                      backgroundColor: ColorsApp.primaryLightColor,
                                                                      textColor: ColorsApp.primaryColor,
                                                                      onPressed: () {
                                                                        Navigator.push(
                                                                          context,
                                                                          SlidePageRoute(page: const ResetPasswordPage()),
                                                                        );
                                                                      },
                                                                    ),
                                                                    SizedBox(height: ResponsiveApp.dHeight(32.0)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                  },
                                                ),
                                                SizedBox(height: ResponsiveApp.dHeight(32.0)),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                                      backgroundColor: ColorsApp.closeButtonColor,
                                      minimumSize: Size(ResponsiveApp.dSize(40.0), ResponsiveApp.dSize(40.0)),
                                      padding: const EdgeInsets.all(0.0),
                                    ),
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: ResponsiveApp.dSize(18.0),
                                      color: ColorsApp.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: ResponsiveApp.dHeight(32.0)),
                              PoppinsText(
                                sText: 'Ingresa el código que hemos enviado a tu teléfono',
                                dFontSize: ResponsiveApp.dSize(13.0),
                                colorText: ColorsApp.textColor, // Color del texto consistente
                                iMaxLines: 4,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: ResponsiveApp.dHeight(40.0)),
                                child: Form(
                                  child: TextFieldForms(
                                    controller: codeController,
                                    sLabel: 'Código',
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(6),
                                    ],
                                    validator: (value) {
                                      if (value!.isEmpty || value.length != 6) {
                                        return 'Por favor ingresa un código válido';
                                      }
                                      return null;
                                    },
                                    bError: false,
                                    autofocus: true, // Asegura que el campo tenga el foco
                                  ),
                                ),
                              ),
                              MainButton(
                                sLabel: 'Confirmar',
                                backgroundColor: ColorsApp.primaryLightColor, // Color del botón consistente
                                textColor: ColorsApp.primaryColor, // Color del texto del botón consistente
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        'Contraseña recuperada exitosamente',
                                        style: GoogleFonts.poppins(color: Colors.white),
                                      ),
                                    ),
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    CircularTransition(page: const LoginPage(showPassword: true)),
                                  );
                                },
                              ),
                              SizedBox(height: ResponsiveApp.dHeight(32.0)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
            sLabel: 'Enviar código'
          ),
          SizedBox( height: ResponsiveApp.dHeight( 32.0 ) )
        ]
      )
    )
  );
  
  }
}