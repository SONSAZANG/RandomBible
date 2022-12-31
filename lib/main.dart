import 'dart:math';
import 'service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:RandomBible/bible.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'glorytogod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'glorytogod'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bibleCount = 0;
  int bgTitlesCount = 0;

  List<Bible> _bible = <Bible>[];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Services.getInfo().then((value) {
      setState(() {
        _bible = value;
        loading = true;
      });
    });
  }

  final List<String> bgTitles = [
    "images/BG01.png",
    "images/BG02.png",
    "images/BG03.png",
    "images/BG04.png",
    "images/BG05.png",
  ];
  String title = "";
  String description = "";
  String bgTitle = "images/BG01.png";
  void changeTitle() {
    setState(() {
      bibleCount = Random().nextInt(_bible[0].bibles.length);
      bgTitlesCount = Random().nextInt(bgTitles.length);
      title = _bible[0].bibles[bibleCount].verse;
      description = _bible[0].bibles[bibleCount].verseid;
      bgTitle = bgTitles[bgTitlesCount];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(minWidth: 380, minHeight: 800),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(bgTitle), fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '말씀 뽑기',
                style: GoogleFonts.getFont('Gowun Dodum',
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Gowun Dodum',
                    fontSize: 25, color: Colors.black),
              ),
              const SizedBox(
                width: 30,
                height: 30,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Gowun Dodum',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                  onPressed: () => {changeTitle()}, child: const Text('말씀 뽑기'))
            ],
          ),
        ),
      ),
    );
  }
}
