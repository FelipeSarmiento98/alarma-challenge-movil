import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/alarm_provider.dart';

import '../utils/colors_app.dart';
import '../utils/responsive_app.dart';
import '../utils/slide_transition.dart';

import '../widgets/general_widgets/poppins_text.dart';

import 'alarms_page.dart';
import 'devices_page.dart';
import 'create_alarm_page.dart';
import 'login_page.dart';

class MainPage extends StatefulWidget {

  const MainPage( { super.key } );

  @override
  State<MainPage> createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {

  int iIndexNavigation = 0;

  List<Widget> lPages = [ const AlarmsPage(), const DevicesPage() ];

  @override
  Widget build( BuildContext context ) {

    final alarmProvider = Provider.of<AlarmProvider>( context );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.baseColor,
        leading: IconButton(
          onPressed: () {
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
                        sText: '¿En realidad quieres cerrar sesión?',
                        dFontSize: ResponsiveApp.dSize(14.0),
                        colorText: Colors.black,
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
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginPage()),
                              );
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
          },
          icon: Transform.rotate(
            angle: 3.14159, // 180 grados
            child: Icon(
              Icons.logout,
              color: ColorsApp.secondaryColor,
              size: ResponsiveApp.dSize( 24.0 )
            ),
          )
        ),
        title: PoppinsText(
          sText: iIndexNavigation == 0 ? 'Alarmas' : 'Dispositivos',
          dFontSize: ResponsiveApp.dSize( 20.0 ),
          colorText: ColorsApp.secondaryColor
        ),
        actions: [
           iIndexNavigation == 0 ? IconButton(
            onPressed: () {
              alarmProvider.lSubtask.clear();
              Navigator.push( context, SlidePageRoute( page: const CreateAlarmPage() ) );
            },
            icon: Icon(
              Icons.add,
              color: ColorsApp.secondaryColor,
              size: ResponsiveApp.dSize( 24.0 )
            )
          ) : const SizedBox()
        ],
        actionsPadding: EdgeInsets.only( right: ResponsiveApp.dWidth( 8.0 ) ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFAEEB0E).withOpacity(0.5),
              Color(0xFFAEEB0E),
            ],
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState( () => iIndexNavigation = index );
          },
          backgroundColor: Colors.transparent,
          selectedIndex: iIndexNavigation,
          indicatorColor: Colors.white.withOpacity(0.5),
          labelTextStyle: WidgetStateProperty.all<TextStyle>(
            GoogleFonts.poppins(
              fontSize: ResponsiveApp.dSize( 12.0 ),
              color: ColorsApp.textColor,
              fontWeight: FontWeight.w500
            )
          ),
          destinations: [
            NavigationDestination(
              selectedIcon: Icon( Icons.alarm, color: ColorsApp.secondaryColor, size: ResponsiveApp.dSize( 24.0 ) ),
              icon: Icon( Icons.alarm, color: ColorsApp.textColor, size: ResponsiveApp.dSize( 24.0 ) ),
              label: 'Alarmas'
            ),
            NavigationDestination(
              selectedIcon: Icon( Icons.tv, color: ColorsApp.secondaryColor, size: ResponsiveApp.dSize( 24.0 ) ),
              icon: Icon( Icons.tv, color: ColorsApp.textColor, size: ResponsiveApp.dSize( 24.0 ) ),
              label: 'Dispositivos'
            )
          ]
        ),
      ),
      floatingActionButton: iIndexNavigation == 1 ? SizedBox(
        height: ResponsiveApp.dHeight( 34.0 ),
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: ColorsApp.primaryLightColor,
          extendedPadding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 20.0 ) ),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular( 12.0 ) ),
          icon: SizedBox(),
          label: PoppinsText(
            sText: 'Añadir Dispositivo',
            dFontSize: ResponsiveApp.dSize( 14.0 ),
            colorText: Colors.black,
            fontWeight: FontWeight.w500
          )
        )
      ) : null,
      floatingActionButtonLocation: iIndexNavigation == 1 ? FloatingActionButtonLocation.centerFloat : null,
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
        child: lPages[iIndexNavigation],
      ),
    );
  
  }

}