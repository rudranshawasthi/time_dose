class Drug {
  String name;

  bool morning;
  bool afternoon;
  bool evening;
  bool night;

  Drug.fromMap(Map map)
      : this.name = map['name'],
        this.morning = map['morning'],
        this.afternoon = map['afternoon'],
        this.evening = map['evening'],
        this.night = map['night'];

  Map toMap() {
    return {
      'name': this.name,
      'morning': this.morning,
      'afternoon': this.afternoon,
      'evening': this.evening,
      'night': this.night,
    };
  }

  Drug(
      {this.name = ' ',
      this.night = false,
      this.evening = false,
      this.afternoon = false,
      this.morning = false});

  void toggleMorning() {
    morning = !morning;
  }

  void toggleAfternoon() {
    afternoon = !afternoon;
  }

  void toggleEvening() {
    evening = !evening;
  }

  void toggleNight() {
    night = !night;
  }

  String getScheduleString() {
    String temp = '';
    temp += morning ? 'M ' : '';
    temp += afternoon ? 'A ' : '';
    temp += evening ? 'E ' : '';
    temp += night ? 'N ' : '';
    return temp;
  }
}
