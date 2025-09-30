import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import 'poppins_text.dart';

class MainBackButton extends StatelessWidget {
  
  const MainBackButton( { super.key } );

  @override
  Widget build( BuildContext context ) {

    return TextButton.icon(
      onPressed: () => Navigator.pop( context ),
      label: PoppinsText(
        sText: 'Volver',
        dFontSize: ResponsiveApp.dSize( 13.0 ),
        colorText: ColorsApp.secondaryTextColor
      ),
      icon: Icon(
        Icons.arrow_back_rounded,
        color: ColorsApp.secondaryTextColor,
        size: ResponsiveApp.dSize( 24.0 )
      )
    );

  }

}