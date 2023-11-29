import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool nightMode = false;
  bool thaiVoiceText = true;
  bool speakingExercise = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const MyText('Settings', 29),
      ),
      body: Column(
        children: [
          gapH16,
          ListTile(
            leading: const MyText('โหมดกลางคืน', 21),
            trailing: Switch(
              // thumb color (round icon)
              activeColor: Colors.amber,
              activeTrackColor: Colors.cyan,
              // inactiveThumbColor: Colors.blueGrey.shade600,
              inactiveTrackColor: Colors.grey.shade400,
              splashRadius: 50.0,
              value: nightMode,
              onChanged: (value) => setState(() => nightMode = value),
            ),
          ),
          ListTile(
            leading: const MyText('คำอ่านไทย', 21),
            trailing: Switch(
              // thumb color (round icon)
              activeColor: Colors.amber,
              activeTrackColor: Colors.cyan,
              // inactiveThumbColor: Colors.blueGrey.shade600,
              inactiveTrackColor: Colors.grey.shade400,
              splashRadius: 50.0,
              value: thaiVoiceText,
              onChanged: (value) => setState(() => thaiVoiceText = value),
            ),
          ),
          ListTile(
            leading: const MyText('แบบฝึกหัดพูด', 21),
            trailing: Switch(
              // thumb color (round icon)
              activeColor: Colors.amber,
              activeTrackColor: Colors.cyan,
              // inactiveThumbColor: Colors.blueGrey.shade600,
              inactiveTrackColor: Colors.grey.shade400,
              splashRadius: 50.0,
              value: speakingExercise,
              onChanged: (value) => setState(() => speakingExercise = value),
            ),
          ),
        ],
      ),
    );
  }
}
