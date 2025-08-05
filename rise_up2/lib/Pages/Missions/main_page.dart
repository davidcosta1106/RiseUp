import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rise_up2/Data/fetch_mission_data.dart';
import 'package:rise_up2/Pages/Missions/congo_mission_page.dart';
import 'package:rise_up2/Pages/Missions/cyclone_freddy_mission.dart';
import 'package:rise_up2/Pages/Missions/syria_earthquake.dart';
import 'package:rise_up2/Pages/Missions/ukrayne_mission.dart';
import 'package:rise_up2/Pages/Navegation_Bar/nav_bar.dart';
import '../../models/missions.dart';
import '../../widgets/AppBarWidget/app_bar_nav_bar.dart';
import 'cyclone_mocha_mission_page.dart';
import 'turkiye_mission_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final json = FetchDataMissions.getMissions();
  Map<int, String> missionImagePaths = {
    1: 'assets/images/turkiye_earthquake.png',
    2: 'assets/images/ukraine_war.png',
    3: 'assets/images/congo_floods.png',
    4: 'assets/images/cyclone_freddy_mozambique.png',
    5: 'assets/images/syria_earthquake.png',
    6: 'assets/images/cyclone_mocha_myanmar.png',
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder<List<Missions>>(
        future: json,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child: Text('An error occurred.'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }

          List<Missions> missions = snapshot.data!;
          return Scaffold(
            drawer: const NavBar(),
            appBar: const AppBarWidget(text: 'Missions'),
            body: ListView.separated(
              itemCount: missions.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Color.fromARGB(255, 198, 115, 115),
              ),
              itemBuilder: (BuildContext context, int index) {
                Missions mission = missions[index];
                DateFormat dateFormat = DateFormat('yyyy-MM-dd');
                String formattedDate = dateFormat.format(mission.dateMission);
                return GestureDetector(
                  onTap: () {
                    if (mission.idMission == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TurkieMissionPage(),
                        ),
                      );
                    } else if (mission.idMission == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UkrayneMissionPage(),
                        ),
                      );
                    } else if (mission.idMission == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CongoMissionPage(),
                        ),
                      );
                    } else if (mission.idMission == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CycloneFreddyPage(),
                        ),
                      );
                    } else if (mission.idMission == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SyriaMissionPage(),
                        ),
                      );
                    } else if (mission.idMission == 6) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CycloneMochaPage(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: ListTile(
                      leading: Image.asset(
                        missionImagePaths[mission.idMission] ??
                            'assets/images/turkiye_earthquake.png',
                        width: 70,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        mission.missionName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Locality: ${mission.locality}'),
                          Text(formattedDate),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
