import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rise_up2/Admin/main_page_admin.dart';
import 'package:rise_up2/Data/fetch_mission_data.dart';
import 'package:rise_up2/models/missions.dart';

class AddMissionPage extends StatefulWidget {
  final Missions missions;

  const AddMissionPage({required this.missions, Key? key}) : super(key: key);

  @override
  _AddMissionPageState createState() => _AddMissionPageState();
}

class _AddMissionPageState extends State<AddMissionPage> {
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
          'Add a new Mission',
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
              TextFormField(
                decoration: const InputDecoration(labelText: 'State Mission'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date to the mission';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) {
                    widget.missions.stateMission;
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Financed Amount'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date to the mission';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) {
                    widget.missions;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    FetchDataMissions.postMissions(widget.missions);

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Create Mission'),
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
                child: const Text('Mission Created'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
