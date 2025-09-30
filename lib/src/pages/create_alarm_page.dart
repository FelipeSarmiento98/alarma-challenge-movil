import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:provider/provider.dart';

import '../classes/alarm.dart';

import '../providers/alarm_provider.dart';

import '../utils/colors_app.dart';
import '../utils/responsive_app.dart';

import '../utils/slide_transition.dart';
import '../widgets/alarm_widgets/checkbox_item.dart';
import '../widgets/general_widgets/poppins_text.dart';

import 'repeat_alarm_page.dart';
import 'tone_alarm_page.dart';

class CreateAlarmPage extends StatefulWidget {

  const CreateAlarmPage( { super.key } );

  @override
  State<CreateAlarmPage> createState() => _CreateAlarmPageState();

}

class _CreateAlarmPageState extends State<CreateAlarmPage> {

  DateTime? sHour;

  String selectedTone = "Song.mp3";

  bool bGradualVolume = true;

  bool bVibration = true;

  final nameController = TextEditingController();

  @override
  Widget build( BuildContext context ) {

    final alarmProvider = Provider.of<AlarmProvider>( context );
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: ColorsApp.baseColor,
        leading: IconButton(
          onPressed: () => Navigator.pop( context ),
          icon: Icon(
            Icons.arrow_back,
            color: ColorsApp.secondaryColor,
            size: ResponsiveApp.dSize( 24.0 )
          )
        ),
        title: TextField(
          controller: nameController,
          style: GoogleFonts.poppins(
            fontSize: ResponsiveApp.dSize( 18.0 ),
            color: ColorsApp.secondaryColor,
            fontWeight: FontWeight.w500
          ),
          decoration: InputDecoration(
            hintText: 'Nombre de la alarma',
            hintStyle: GoogleFonts.poppins(
              fontSize: ResponsiveApp.dSize( 18.0 ),
              color: ColorsApp.secondaryColor.withOpacity(0.5),
              fontWeight: FontWeight.w500
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if ( nameController.text.isNotEmpty && sHour != null ) {
                Alarm newAlarm = Alarm(
                  sName: nameController.text,
                  sHour: sHour,
                  sTone: selectedTone,
                  bGradualVolume: bGradualVolume,
                  bVibration: bVibration
                );
                alarmProvider.addAlarm( newAlarm );
                Navigator.pop( context );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: PoppinsText(
                      sText: 'Por favor ingresa nombre y hora',
                      dFontSize: ResponsiveApp.dSize(14.0),
                      colorText: Colors.white,
                    ),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.check,
              color: ColorsApp.secondaryColor,
              size: ResponsiveApp.dSize( 24.0 )
            )
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox( height: ResponsiveApp.dHeight( 32.0 ) ),
              TimePickerSpinner(
                isForce2Digits: true,
                is24HourMode: false,
                normalTextStyle: GoogleFonts.poppins(
                  fontSize: ResponsiveApp.dSize( 16.0 ),
                  color: ColorsApp.textColor
                ),
                highlightedTextStyle: GoogleFonts.poppins(
                  fontSize: ResponsiveApp.dSize( 22.0 ),
                  color: ColorsApp.secondaryColor,
                  fontWeight: FontWeight.w500
                ),
                spacing: ResponsiveApp.dWidth( 40.0 ),
                itemWidth: ResponsiveApp.dWidth( 64.0 ),
                itemHeight: ResponsiveApp.dHeight( 48.0 ),
                onTimeChange: ( hour ) => setState( () => sHour = hour )
              ),
              SizedBox( height: ResponsiveApp.dHeight( 40.0 ) ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 16.0 ) ),
                    child: PoppinsText(
                      sText: 'Repetir',
                      dFontSize: ResponsiveApp.dSize( 14.0 ),
                      colorText: ColorsApp.secondaryColor,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  TextButton.icon(
                    onPressed: () => Navigator.push( context, SlidePageRoute( page: const RepeatAlarmPage() ) ),
                    style: TextButton.styleFrom(
                      overlayColor: ColorsApp.primaryColor.withValues( alpha: 0.2 ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular( 12.0 )
                      )
                    ),
                    label: PoppinsText(
                      sText: 'Una vez',
                      dFontSize: ResponsiveApp.dSize( 12.0 ),
                      colorText: ColorsApp.textColor
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: ColorsApp.textColor,
                      size: ResponsiveApp.dSize( 24.0 )
                    ),
                    iconAlignment: IconAlignment.end
                  )
                ]
              ),
              SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 16.0 ) ),
                    child: PoppinsText(
                      sText: 'Tono',
                      dFontSize: ResponsiveApp.dSize( 14.0 ),
                      colorText: ColorsApp.secondaryColor,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      final result = await Navigator.push( context, SlidePageRoute( page: const ToneAlarmPage() ) );
                      if ( result != null ) {
                        setState( () => selectedTone = result );
                      }
                    },
                    style: TextButton.styleFrom(
                      overlayColor: ColorsApp.primaryColor.withValues( alpha: 0.2 ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular( 12.0 )
                      )
                    ),
                    label: PoppinsText(
                      sText: selectedTone,
                      dFontSize: ResponsiveApp.dSize( 12.0 ),
                      colorText: ColorsApp.textColor
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: ColorsApp.textColor,
                      size: ResponsiveApp.dSize( 24.0 )
                    ),
                    iconAlignment: IconAlignment.end
                  )
                ]
              ),
              SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 16.0 ) ),
                    child: PoppinsText(
                      sText: 'Volumen gradual',
                      dFontSize: ResponsiveApp.dSize( 14.0 ),
                      colorText: ColorsApp.secondaryColor,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only( right: ResponsiveApp.dWidth( 16.0 ) ),
                    child: Checkbox(
                      value: bGradualVolume,
                      onChanged: (value) => setState( () => bGradualVolume = value! ),
                      activeColor: ColorsApp.primaryLightColor,
                      checkColor: Colors.white,
                    )
                  )
                ]
              ),
              SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 16.0 ) ),
                    child: PoppinsText(
                      sText: 'Vibración',
                      dFontSize: ResponsiveApp.dSize( 14.0 ),
                      colorText: ColorsApp.secondaryColor,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only( right: ResponsiveApp.dWidth( 16.0 ) ),
                    child: Checkbox(
                      value: bVibration,
                      onChanged: (value) => setState( () => bVibration = value! ),
                      activeColor: ColorsApp.primaryLightColor,
                      checkColor: Colors.white,
                    )
                  )
                ]
              ),
              SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only( left: ResponsiveApp.dWidth( 16.0 ) ),
                    child: PoppinsText(
                      sText: 'Retos al Despertar',
                      dFontSize: ResponsiveApp.dSize( 16.0 ),
                      colorText: ColorsApp.secondaryColor,
                      fontWeight: FontWeight.w500
                    )
                  ),
                ]
              ),
              SizedBox( height: ResponsiveApp.dHeight( 20.0 ) ),
              Column(
                children: [
                  CheckBoxItem( sText: 'Actividad Física' ),
                  CheckBoxItem( sText: 'Cámara' ),
                  CheckBoxItem( sText: 'Captcha' ),
                  CheckBoxItem( sText: 'Matemático' ),
                  CheckBoxItem( sText: 'Memoria' ),
                ]
              )
            ]
          )
        ),
      ),
    );
  
  }

}