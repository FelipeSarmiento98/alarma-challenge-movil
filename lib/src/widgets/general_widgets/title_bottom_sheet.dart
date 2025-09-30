import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';
import 'poppins_text.dart';

class TitleBottomSheet extends StatelessWidget {

  final String sTitle;

  const TitleBottomSheet( { super.key, required this.sTitle } );

  @override
  Widget build( BuildContext context ) {

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric( vertical: ResponsiveApp.dHeight( 16.0 ) ),
          child: Container(
            width: ResponsiveApp.dWidth( 32.0 ),
            height: ResponsiveApp.dHeight( 4.0 ),
            decoration: BoxDecoration(
              color: ColorsApp.borderColor,
              borderRadius: BorderRadius.circular( 100.0 )
            )
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PoppinsText(
              sText: sTitle,
              dFontSize: ResponsiveApp.dSize( 16.0 ),
              colorText: ColorsApp.secondaryColor,
              fontWeight: FontWeight.w500
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop( context ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular( 8.0 ) ),
                backgroundColor: ColorsApp.closeButtonColor,
                minimumSize: Size( ResponsiveApp.dSize( 40.0 ), ResponsiveApp.dSize( 40.0 ) ),
                padding: const EdgeInsets.all( 0.0 )
              ),
              child: Icon(
                Icons.close_rounded,
                size: ResponsiveApp.dSize( 18.0 ),
                color: ColorsApp.primaryColor
              )
            )
          ]
        )
      ]
    );

  }

}