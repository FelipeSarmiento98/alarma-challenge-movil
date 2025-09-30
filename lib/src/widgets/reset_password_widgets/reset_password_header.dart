import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import '../general_widgets/poppins_text.dart';
import '../general_widgets/background_image.dart';
import '../general_widgets/main_back_button.dart';

class ResetPasswordHeader extends StatelessWidget {
  
  const ResetPasswordHeader( { super.key } );

  @override
  Widget build( BuildContext context ) {

    return BackgroundImage(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(
            left: ResponsiveApp.dWidth( 8.0 ),
            right: ResponsiveApp.dWidth( 24.0 ),
            bottom: ResponsiveApp.dHeight( 72.0 )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const MainBackButton(),
              SizedBox( height: ResponsiveApp.dHeight( 88.0 ) ),
              Padding(
                padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 16.0 ) ),
                child: PoppinsText(
                  sText: 'Restablece tu contraseña',
                  dFontSize: ResponsiveApp.dSize( 32.0 ),
                  colorText: ColorsApp.secondaryTextColor,
                  iMaxLines: 2
                ),
              ),
              SizedBox( height: ResponsiveApp.dHeight( 24.0 ) ),
              Padding(
                padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 16.0 ) ),
                child: PoppinsText(
                  sText: 'Ingresa el código de seguridad que recibiste en tu correo electrónico',
                  dFontSize: ResponsiveApp.dSize( 14.0 ),
                  colorText: ColorsApp.secondaryTextColor,
                  iMaxLines: 3
                ),
              )
            ]
          )
        )
      )
    );

  }

}