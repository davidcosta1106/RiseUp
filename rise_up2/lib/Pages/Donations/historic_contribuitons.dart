import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise_up2/Data/fetch_monetary_donations.dart';
import 'package:rise_up2/Pages/Navegation_Bar/nav_bar.dart';
import 'package:rise_up2/models/monetary_donations.dart';
import '../../widgets/AppBarWidget/app_bar_nav_bar.dart';

class HistoricContribuitonsPage extends StatefulWidget {
  const HistoricContribuitonsPage({Key? key}) : super(key: key);

  @override
  State<HistoricContribuitonsPage> createState() =>
      _HistoricContribuitonsPageState();
}

class _HistoricContribuitonsPageState extends State<HistoricContribuitonsPage> {
  final json = FetchDataMonetaryDonations.getMonetaryDonations();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder<List<MonetaryDonations>>(
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

          List<MonetaryDonations> monetaryDonations = snapshot.data!;
          return Scaffold(
            drawer: const NavBar(),
            appBar: const AppBarWidget(text: 'Historic Contribuitons'),
            body: ListView.separated(
              itemCount: monetaryDonations.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Color.fromARGB(255, 198, 115, 115),
              ),
              itemBuilder: (BuildContext context, int index) {
                MonetaryDonations monetaryDonation = monetaryDonations[index];
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mission: ${monetaryDonation.missionName}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Association Name: ${monetaryDonation.associationName}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Association Base District: ${monetaryDonation.baseDistrict}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Association Base Country: : ${monetaryDonation.baseCountry}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Association Iban: ${monetaryDonation.iban}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Value Donated: ${monetaryDonation.monetaryValue} €',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Payment Method Used: ${monetaryDonation.paymentMethod}',
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
