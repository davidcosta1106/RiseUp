class CollectionPoints {
  int idCollectionPoint;
  String collectionPointName;
  String postalCode;
  String district;
  String city;
  String country;
  String street;
  int numberDoor;
  DateTime inicialHour;
  DateTime endHour;
  String weekDays;

  CollectionPoints(
    this.idCollectionPoint,
    this.collectionPointName,
    this.postalCode,
    this.district,
    this.city,
    this.country,
    this.street,
    this.numberDoor,
    this.inicialHour,
    this.endHour,
    this.weekDays,
  );
}
