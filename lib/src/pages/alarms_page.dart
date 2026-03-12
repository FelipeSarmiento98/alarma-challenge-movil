import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/alarm_provider.dart';

import '../utils/colors_app.dart';
import '../utils/responsive_app.dart';

import '../widgets/alarm_widgets/alarm_card.dart';
import '../widgets/general_widgets/empty_state.dart';
import '../widgets/general_widgets/poppins_text.dart';

class AlarmsPage extends StatefulWidget {

  const AlarmsPage( { super.key } );

  @override
  State<AlarmsPage> createState() => _AlarmsPageState();

}

class _AlarmsPageState extends State<AlarmsPage> {

  String formatDate( DateTime date ) {

    String formattedTime = DateFormat('hh:mm a', 'es_ES').format( date );

    return formattedTime.replaceAll('AM', 'a. m.').replaceAll('PM', 'p. m.');

  }

  void showDeleteDialog( BuildContext context, int index ) {

    final alarmProvider = Provider.of<AlarmProvider>( context, listen: false );

    showDialog(

      context: context,

      barrierDismissible: true,

      builder: (BuildContext context) {

        return AlertDialog(

          title: PoppinsText(

            sText: '¡Espera!',

            dFontSize: ResponsiveApp.dSize(14.0),

            colorText: Colors.black,

            fontWeight: FontWeight.w500,

          ),

          content: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              PoppinsText(

                sText: '¿En realidad quieres eliminar esta alarma?',

                dFontSize: ResponsiveApp.dSize(14.0),

                colorText: Colors.black,

                textAlign: TextAlign.start,

                iMaxLines: 3,

              ),

              const SizedBox(height: 16.0),

              Container(

                height: 1.0,

                color: Colors.grey,

              ),

              const SizedBox(height: 16.0),

              Row(

                mainAxisAlignment: MainAxisAlignment.end,

                children: [

                  TextButton(

                    onPressed: () {

                      Navigator.pop(context);

                    },

                    child: PoppinsText(

                      sText: 'No',

                      dFontSize: ResponsiveApp.dSize(14.0),

                      colorText: ColorsApp.primaryColor,

                    ),

                  ),

                  TextButton(

                    onPressed: () {

                      alarmProvider.removeAlarm( index );

                      Navigator.pop(context);

                    },

                    child: PoppinsText(

                      sText: 'Sí',

                      dFontSize: ResponsiveApp.dSize(14.0),

                      colorText: ColorsApp.primaryColor,

                    ),

                  ),

                ],

              ),

            ],

          ),

        );

      },

    );

  }

  @override
  Widget build( BuildContext context ) {

    final alarmProvider = Provider.of<AlarmProvider>( context );

    return Scaffold(
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
        child: alarmProvider.lAlarms.isEmpty
            ? const EmptyState()
            : ListView.builder(
                padding: EdgeInsets.only( top: ResponsiveApp.dHeight( 16.0 ) ),
                itemCount: alarmProvider.lAlarms.length,
                itemBuilder: ( context, index ) => AlarmCard(
                  sName: alarmProvider.lAlarms[index].sName!,
                  sHour: formatDate( alarmProvider.lAlarms[index].sHour! ),
                  onDelete: () => showDeleteDialog( context, index )
                )
              ),
      ),
    );

  }

}