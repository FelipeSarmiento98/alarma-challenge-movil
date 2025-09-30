import 'package:flutter/material.dart';

import '../../utils/responsive_app.dart';

import '../general_widgets/poppins_text.dart';

class ItemDeviceList extends StatelessWidget {

  final String sName;
  final IconData icon;

  const ItemDeviceList(
    {
      super.key,
      required this.sName,
      required this.icon
    }
  );

  @override
  Widget build( BuildContext context ) {

    return Container(
      margin: EdgeInsets.symmetric( vertical: ResponsiveApp.dHeight( 4.0 ) ),
      padding: EdgeInsets.only( top: ResponsiveApp.dHeight( 8.0 ), bottom: ResponsiveApp.dHeight( 8.0 ), left: ResponsiveApp.dWidth( 8.0 ) ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Row(
        children: [
          Expanded(
            child: PoppinsText(
              sText: sName,
              dFontSize: ResponsiveApp.dSize( 14.0 ),
              colorText: Colors.black
            )
          ),
          SizedBox( width: ResponsiveApp.dWidth( 24.0 ) ),
          IconButton(
            onPressed: (){},
            icon: Icon( icon, color: Colors.black, size: ResponsiveApp.dSize( 24.0 ) )
          )
        ]
      )
    );

  }

}