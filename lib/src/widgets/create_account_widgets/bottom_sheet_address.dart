import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';

import '../general_widgets/address_text_button.dart';
import '../general_widgets/main_button.dart';
import '../general_widgets/text_field_forms.dart';
import '../general_widgets/title_bottom_sheet.dart';

class BottomSheetAddress extends StatelessWidget {

  BottomSheetAddress( { super.key } );

  final searchController = TextEditingController();

  @override
  Widget build( BuildContext context ) {

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 24.0 ) ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleBottomSheet( sTitle: 'Dirección' ),
          Padding(
            padding: EdgeInsets.symmetric( vertical: ResponsiveApp.dHeight( 32.0 ) ),
            child: TextFieldForms(
              sLabel: 'Busca una dirección',
              controller: searchController
            )
          ),
          const TextButtonAddress(
            sLabel: 'Selecciona en el mapa',
            icon: Icons.map_rounded
          ),
          const Divider( color: ColorsApp.inactiveColor ),
          const TextButtonAddress(
            sLabel: 'Obtener mi ubicación',
            icon: Icons.my_location_rounded
          ),
          const Divider( color: ColorsApp.inactiveColor ),
          Padding(
            padding: EdgeInsets.symmetric( vertical: ResponsiveApp.dHeight( 32.0 ) ),
            child: MainButton(
              onPressed: () => Navigator.pop( context ),
              sLabel: 'Guardar'
            )
          )
        ]
      )
    );

  }

}