import 'dart:async';
import 'package:flutter/material.dart';

import '../utils/colors_app.dart';
import '../utils/responsive_app.dart';

import '../widgets/general_widgets/poppins_text.dart';

import 'login_page.dart';

class WelcomePage extends StatefulWidget {

  const WelcomePage( { super.key } );

  @override
  State<WelcomePage> createState() => _WelcomePageState();

}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      ( _ ) => Timer( const Duration(seconds: 2),
        () => Navigator.pushReplacement( context, MaterialPageRoute( builder: (_) => const LoginPage() ) )
      )
    );
  }

  @override
  void didChangeDependencies() {

    _configureScreenUtils();
    
    super.didChangeDependencies();

  }

  void _configureScreenUtils() {
    
    ResponsiveApp.init( context, 360, 800 );
    
    if ( ResponsiveApp.bTablet() ) {
      ResponsiveApp.init( context, 900, 1220 );
    }

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
              height: 80.0
            ),
            const SizedBox( height: 16.0 ),
            const PoppinsText(
              sText: 'Alarma Challenge',
              colorText: ColorsApp.secondaryTextColor,
              dFontSize: 32.0
            )
          ]
        )
      )
    );

  }

}