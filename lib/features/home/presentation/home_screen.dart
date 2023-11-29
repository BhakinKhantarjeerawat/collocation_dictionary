import 'package:collocation_dictionary/features/screen1.dart/presentation/screen1.dart';
import 'package:collocation_dictionary/features/screen2/presentation/second2.dart';
import 'package:collocation_dictionary/features/screen4/presentation/screen4.dart';
import 'package:collocation_dictionary/features/screen3/presentaion/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0; //New

//New
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget selectedScreen(index) {
    switch (index) {
      case 0:
        return const FirstScreen();
      case 1:
        return const SecondScreen();
      case 2:
        return const ThirdScreen();
      case 3:
        return const SettingsScreen();
      default:
        return const FirstScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => _onItemTapped(value),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.a,
                color: _selectedIndex == 0 ? Colors.blueAccent : Colors.grey),
            label: 'เรียนรู้',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.b,
                color: _selectedIndex == 1 ? Colors.blueAccent : Colors.grey),
            label: 'กลุ่มคำ',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.c,
                color: _selectedIndex == 2 ? Colors.blueAccent : Colors.grey),
            label: 'สตอรี่',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,
                color: _selectedIndex == 3 ? Colors.blueAccent : Colors.grey),
            label: 'ตั้งค่า',
          ),
        ],
      ),
    );
  }
}
