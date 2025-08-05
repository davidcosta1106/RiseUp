import 'package:flutter/material.dart';
import 'package:rise_up2/Admin/main_page_admin.dart';
import 'package:rise_up2/Data/fetch_mission_data.dart';
import 'package:rise_up2/models/missions.dart';

class EditMissionsPage extends StatefulWidget {
  final Missions missions;

  const EditMissionsPage({required this.missions, Key? key}) : super(key: key);

  @override
  _EditMissionsPageState createState() => _EditMissionsPageState();
}

class _EditMissionsPageState extends State<EditMissionsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPageAdmin(),
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Edit Mission',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: widget.missions.missionName,
                decoration: const InputDecoration(labelText: 'Missions Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name to the mission';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) {
                    widget.missions.missionName = value;
                  }
                },
              ),
              TextFormField(
                initialValue: widget.missions.locality.toString(),
                decoration: const InputDecoration(labelText: 'Locality'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a locality to the mission';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) {
                    widget.missions.locality = (value);
                  }
                },
              ),
              TextFormField(
                initialValue: widget.missions.descriptionMission,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Nacionalidade';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) {
                    widget.missions.descriptionMission = value;
                  }
                },
              ),
              TextFormField(
                initialValue:
                    widget.missions.dateMission.toString().split(' ')[0],
                decoration: const InputDecoration(labelText: 'Mission Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date to the mission';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) {
                    widget.missions.dateMission = DateTime.parse(value);
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    FetchDataMissions.putMissions(widget.missions);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Mission Updated'),
                          content: const Text(
                              'The mission has been updated successfully.'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainPageAdmin(),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Update Mission'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
