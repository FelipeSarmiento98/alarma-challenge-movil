import 'package:flutter/material.dart';

import '../classes/alarm.dart';

class AlarmProvider with ChangeNotifier {

  List<Alarm> _lAlarms = [];
  List<String> _lSubtask = [];

  List<Alarm> get lAlarms => _lAlarms;
  List<String> get lSubtask => _lSubtask;

  set lAlarms( List<Alarm> lAlarms ) {

    _lAlarms = lAlarms;

    notifyListeners();

  }

  set lSubtask( List<String> lSubtask ) {

    _lSubtask = lSubtask;

    notifyListeners();

  }

  void addAlarm( Alarm alarm ) {

    _lAlarms.add( alarm );

    notifyListeners();

  }

  void removeAlarm( int index ) {

    _lAlarms.removeAt( index );

    notifyListeners();

  }

}