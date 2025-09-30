import 'package:flutter/material.dart';

import '../utils/colors_app.dart';
import '../utils/responsive_app.dart';

import '../widgets/general_widgets/poppins_text.dart';

class ToneAlarmPage extends StatefulWidget {

  const ToneAlarmPage( { super.key } );

  @override
  State<ToneAlarmPage> createState() => _ToneAlarmPageState();

}

class _ToneAlarmPageState extends State<ToneAlarmPage> {

  List<String> lTones = ["Song.mp3", "Tone1.mp3", "Tone2.mp3", "Tone3.mp3", "Tone4.mp3"];

  int iSelected = 0;

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorsApp.baseColor,
        title: PoppinsText(
          sText: 'Tono de alarma',
          dFontSize: ResponsiveApp.dSize( 20.0 ),
          colorText: ColorsApp.secondaryColor
        )
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFEFDE5),
              Color(0xFFFAFAEC),
            ],
          ),
        ),
        child: ListView.builder(
        padding: EdgeInsets.only( top: ResponsiveApp.dHeight( 16.0 ) ),
        itemCount: lTones.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState( () => iSelected = index );
              Navigator.pop( context, lTones[index] );
            },
            child: Container(
              margin: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 16.0 ), vertical: ResponsiveApp.dHeight( 8.0 ) ),
              padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 16.0 ) ),
              height: ResponsiveApp.dHeight( 64.0 ),
              decoration: BoxDecoration(
                color: iSelected == index ? ColorsApp.primaryColor.withValues( alpha: 0.1 ) : Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular( 16.0 ),
              ),
              child: Row(
                children: [
                  iSelected == index ? Icon( Icons.check_rounded, color: ColorsApp.primaryLightColor, size: ResponsiveApp.dSize( 24.0 ) ) : const SizedBox(),
                  SizedBox( width: ResponsiveApp.dWidth( iSelected == index ? 8.0 : 32.0 ) ),
                  PoppinsText(
                    sText: lTones[index],
                    dFontSize: ResponsiveApp.dSize( 14.0 ),
                    colorText: iSelected == index ? ColorsApp.primaryColor : ColorsApp.textColor,
                    fontWeight: iSelected == index ? FontWeight.w600 : FontWeight.normal,
                  ),
                ]
              )
            )
          );
        }
        )
      )
    );  }

}