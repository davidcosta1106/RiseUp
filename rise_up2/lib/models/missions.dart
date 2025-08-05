class Missions {
  int idMission;
  String missionName;
  String descriptionMission;
  DateTime dateMission;
  String locality;
  String stateMission;
  int financedAmount;


  Missions(
      this.idMission,
      this.missionName,
      this.descriptionMission,
      this.dateMission,
      this.locality,
      this.stateMission,
      this.financedAmount,);

  factory Missions.fromJson(Map<String, dynamic> json) {
    return Missions(
        json['id_mission'],
        json['mission_name'],
        json['description_mission'],
        DateTime.parse(json['date_mission']),
        json['locality'],
        json['state_mission'],
        json['financed_amount']
        );
        
  }
}
