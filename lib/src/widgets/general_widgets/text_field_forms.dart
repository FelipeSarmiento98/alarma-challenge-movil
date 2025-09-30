import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import 'poppins_text.dart';

class TextFieldForms extends StatefulWidget {

  final TextEditingController controller;
  final bool bIsPassword;
  final bool bEnabled;
  final bool bError;
  final String sLabel;
  final double dWidth;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType; // Nueva propiedad para el tipo de teclado
  final List<TextInputFormatter>? inputFormatters; // Nueva propiedad para los formateadores de entrada
  final TextStyle? textStyle; // Nueva propiedad para personalizar el estilo del texto
  final bool autofocus; // Nueva propiedad para habilitar el enfoque automático

  const TextFieldForms(
    {
      super.key,
      required this.controller,
      required this.sLabel,
      this.validator,
      this.dWidth = 312.0,
      this.bIsPassword = false,
      this.bEnabled = true,
      this.bError = false,
      this.keyboardType,
      this.inputFormatters,
      this.textStyle,
      this.autofocus = false, // Valor predeterminado en false
    }
  );

  @override
  State<TextFieldForms> createState() => _TextFieldFormsState();
}

class _TextFieldFormsState extends State<TextFieldForms> {

  bool bObscure = true;

  @override
  Widget build( BuildContext context ) {

    return SizedBox(
      width: ResponsiveApp.dWidth( widget.dWidth ),
      child: TextFormField(
        validator: widget.validator,
        enabled: widget.bEnabled,
        controller: widget.controller,
        obscureText: widget.bIsPassword ? bObscure : false,
        keyboardType: widget.keyboardType, // Configura el tipo de teclado
        inputFormatters: widget.inputFormatters, // Configura los formateadores de entrada
        style: widget.textStyle ?? GoogleFonts.poppins( // Usa el estilo personalizado si está definido
          color: ColorsApp.secondaryColor,
          fontSize: ResponsiveApp.dSize(14.0),
        ),
        autofocus: widget.autofocus, // Configura el enfoque automático si está habilitado
        decoration: InputDecoration(
          filled: true, // Enable background fill
          fillColor: Colors.white.withOpacity(0.9), // Set background color to white with 90% opacity
          contentPadding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 16.0 ), vertical: ResponsiveApp.dHeight( 18.0 ) ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Cambié el radio de los bordes a 8.0
            borderSide: const BorderSide( color: ColorsApp.borderColor)
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Cambié el radio de los bordes a 8.0
            borderSide: const BorderSide( color: ColorsApp.borderColor)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Cambié el radio de los bordes a 8.0
            borderSide: const BorderSide( color: ColorsApp.borderColor)
          ),
          errorStyle: GoogleFonts.poppins(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Cambié el radio de los bordes a 8.0
            borderSide: const BorderSide( color: ColorsApp.secondaryColor, width: 3.0 )
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Cambié el radio de los bordes a 8.0
            borderSide: const BorderSide( color: ColorsApp.secondaryColor, width: 3.0 )
          ),
          label: PoppinsText(
            sText: widget.sLabel,
            dFontSize: ResponsiveApp.dSize( 13.0 ),
            colorText: ColorsApp.textColor
          ),
          suffixIcon: widget.bIsPassword ? IconButton(
            onPressed: () => setState(() => bObscure = !bObscure ),
            icon: Icon(
              bObscure ? Icons.visibility_off : Icons.visibility,
              color: ColorsApp.primaryColor
            )
          ) : widget.bError ? Icon(
            Icons.error_rounded,
            color: ColorsApp.errorColor,
            size: ResponsiveApp.dSize( 24.0 )
          ) : const SizedBox()
        )
      )
    );

  }
}