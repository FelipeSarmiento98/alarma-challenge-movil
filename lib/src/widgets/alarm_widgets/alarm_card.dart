import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import '../general_widgets/poppins_text.dart';

class AlarmCard extends StatefulWidget {

  final String sName;
  final String sHour;
  final VoidCallback? onDelete;

  const AlarmCard(
    {
      super.key,
      required this.sName,
      required this.sHour,
      this.onDelete
    }
  );

  @override
  State<AlarmCard> createState() => _AlarmCardState();

}


class _AlarmCardState extends State<AlarmCard> {

  bool bSwitched = true;

  @override
  Widget build( BuildContext context ) {
    
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveApp.dHeight( 16.0 ),
        horizontal: ResponsiveApp.dHeight( 8.0 )
      ),
      margin: EdgeInsets.symmetric(
        vertical: ResponsiveApp.dHeight( 4.0 ),
        horizontal: ResponsiveApp.dHeight( 16.0 )
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText(
                  sText: widget.sName,
                  dFontSize: ResponsiveApp.dSize( 12.0 ),
                  colorText: ColorsApp.textColor
                ),
                SizedBox( height: ResponsiveApp.dHeight( 8.0 ) ),
                PoppinsText(
                  sText: widget.sHour,
                  dFontSize: ResponsiveApp.dSize( 22.0 ),
                  colorText: ColorsApp.secondaryColor
                )
              ]
            )
          ),
          Switch(
            value: bSwitched,
            onChanged: ( bSwitch ) => setState(() => bSwitched = bSwitch ),
            activeColor: ColorsApp.backgroundColor,
            activeTrackColor: ColorsApp.primaryColor,
            inactiveTrackColor: Colors.transparent,
            inactiveThumbColor: ColorsApp.borderColor,
            trackOutlineColor: WidgetStateProperty.all<Color>( bSwitched ? ColorsApp.primaryColor : ColorsApp.borderColor ),
          ),
          SizedBox( width: ResponsiveApp.dWidth( 0.0 ) ),
          IconButton(
            icon: Icon( Icons.delete_outline, color: Colors.red ),
            onPressed: widget.onDelete,
            iconSize: ResponsiveApp.dSize( 24.0 )
          )
        ]
      )
    );

  }
}