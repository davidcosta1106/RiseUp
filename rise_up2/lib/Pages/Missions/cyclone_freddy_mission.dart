import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Data/fetch_mission_data.dart';
import '../../models/missions.dart';
import '../../widgets/ButtonsWidgets/select_collection_point.dart';
import '../../widgets/ImagesWidget/images.dart';
import '../../widgets/TextWidgets/description_text.dart';
import '../../widgets/TextWidgets/mission_title_text.dart';
import '../../widgets/ButtonsWidgets/segmentedcontrollapp.dart';
import '../../widgets/TextWidgets/type_donation_title.dart';
import 'main_page.dart';

class CycloneFreddyPage extends StatefulWidget {
  const CycloneFreddyPage({Key? key}) : super(key: key);

  @override
  State<CycloneFreddyPage> createState() => _CycloneFreddyPage();
}

class _CycloneFreddyPage extends State<CycloneFreddyPage> {
  final json = FetchDataMissions.getMissions();

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

          // ignore: unused_local_variable
          List<Missions> missions = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                  );
                },
              ),
              backgroundColor: Colors.white,
              title: const Text(
                'Cyclone Freddy Mission',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Images(
                      imagePath: 'assets/images/cyclone_freddy_mozambique.png'),
                  const MissionTitleText(text: 'Mozambique Cyclone'),
                  DescriptionTextWidget(
                    missionId: 4,
                    missionList: json,
                  ),
                  const TypeDonationTitle(
                      text: 'How you would like to donate?'),
                  const SegmentedControlApp(),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectCollectionPoint()));
                      },
                      child: const Text('Check Collection Points'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
