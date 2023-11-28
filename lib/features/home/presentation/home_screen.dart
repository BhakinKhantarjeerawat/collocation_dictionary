import 'package:collocation_dictionary/features/screen1.dart/presentation/screen1.dart';
import 'package:collocation_dictionary/features/screen2/presentation/second2.dart';
import 'package:collocation_dictionary/features/screen4/presentation/screen4.dart';
import 'package:collocation_dictionary/features/screen3/presentaion/screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => _onItemTapped(value),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_for_education_outlined),
            label: 'เรียนรู้',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
