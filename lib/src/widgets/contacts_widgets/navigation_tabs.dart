import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';
import '../general_widgets/poppins_text.dart';

class NavigationTabs extends StatelessWidget {

  final Set<String> selected;
  final Function(Set<String>) onSelectionChanged;
  
  const NavigationTabs(
    {
      super.key,
      required this.selected,
      required this.onSelectionChanged
    }
  );

  @override
  Widget build( BuildContext context ) {

    return Padding(
      padding: EdgeInsets.symmetric( vertical: ResponsiveApp.dHeight( 16.0 ), horizontal: ResponsiveApp.dWidth( 16.0 )),
      child: SegmentedButton(
        segments: [
          ButtonSegment(
            value: 'Profesores',
            label: PoppinsText(
              sText: 'Profesores',
              colorText: selected.contains('Profesores') ? ColorsApp.secondaryTextColor : ColorsApp.secondaryColor,
              dFontSize: ResponsiveApp.dSize( 14.0 ),
              fontWeight: FontWeight.w500
            )
          ),
          ButtonSegment(
            value: 'Papás',
            label: PoppinsText(
              sText: 'Papás',
              colorText: selected.contains('Papás') ? ColorsApp.secondaryTextColor : ColorsApp.secondaryColor,
              dFontSize: ResponsiveApp.dSize( 14.0 ),
              fontWeight: FontWeight.w500
            )
          )
        ],
        selected: selected,
        onSelectionChanged: onSelectionChanged,
        style: SegmentedButton.styleFrom(
          disabledBackgroundColor: ColorsApp.backgroundColor,
          selectedBackgroundColor: ColorsApp.primaryColor,
          selectedForegroundColor: ColorsApp.secondaryTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
          ),
          padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 16.0 ) )
        )
      )
    );

  }

}