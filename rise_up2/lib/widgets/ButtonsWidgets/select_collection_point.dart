import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise_up2/Data/fetch_missions_collection_points.dart';
import 'package:rise_up2/Pages/Navegation_Bar/nav_bar.dart';
import 'package:rise_up2/models/missions_collection_points.dart';
import '../../widgets/AppBarWidget/app_bar_nav_bar.dart';

class SelectCollectionPoint extends StatefulWidget {
  const SelectCollectionPoint({Key? key}) : super(key: key);

  @override
  State<SelectCollectionPoint> createState() => _SelectCollectionPointState();
}

class _SelectCollectionPointState extends State<SelectCollectionPoint> {
  final json = FetchDataMissionsCollectionPoints.getMissionsCollectionPoints();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder<List<MissionsCollectionPoints>>(
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

          List<MissionsCollectionPoints> missionscollectionpoints =
              snapshot.data!;
          return Scaffold(
            drawer: const NavBar(),
            appBar: const AppBarWidget(text: 'Collection Point'),
            body: ListView.separated(
              itemCount: missionscollectionpoints.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Color.fromARGB(255, 198, 115, 115),
              ),
              itemBuilder: (BuildContext context, int index) {
                MissionsCollectionPoints missioncollectionpoints =
                    missionscollectionpoints[index];
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mission:  ${missioncollectionpoints.missionName}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Collection Point:  ${missioncollectionpoints.collectionPointName}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'City: ${missioncollectionpoints.city}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'District: ${missioncollectionpoints.district}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Country: ${missioncollectionpoints.country}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Postal Code: ${missioncollectionpoints.postalcode}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Street: ${missioncollectionpoints.street}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Week days: ${missioncollectionpoints.weekDays}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Open Hour: ${missioncollectionpoints.initialHour.toString()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Closed Hour: ${missioncollectionpoints.endHour.toString()}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
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
