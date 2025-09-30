import 'package:flutter/material.dart';

import '../utils/colors_app.dart';
import '../utils/functions.dart';
import '../utils/responsive_app.dart';

import '../widgets/general_widgets/poppins_text.dart';
import '../widgets/alarm_widgets/bottom_sheet_custom_repeat.dart';

class RepeatAlarmPage extends StatefulWidget {

  const RepeatAlarmPage( { super.key } );


  @override
  State<RepeatAlarmPage> createState() => _RepeatAlarmPageState();

}

class _RepeatAlarmPageState extends State<RepeatAlarmPage> {

  List<String> lOptions = ["Una vez", "Diariamente", "Lunes a Viernes", "Personalizar"];

  int bSelected = 0;

  final functions = Functions();

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.baseColor,
        title: PoppinsText(
          sText: 'Repetir alarma',
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
        itemCount: lOptions.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {

              setState( () => bSelected = index );

              if ( lOptions[index] == "Personalizar" ) {
                functions.showBottomSheet( context, BottomSheetCustomRepeat() );
              }

            },
            child: Container(
              margin: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 16.0 ), vertical: ResponsiveApp.dHeight( 8.0 ) ),
              padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 16.0 ) ),
              height: ResponsiveApp.dHeight( 64.0 ),
              decoration: BoxDecoration(
                color: bSelected == index ? ColorsApp.primaryColor.withValues( alpha: 0.1 ) : Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular( 16.0 ),
              ),
              child: Row(
                children: [
                  bSelected == index ? Icon( Icons.check_rounded, color: ColorsApp.primaryLightColor, size: ResponsiveApp.dSize( 24.0 ) ) : const SizedBox(),
                  SizedBox( width: ResponsiveApp.dWidth( bSelected  == index ? 8.0 : 32.0 ) ),
                  PoppinsText(
                    sText:  lOptions[index],
                    dFontSize: ResponsiveApp.dSize( 14.0 ),
                    colorText: bSelected  == index ? ColorsApp.primaryColor : ColorsApp.textColor,
                    fontWeight: bSelected  == index ? FontWeight.w600 : FontWeight.normal,
                  ),
                  const Expanded( child: SizedBox() ),
                  lOptions[index] == "Personalizar" ? Icon( Icons.keyboard_arrow_right_rounded, color: ColorsApp.textColor, size: ResponsiveApp.dSize( 24.0 ) ) : const SizedBox(),
                ]
              )
            )
          );
        }
        )
      )
    );  }

}