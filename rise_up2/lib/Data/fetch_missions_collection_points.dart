import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rise_up2/models/missions_collection_points.dart';

class FetchDataMissionsCollectionPoints {
  //GET Missions Collection Points
  static Future<List<MissionsCollectionPoints>>
      getMissionsCollectionPoints() async {
    Iterable iterable;
    List<MissionsCollectionPoints> missionsCollectionPoints;

    const url =
        'http://10.0.2.2:7014/api/Missions_Collection_Points_Fileter_Query';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    iterable = json.decode(response.body);
    missionsCollectionPoints = List<MissionsCollectionPoints>.from(
        iterable.map((e) => MissionsCollectionPoints.fromJson(e)));
    return missionsCollectionPoints;
  }
}
