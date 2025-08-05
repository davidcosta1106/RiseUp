class MonetaryDonations {
  String missionName;
  int monetaryValue;
  String associationName;
  String baseDistrict;
  String baseCountry;
  String iban;
  String paymentMethod;

  MonetaryDonations(
    this.missionName,
    this.monetaryValue,
    this.associationName,
    this.baseDistrict,
    this.baseCountry,
    this.iban,
    this.paymentMethod
  );
    factory MonetaryDonations.fromJson(Map<String, dynamic> json) {
    return MonetaryDonations(
      json['missions']['mission_name'],
      json['monetary_value'],
      json['associations']['association_name'],
      json['associations']['base_district'],
      json['associations']['base_country'],
      json['associations']['iban'],
      json['payment_Method']['payment_method_name'],
    );
  }

}
