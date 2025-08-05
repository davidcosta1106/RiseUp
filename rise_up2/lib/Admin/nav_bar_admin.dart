import 'package:flutter/material.dart';
import 'package:rise_up2/Admin/main_page_admin.dart';
import 'package:rise_up2/Admin/users.dart';
import 'package:rise_up2/Pages/Authentication/request_login.dart';

class NavBarAdmin extends StatelessWidget {
  const NavBarAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Admin'),
            accountEmail: const Text('admin@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('assets/images/admin.jpeg')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.menu_book_sharp),
            title: const Text('Missions'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPageAdmin(),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.support_agent_outlined),
            title: const Text('Users'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditUsersPage(),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RequestLogin(),
                ),
              );
            },
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          const Column(
            children: [
              SizedBox(
                height: 300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
