import 'package:flutter/material.dart';

import '../../models/missions.dart';

class DescriptionTextWidget extends StatelessWidget {
  final int missionId;
  final Future<List<Missions>> missionList;

  DescriptionTextWidget(
      {Key? key, required this.missionId, required this.missionList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Missions>>(
      future: missionList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('An error occurred.'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No data available'),
          );
        }

        List<Missions> missions = snapshot.data!;
        Missions mission =
            missions.firstWhere((mission) => mission.idMission == missionId);

        return Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 0, left: 20, right: 20),
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            mission.descriptionMission,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
