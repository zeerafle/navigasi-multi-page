import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const DrawerHeader(
            child: ListTile(
          leading: Icon(Icons.person),
          title: Text("Vauwez Sam El Fareez"),
        )),
        ListTile(
            title: const Text("Dashboard"),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pushNamed(context, "/main");
            }),
        ListTile(
            title: const Text("Booking"),
            leading: const Icon(Icons.schedule_send),
            onTap: () {
              Navigator.pushNamed(context, "/booking");
            }),
        ListTile(
          title: const Text("Keluar"),
          leading: const Icon(Icons.logout),
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
        )
      ]),
    );
  }
}
