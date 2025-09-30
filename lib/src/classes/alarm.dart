class Alarm {

  String? sName;
  DateTime? sHour;
  String? sRepeat;
  String? sTone;
  bool? bGradualVolume;
  bool? bVibration;

  List<String>? lSubtasks;

  Alarm(
    {
      this.sName,
      this.sHour,
      this.sRepeat,
      this.sTone,
      this.bGradualVolume,
      this.bVibration,
      this.lSubtasks
    }
  );

}