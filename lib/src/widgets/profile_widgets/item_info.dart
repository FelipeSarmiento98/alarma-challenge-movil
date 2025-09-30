import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';
import '../general_widgets/poppins_text.dart';

class ItemInfo extends StatelessWidget {

  final IconData icon;
  final String sText;

  const ItemInfo(
    {
      super.key,
      required this.icon,
      required this.sText
    }
  );

  @override
  Widget build( BuildContext context ) {

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 24.0 ), vertical: ResponsiveApp.dHeight( 8.0 ) ),
      child: Row(
        children: [
          Container(
            width: ResponsiveApp.dSize( 32.0 ),
            height: ResponsiveApp.dSize( 32.0 ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsApp.primaryColor.withValues( alpha: 0.1 )
            ),
            child: Icon(
              icon,
              color: ColorsApp.primaryColor,
              size: ResponsiveApp.dSize( 20.0 )
            )
          ),
          SizedBox( width: ResponsiveApp.dWidth( 8.0 ) ),
          Expanded(
            child: PoppinsText(
              sText: sText,
              dFontSize: ResponsiveApp.dSize( 14.0 ),
              colorText: ColorsApp.textColor
            )
          )
        ]
      )
    );

  }

}