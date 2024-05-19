import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kritik_version_2023/components/book_mark_page.dart';
import 'package:kritik_version_2023/components/classEstablishment.dart';
import 'package:kritik_version_2023/components/home_page.dart';
import 'package:kritik_version_2023/components/fetch_data.dart';
import 'package:kritik_version_2023/components/notification_page.dart';
import 'package:kritik_version_2023/components/profile_page.dart';

void main() async {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kritik version 2023',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Kritik Demo homepage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool isPopupShown = false;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    NotificationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> showPopup() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: const SizedBox(
              width: 300.0,
              height: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Sign In Required",
                      style: TextStyle(
                        fontSize: 25,
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Log in required',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 20),
                    padding: const EdgeInsets.all(16.0),
                    backgroundColor: const Color(0xffFC9E4F),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isPopupShown) {
        showPopup();
        isPopupShown = true;
      }
    });
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('KRITIK Test'),
      // ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.turned_in),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff07A0C3),
        onTap: _onItemTapped,
        unselectedItemColor: Colors.black,
        iconSize: 35,
      ),
    );
  }
}
