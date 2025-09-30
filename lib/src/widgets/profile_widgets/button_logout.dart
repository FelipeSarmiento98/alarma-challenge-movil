import 'package:flutter/material.dart';

import '../../pages/login_page.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';
import '../../utils/slide_transition.dart';

import '../general_widgets/poppins_text.dart';

class ButtonLogout extends StatelessWidget {

  const ButtonLogout( { super.key } );

  @override
  Widget build( BuildContext context ) {

    return GestureDetector(
      onTap: () => Navigator.pushAndRemoveUntil(
        context,
        SlidePageRoute( page: const LoginPage() ),
        ( route ) => false
      ),
      child: Container(
        width: ResponsiveApp.dWidth( 360.0 ),
        height: ResponsiveApp.dHeight( 56.0 ),
        color: ColorsApp.closeButtonColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard_return_rounded,
              color: ColorsApp.secondaryTextColor,
              size: ResponsiveApp.dSize( 24.0 )
            ),
            SizedBox( width: ResponsiveApp.dWidth( 8.0 ) ),
            PoppinsText(
              sText: 'Cerrar sesión',
              colorText: ColorsApp.secondaryTextColor,
              dFontSize: ResponsiveApp.dSize( 14.0 ),
              fontWeight: FontWeight.w500
            )
          ]
        )
      )
    );

  }

}