import 'package:flutter/material.dart';

import '../../utils/colors_app.dart';
import '../../utils/responsive_app.dart';
import '../general_widgets/poppins_text.dart';

class CheckBoxItem extends StatefulWidget {

  final String sText;

  const CheckBoxItem(
    {
      super.key,
      required this.sText
    }
  );

  @override
  State<CheckBoxItem> createState() => _SubtaskItemState();

}

class _SubtaskItemState extends State<CheckBoxItem> {

  bool bSelected = false;
  
  @override
  Widget build( BuildContext context ) {

    return CheckboxListTile(
      value: bSelected,
      onChanged: ( value ) => setState( () => bSelected = value! ),
      title: PoppinsText(
        sText: widget.sText,
        dFontSize: ResponsiveApp.dSize( 14.0 ),
        colorText: ColorsApp.textColor,
        iMaxLines: 10
      ),
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: ColorsApp.primaryLightColor,
      dense: true
    );

  }

}