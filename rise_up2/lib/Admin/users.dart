import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rise_up2/Data/fetch_users.dart';
import 'package:rise_up2/models/users.dart';
import '../../widgets/AppBarWidget/app_bar_nav_bar.dart';
import 'nav_bar_admin.dart';

class EditUsersPage extends StatefulWidget {
  const EditUsersPage({Key? key}) : super(key: key);

  @override
  State<EditUsersPage> createState() => _EditUsersPageState();
}

class _EditUsersPageState extends State<EditUsersPage> {
  final json = FetchDataUsers.getUsers();
  Map<int, String> userImagePaths = {
    1: 'assets/images/user1.jpeg',
    2: 'assets/images/user3.jpeg',
    3: 'assets/images/user5.avif',
    4: 'assets/images/user4.jpg',
    5: 'assets/images/user2.jpg',
    6: 'assets/images/cyclone_mocha_myanmar.png',
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder<List<Users>>(
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

          List<Users> users = snapshot.data!;
          return Scaffold(
            drawer: const NavBarAdmin(),
            appBar: const AppBarWidget(text: 'Users'),
            body: ListView.separated(
              itemCount: users.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Color.fromARGB(255, 198, 115, 115),
              ),
              itemBuilder: (BuildContext context, int index) {
                Users user = users[index];
                return GestureDetector(
                    child: Container(
                        margin: const EdgeInsets.only(top: 2),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(70.0),
                            child: Image.asset(
                              userImagePaths[user.idUser] ??
                                  'assets/images/user1.jpeg',
                              width: 70,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            user.username,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email: ${user.email}'),
                              Text('Password: ${user.password}')
                            ],
                          ),
                          trailing:
                              Row(mainAxisSize: MainAxisSize.min, children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Delete User'),
                                      content: const Text(
                                          'Are you sure you want to delete this user?'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Delete'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            FetchDataUsers.deleteUser(
                                                user.idUser);
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'User Deleted'),
                                                  content: const Text(
                                                      'The user has been deleted successfully.'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: const Text('OK'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const EditUsersPage(),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ]),
                        )));
              },
            ),
          );
        },
      ),
    );
  }
}
