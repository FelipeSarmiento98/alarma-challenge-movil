import 'package:flutter/material.dart';

import '../classes/device.dart';

class DevicesProvider with ChangeNotifier {

  final List<Device> _lDevices = [
    Device( sName: 'PC 1', sPhoto: '' ),
    Device( sName: 'Pantalla 1', sPhoto: '' ),
    Device( sName: 'PC 2', sPhoto: '' ),
    Device( sName: 'Pantalla 2', sPhoto: '' ),
    Device( sName: 'PC 3', sPhoto: '' ),
    Device( sName: 'Pantalla 3', sPhoto: '' ),
    Device( sName: 'PC 4', sPhoto: '' )
  ];


  List<Device> get lDevices => _lDevices;

}