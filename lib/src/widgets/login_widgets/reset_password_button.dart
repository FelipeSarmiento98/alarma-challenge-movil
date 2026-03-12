import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/functions.dart';
import '../../utils/responsive_app.dart';

import '../reset_password_widgets/bottom_sheet_reset_password.dart';

class ResetPasswordButton extends StatelessWidget {

  ResetPasswordButton( { super.key } );

  final functions = Functions();

  @override
  Widget build( BuildContext context ) {

    return Padding(
      padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 24.0 ), bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Ensure alignment to the left
        children: [
          TextButton(
            style: TextButton.styleFrom(
              overlayColor: ColorsApp.primaryColor.withAlpha( 51 ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular( 12.0 )
              )
            ),
            onPressed: () => functions.showBottomSheet( context, const BottomSheetResetPassword() ),
            child: Stack(
              alignment: Alignment.centerLeft, // Ensure alignment to the left
              children: [
                // White stroke
                Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    fontSize: ResponsiveApp.dSize(14.0),
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.0 // Increase stroke width for better visibility
                      ..color = Colors.white, // White stroke
                  ),
                ),
                // Black fill
                Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    fontSize: ResponsiveApp.dSize(14.0),
                    color: Colors.black, // Black fill
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

}