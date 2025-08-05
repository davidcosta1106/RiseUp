class MissionsCollectionPoints {
  int idMission;
  String missionName;
  String collectionPointName;
  String postalcode;
  String district;
  String city;
  String country;
  String street;
  int numberDoor;
  String initialHour;
  String endHour;
  String weekDays;

  MissionsCollectionPoints(
    this.idMission,
    this.missionName,
    this.collectionPointName,
    this.postalcode,
    this.district,
    this.city,
    this.country,
    this.street,
    this.numberDoor,
    this.initialHour,
    this.endHour,
    this.weekDays,
  );

  factory MissionsCollectionPoints.fromJson(Map<String, dynamic> json) {
    return MissionsCollectionPoints(
        json['id_mission'],
        json['mission_name'],
        json['collection_point_name'],
        json['postal_code'],
        json['district'],
        json['city'],
        json['country'],
        json['stret'],
        json['number_door'],
        json['initial_hour'],
        json['end_hour'],
        json['week_days']
    );
  }
}
