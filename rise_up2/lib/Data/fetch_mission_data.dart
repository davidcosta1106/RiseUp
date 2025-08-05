import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rise_up2/models/missions.dart';

class FetchDataMissions {
//Get Missions
  static Future<List<Missions>> getMissions() async {
    Iterable iterable;
    List<Missions> missions;

    const url = 'http://10.0.2.2:7014/api/Missions';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    iterable = json.decode(response.body);
    missions = List<Missions>.from(iterable.map((e) => Missions.fromJson(e)));
    return missions;
  }

//Post Missions
  static Future<void> postMissions(Missions missions) async {
    const apiUrl = 'http://10.0.2.2:7014/api/Missions/';
    final updateUrl = apiUrl + missions.idMission.toString();

    final body = {
      'id_mission': missions.idMission.toString(),
      'mission_name': missions.missionName.toString(),
      'description_mission': missions.descriptionMission.toString(),
      'date_mission': missions.dateMission.toString().split(' ')[0],
      'locality': missions.locality.toString(),
      'state_mission': missions.stateMission.toString(),
      'financed_amount': missions.financedAmount.toString()
    };

    final response = await http.post(
      Uri.parse(updateUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 204) {
      print('Mission updated successfully.');
    } else {
      print('Failed to update mission. Status code: ${response.body}');
    }
  }

//PUT Missions
  static Future<void> putMissions(Missions missions) async {
    const apiUrl = 'http://10.0.2.2:7014/api/Missions/';
    final updateUrl = apiUrl + missions.idMission.toString();

    final body = {
      'id_mission': missions.idMission.toString(),
      'mission_name': missions.missionName.toString(),
      'description_mission': missions.descriptionMission.toString(),
      'date_mission': missions.dateMission.toString().split(' ')[0],
      'locality': missions.locality.toString(),
      'state_mission': missions.stateMission.toString(),
      'financed_amount': missions.financedAmount.toString()
    };

    final response = await http.put(
      Uri.parse(updateUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 204) {
      print('Mission updated successfully.');
    } else {
      print('Failed to update mission. Status code: ${response.body}');
    }
  }

//DELETE Missions
  static Future<void> deleteMission(int missionId) async {
    const apiUrl = 'http://10.0.2.2:7014/api/Missions/';
    final deleteUrl = apiUrl + missionId.toString();

    final response = await http.delete(
      Uri.parse(deleteUrl),
    );

    if (response.statusCode == 204) {
      print('Mission deleted successfully.');
    } else {
      print('Failed to delete mission. Status code: ${response.statusCode}');
    }
  }
}
