import 'package:flutter_tts/flutter_tts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'tts_provider.g.dart';

@riverpod
FlutterTts tts(TtsRef ref) {
  // await flutterTts.setLanguage("en-US");
  return FlutterTts();
} 
