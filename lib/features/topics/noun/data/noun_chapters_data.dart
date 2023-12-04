import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:collocation_dictionary/features/topics/chapter_explain_page.dart';
import 'package:collocation_dictionary/features/topics/chapter_widget.dart';
import 'package:collocation_dictionary/features/topics/chapter_page_view.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';

List<ChapterWidget> nounChaptersList = [
  ChapterWidget(
    imagePath: Assets.images.intro.path,
    title: 'พื้นฐาน',
    navigateTo: ChapterPageView(chapters: noun0List),
  ),
  ChapterWidget(
    imagePath: Assets.images.list.path,
    title: 'จำนวนหนึ่งหรือมากกว่าหนึ่ง',
    navigateTo: const HomeScreen(),
  ),
  ChapterWidget(
    imagePath: Assets.images.list.path,
    title: 'นามเฉพาะ vs นามทั่วไป',
    navigateTo: const HomeScreen(),
  ),
  ChapterWidget(
      imagePath: Assets.images.list.path,
      title: 'a, an, the',
      navigateTo: const HomeScreen()),
  ChapterWidget(
      imagePath: Assets.images.list.path,
      title: 'นามนับได้ vs นับไม่ได้',
      navigateTo: const HomeScreen()),
  ChapterWidget(
      imagePath: Assets.images.summary.path,
      title: 'สรุป',
      navigateTo: const HomeScreen()),
  ChapterWidget(
    imagePath: Assets.images.quiz.path,
    title: 'แบบฝึกหัดทั้งหมด',
    navigateTo: const HomeScreen(),
  ),
];

List<ChapterExplainPage> noun0List = [
  const ChapterExplainPage(
      title: 'Basics',
      explain1:
          'คำนาม \nคือ\nคำที่ใช้เรียกคนสัตว์หรือสิ่งของ เช่น หมา แมว ตะกล้า เงิน พวกนก จอห์น',
      pageNumber: 0),
  const ChapterExplainPage(
      title: 'ประเภท',
      explain1:
          'คำนาม แบ่งได้หลายแบบ  แบ่งตามจำนวนได้เป็น แบบเอกพจน์และพหูพจน์  แบ่งตามการนับได้นับไม่ได้โดยที่คำนามนับไม่ได้เกือบทั้งหมดมักเป็นเอกพจน์',
      pageNumber: 0),
];
