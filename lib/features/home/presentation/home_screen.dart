import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/features/screen1/presentation/screen1.dart';
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

  final _screen = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.white,
              // Color.fromARGB(255, 225, 243, 226),
              Color.fromARGB(255, 199, 245, 201)
            ])),
        child: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          // notchMargin: 4,
          height: 72,
          elevation: 0,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                  text: "Screen1",
                  icon: FontAwesomeIcons.a,
                  selected: _selectedIndex == 0,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                IconBottomBar(
                  text: "Screen2",
                  icon: FontAwesomeIcons.b,
                  selected: _selectedIndex == 1,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
                IconBottomBar(
                  text: "Screen3",
                  icon: FontAwesomeIcons.c,
                  selected: _selectedIndex == 2,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
                IconBottomBar(
                  text: "Settings",
                  icon: Icons.settings,
                  selected: _selectedIndex == 3,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends ConsumerWidget {
  const IconBottomBar(
      {required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      super.key});
  final String text;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(icon,
                size: 27,
                color: selected ? Colors.blueAccent : Colors.grey.shade500)),
        gapH4,
        Text(text,
            style: TextStyle(
                fontSize: 16,
                height: .1,
                fontWeight: FontWeight.w500,
                color: selected ? Colors.blueAccent : Colors.grey.shade500)),
        // gapH4,s
      ],
    );
  }
}
