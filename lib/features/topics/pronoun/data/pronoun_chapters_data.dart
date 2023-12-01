import 'package:collocation_dictionary/features/home/presentation/home_screen.dart';
import 'package:collocation_dictionary/features/topics/chapter_explain_page.dart';
import 'package:collocation_dictionary/features/topics/chapter_widget.dart';
import 'package:collocation_dictionary/features/topics/pronoun/presentation/chapters_intro/chapter_explain_page_view.dart';
import 'package:collocation_dictionary/gen/assets.gen.dart';

List<ChapterWidget> pronounChaptersList = [
  ChapterWidget(
    imagePath: Assets.images.intro.path,
    title: 'พื้นฐาน',
    navigateTo: ChapterExplainPageView(chapters: pronoun0List),
  ),
  ChapterWidget(
    imagePath: Assets.images.list.path,
    title: 'แบบธรรมดา',
    navigateTo: ChapterExplainPageView(chapters: pronoun1List),
  ),
  ChapterWidget(
    imagePath: Assets.images.list.path,
    title: 'แบบแสดงความเป็นเจ้าของ',
    navigateTo: const HomeScreen(),
  ),
  ChapterWidget(
      imagePath: Assets.images.list.path,
      title: 'แบบถูกกระทำ',
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

List<ChapterExplainPage> pronoun0List = [
  const ChapterExplainPage(
      title: 'Basics',
      explanations:
          'คำสรรพนาม \nคือ\nคำที่ใช้แทนคำนาม  เพื่อประหยัดเวลาในการพูด  แทนที่จะใช้คำเต็มหรือชื่อเต็ม\nตัวอย่าง\n- ใช้ เขา(1พยางค์) แทน เดวิทแบ็คแฮ็ม(4พยางค์)  ใช้พวกมัน(2 พยางค์) แทน นกไก่เป็ดนกและกระจอกเทศ(8พยางค์)',
      pageNumber: 0),
  const ChapterExplainPage(
      title: 'Basics',
      explanations:
          'คำสรรพนาม ในภาษาอังกฤษ แบ่งได้ 3 ประเภท\nได้แก่\n(1)แบบธรรมดา เช่น ฉัน คุณ เขา หล่อน มัน พวกเรา พวกมัน\n(2)แบบแสดงความเป็นเจ้าของเช่น ของฉัน ของคุณ ของเขา ของเธอ(ผู้หญิง) ของพวกเรา ของพวกมัน/ของพวกเขา',
      pageNumber: 0),
];

List<ChapterExplainPage> pronoun1List = [
  const ChapterExplainPage(
      title: 'Normal Pronoun',
      explanations:
          'คำสรรพนามแบบธรรมดา มีข้อสังเกตุว่า You(ยู) หมายความได้ทั้งคุณคนเดียวและพวกคุณ แต่จะใช้กริยาประเภทที่ใช้กับประธานพหูพจน์เสมอ  เช่น อา ยู เรดดี้ (Are you read?) ที่แปลว่าคุณพร้อมแล้วหรือยัง หรือ ดู ยู แฮฟ โฮม เวิร์คซ์ (Do you have homeworks?)',
      pageNumber: 0),
  // const ChapterExplainPage(
  //     title: 'Basics',
  //     explanations:
  //         'คำสรรพนาม ในภาษาอังกฤษ แบ่งได้ 3 ประเภท\nได้แก่\n(1)แบบธรรมดา เช่น ฉัน คุณ เขา หล่อน มัน พวกเรา พวกมัน\n(2)แบบแสดงความเป็นเจ้าของเช่น ของฉัน ของคุณ ของเขา ของเธอ(ผู้หญิง) ของพวกเรา ของพวกมัน/ของพวกเขา',
  //     pageNumber: 0),
];
