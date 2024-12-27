import 'package:flutter/material.dart';
import 'package:pertemuan_6/model/user.dart';
import 'package:pertemuan_6/pages/edit_profile.dart';
import 'package:pertemuan_6/pages/profile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => User(),
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/drawer',
      routes: {
        '/profile': (context) => const Profile(),
        '/edit': (context) => const EditProfile(),
        '/tab': (context) => const TabNav(),
        '/drawer': (context) => const DrawNav()
      }
    );
  }
}

class TabNav extends StatelessWidget {
  const TabNav({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab Navigation"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.settings))
            ]
          )
        ),
        body: const TabBarView(
          children: [
            Profile(),
            EditProfile()
          ],
        )
      )
    );
  }
}

class DrawNav extends StatefulWidget {
  const DrawNav({super.key});

  @override
  State<DrawNav> createState() => _DrawNavState();
}

class _DrawNavState extends State<DrawNav> {
  int selectedIndex = 0;

  List<Widget> pages = [
    const Profile(),
    const EditProfile()
  ];

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Navigation"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: pages[selectedIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightBlue), 
              child: Text("Drawer"),
            ),
            ListTile(
              title: const Text('My Profile'),
              onTap: () {
                changePage(0);
              }
            ),
            ListTile(
              title: const Text('Edit Profile'),
              onTap: () {
                changePage(1);
              }
            )
          ],
        )
      )
    );
  }
}