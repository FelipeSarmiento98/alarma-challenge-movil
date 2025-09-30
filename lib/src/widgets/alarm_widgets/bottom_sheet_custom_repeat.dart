import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';
import '../general_widgets/main_button.dart';
import '../general_widgets/title_bottom_sheet.dart';
import 'checkbox_item.dart';

class BottomSheetCustomRepeat extends StatelessWidget {

  BottomSheetCustomRepeat( { super.key } );

  final List<String> lDays = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];

  @override
  Widget build( BuildContext context ) {

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 24.0 ) ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleBottomSheet( sTitle: 'Personalizar' ),
          SizedBox( height: ResponsiveApp.dHeight( 16.0 ) ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: lDays.length,
            itemBuilder: ( context, index) => CheckBoxItem(
              sText: lDays[index]
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric( vertical: ResponsiveApp.dHeight( 32.0 ) ),
            child: MainButton(
              onPressed: () =>Navigator.pop( context ),
              sLabel: 'Guardar',
              backgroundColor: ColorsApp.primaryLightColor,
              textColor: Colors.black
            )
          )
        ]
      )
    );

  }

}