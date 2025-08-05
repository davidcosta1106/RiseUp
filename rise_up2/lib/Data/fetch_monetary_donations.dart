import 'package:rise_up2/models/monetary_donations.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class FetchDataMonetaryDonations {
  //GET MonetaryDonations
  static Future<List<MonetaryDonations>> getMonetaryDonations() async {
    Iterable iterable;
    List<MonetaryDonations> monetaryDonations;

    const url = 'http://10.0.2.2:7014/api/Monetary_Donations';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    iterable = json.decode(response.body);
    monetaryDonations = List<MonetaryDonations>.from(iterable.map((e) => MonetaryDonations.fromJson(e)));
    return monetaryDonations;
  }
}