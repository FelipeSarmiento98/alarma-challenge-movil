import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import 'poppins_text.dart';

class MainButton extends StatelessWidget {
  final String sLabel;
  final Function() onPressed;
  final Color? backgroundColor; // Color de fondo opcional
  final Color? textColor; // Color del texto opcional

  const MainButton(
      {super.key,
      required this.sLabel,
      required this.onPressed,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ?? ColorsApp.primaryColor, // Usa el color personalizado si está definido
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          fixedSize: sLabel == 'Iniciar sesión'
              ? null // Permite que el ancho se adapte al texto
              : Size(ResponsiveApp.dWidth(312.0), ResponsiveApp.dHeight(40.0)),
          padding: sLabel == 'Iniciar sesión'
              ? EdgeInsets.symmetric(horizontal: ResponsiveApp.dWidth(34.0)) // Agrega padding horizontal
              : null,
        ),
        onPressed: onPressed,
        child: PoppinsText(
          sText: sLabel,
          colorText: textColor ?? ColorsApp.secondaryTextColor, // Usa el color personalizado si está definido
          dFontSize: ResponsiveApp.dSize(14.0),
          fontWeight: FontWeight.w500,
        ));
  }
}