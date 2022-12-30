import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int count = 0;
  final List<Map<String, String>> bibles = [
    {
      'titleA': "창세기 1장 1절",
      'descriptingA': "태초에 하나님이 천지를 창조하시니라",
    },
    {
      'titleA': "창세기 1장 2절",
      'descriptingA': "땅이혼돈하고 공허하며 흑암이 깊음 위에 있고 하나님의 영은 수면 위에 운행하시니라",
    },
  ];
  final List<String> BGTitles = [
    "images/BG01.png",
    "images/BG02.png",
    "images/BG03.png",
    "images/BG04.png",
    "images/BG05.png",
  ];
  String titleA = "";
  String descriptingA = "";
  String BGTitle = "images/BG01.png";
  void changeTitle() {
    setState(() {
      titleA = bibles[count].values.first;
      descriptingA = bibles[count].values.last;
      count++;
      BGTitle = BGTitles[Random().nextInt(6)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(BGTitle), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '말씀 뽑기',
              style: GoogleFonts.getFont('Nanum Brush Script',
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              titleA,
              style: GoogleFonts.getFont('Nanum Brush Script',
                  fontSize: 30, color: Colors.black),
            ),
            Text(
              descriptingA,
              style: GoogleFonts.getFont('Nanum Brush Script',
                  fontSize: 30, color: Colors.black),
            ),
            ElevatedButton(
                onPressed: () => {changeTitle()}, child: Text('말씀 뽑기'))
          ],
        ),
      ),
    );
  }
}
