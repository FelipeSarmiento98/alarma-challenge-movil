import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import 'poppins_text.dart';

class EmptyState extends StatelessWidget {

  const EmptyState( { super.key } );

  @override
  Widget build( BuildContext context ) {

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 24.0 ) ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset( 
            'assets/images/empty_state.png',
            height: ResponsiveApp.dHeight( 240.0 ),
            color: ColorsApp.primaryLightColor.withOpacity(0.5),
            colorBlendMode: BlendMode.srcATop
          ),
          SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
          PoppinsText(
            sText: 'No has creado ninguna alarma, por el momento',
            colorText: ColorsApp.textColor,
            dFontSize: ResponsiveApp.dSize( 14.0 ),
            iMaxLines: 4,
            textAlign: TextAlign.center
          )
        ]
      )
    );

  }

}