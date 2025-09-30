import 'dart:async';
import 'package:flutter/material.dart';

import '../utils/colors_app.dart';
import '../utils/responsive_app.dart';

import '../widgets/general_widgets/poppins_text.dart';

import 'main_page.dart';

class SplashPage extends StatefulWidget {

  const SplashPage(
    {
      super.key
    }
  );

  @override
  State<SplashPage> createState() => _SplashPageState();

}


class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {



  @override
  void initState() {
    super.initState();
      WidgetsBinding.instance.addPostFrameCallback(
        ( _ ) => Timer( const Duration(seconds: 2),
          () => Navigator.pushReplacement( context, MaterialPageRoute( builder: (_) => const MainPage() ) )
        )
      );
    }

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: ResponsiveApp.dHeight( 80.0 ),
            ),
            SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
            PoppinsText(
              sText: 'Alarma Challenge',
              colorText: ColorsApp.secondaryTextColor,
              dFontSize: ResponsiveApp.dSize( 32.0 )
            )
          ]
        )
      )
    );
  
  }

}