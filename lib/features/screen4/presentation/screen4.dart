import 'package:collocation_dictionary/common_widgets/my_text.dart';
import 'package:collocation_dictionary/constants/app_sizes.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen4 extends ConsumerStatefulWidget {
  const Screen4({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Screen4State();
}

class _Screen4State extends ConsumerState<Screen4> {
  bool nightMode = false;
  bool thaiVoiceText = true;
  bool speakingExercise = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   title: const MyText('Settings', 29),
      //   leading: const SizedBox(),
      // ),
      body: Stack(
        children: [
          Image.asset(Assets.images.light.path,
              height: double.infinity, fit: BoxFit.cover),
          Column(
            children: [
              gapH64,
              const MyText('Settings', 29),
              gapH16,
              ListTile(
                leading: const MyText('โหมดกลางคืน', 21),
                trailing: Switch(
                  activeColor: Colors.amber,
                  activeTrackColor: Colors.cyan,
                  inactiveTrackColor: Colors.grey.shade400,
                  splashRadius: 50.0,
                  value: nightMode,
                  onChanged: (value) => setState(() => nightMode = value),
                ),
              ),
              ListTile(
                leading: const MyText('คำอ่านไทย', 21),
                trailing: Switch(
                  activeColor: Colors.amber,
                  activeTrackColor: Colors.cyan,
                  inactiveTrackColor: Colors.grey.shade400,
                  splashRadius: 50.0,
                  value: thaiVoiceText,
                  onChanged: (value) => setState(() => thaiVoiceText = value),
                ),
              ),
              ListTile(
                leading: const MyText('แบบฝึกหัดพูด', 21),
                trailing: Switch(
                  activeColor: Colors.amber,
                  activeTrackColor: Colors.cyan,
                  inactiveTrackColor: Colors.grey.shade400,
                  splashRadius: 50.0,
                  value: speakingExercise,
                  onChanged: (value) =>
                      setState(() => speakingExercise = value),
                ),
              ),
              gapH32,
              const ListTile(
                leading: MyText('ข้อมูลผู้ใช้', 21),
              ),
              const ListTile(
                leading: MyText('วิธีใช้งาน', 21),
              ),
              const ListTile(
                leading: MyText('เกี่ยวกับเรา', 21),
              ),
              gapH32,
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                      gapW16,
                      MyText('Facebook', 18)
                    ],
                  ),
                ),
              ),
              gapH8,
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(FontAwesomeIcons.line, color: Colors.green),
                      gapW16,
                      MyText('Line', 18)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
