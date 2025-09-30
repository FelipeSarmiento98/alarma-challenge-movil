import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import 'poppins_text.dart';

class TextButtonAddress extends StatelessWidget {

  final IconData icon;
  final String sLabel;

  const TextButtonAddress(
    {
      super.key,
      required this.icon,
      required this.sLabel
    }
  );

  @override
  Widget build( BuildContext context ) {

    return TextButton.icon(
      onPressed: () {},
      style: TextButton.styleFrom(
        overlayColor: ColorsApp.primaryColor.withValues( alpha: 0.2 ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular( 12.0 )
        )
      ),
      label: PoppinsText(
        sText: sLabel,
        dFontSize: ResponsiveApp.dSize( 14.0 ),
        colorText: ColorsApp.textColor
      ),
      icon: Icon(
        icon,
        color: ColorsApp.textColor,
        size: ResponsiveApp.dSize( 24.0 )
      )
    );

  }

}