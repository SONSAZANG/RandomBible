import 'package:flutter/services.dart';
import 'package:RandomBible/bible.dart';

class Services {
  static Future<List<Bible>> getInfo() async {
    final String response = await rootBundle.loadString('file/test.json');
    final List<Bible> bibles = bibleFromJson(response);
    return bibles;
  }
}
