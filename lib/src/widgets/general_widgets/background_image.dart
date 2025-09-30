import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

class BackgroundImage extends StatelessWidget {

  final double height;
  final Widget child;
  
  const BackgroundImage(
    {
      super.key,
      required this.child,
      this.height = 412.0
    }
  );

  @override
  Widget build( BuildContext context ) {

    return Column(
      children: [
        Container(
          width: ResponsiveApp.dWidth( 360.0 ),
          height: ResponsiveApp.dHeight( height ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage( 'assets/images/background1.png' ),
              fit: BoxFit.cover
            )
          ),
        ),
        
      ],
    );

  }

}