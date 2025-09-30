import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import '../general_widgets/poppins_text.dart';
import '../general_widgets/background_image.dart';

class LoginHeader extends StatelessWidget {
  
  const LoginHeader( { super.key } );

  @override
  Widget build( BuildContext context ) {

    return BackgroundImage(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 24.0 ), bottom: ResponsiveApp.dHeight( 72.0 ) ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: ResponsiveApp.dHeight( 56.0 )
              ),
              SizedBox( height: ResponsiveApp.dHeight( 24.0 ) ),
              PoppinsText(
                sText: 'Bienvenido',
                dFontSize: ResponsiveApp.dSize( 32.0 ),
                colorText: ColorsApp.secondaryTextColor
              ),
              SizedBox( height: ResponsiveApp.dHeight( 8.0 ) ),
              PoppinsText(
                sText: 'Inicia sesión para continuar',
                dFontSize: ResponsiveApp.dSize( 14.0 ),
                colorText: ColorsApp.secondaryTextColor
              )
            ]
          )
        )
      )
    );

  }

}