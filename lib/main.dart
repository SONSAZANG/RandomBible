import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

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
  int bibleCount = 0;
  int bgTitlesCount = 0;

  final List<Map<String, String>> bibles = [
    {
      'title': "창세기 1장 1절",
      'description': "태초에 하나님이\n천지를 창조하시니라",
    },
    {
      'title': "창세기 1장 2절",
      'description': "땅이혼돈하고 공허하며\n흑암이 깊음 위에 있고\n하나님의 영은 수면 위에 운행하시니라",
    },
    {
      'title': "히브리서 4:16",
      'description':
          "그러므로 우리가 긍휼하심을 받고\n때를 따라 돕는 은혜를 얻기 위하여\n은혜의 보좌 앞에\n담대히 나아갈 것이니라",
    },
    {
      'title': "누가복음 2:20",
      'description':
          "목자가 자기들에게\n이른던 바와 같이 듣고 본\n그 모든 것을 인하여\n하나님께 영광을 돌리고\n찬송하며 돌아가니라",
    },
    {
      'title': "시편 119:10",
      'description': "내가 전심으로\n주를 찾았사오니\n주의 계명에서\n떠나지 말게 하소서",
    },
  ];
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
      bibleCount = Random().nextInt(bibles.length);
      bgTitlesCount = Random().nextInt(bgTitles.length);
      title = bibles[bibleCount].values.first;
      description = bibles[bibleCount].values.last;
      bgTitle = bgTitles[bgTitlesCount];
    });
  }

  void loadJson() {
    var list_data = [
      {"verseid": "창세기 1장 1절", "verse": "태초에 하나님이\\n천지를 창조하시니라"},
      {
        "verseid": "창세기 1장 2절",
        "verse": "땅이혼돈하고 공허하며\\n흑암이 깊음 위에 있고\\n하나님의 영은 수면 위에 운행하시니라"
      },
      {
        "verseid": "히브리서 4:16",
        "verse":
            "그러므로 우리가 긍휼하심을 받고\\n때를 따라 돕는 은혜를 얻기 위하여\\n은혜의 보좌 앞에\\n담대히 나아갈 것이니라"
      },
      {
        "verseid": "누가복음 2:20",
        "verse":
            "목자가 자기들에게\\n이른던 바와 같이 듣고 본\\n그 모든 것을 인하여\\n하나님께 영광을 돌리고\\n찬송하며 돌아가니라"
      },
      {
        "verseid": "시편 119:10",
        "verse": "내가 전심으로\\n주를 찾았사오니\\n주의 계명에서\\n떠나지 말게 하소서"
      }
    ];
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
                style: GoogleFonts.getFont('Nanum Brush Script',
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Nanum Brush Script',
                    fontSize: 30, color: Colors.black),
              ),
              const SizedBox(
                width: 30,
                height: 30,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Nanum Brush Script',
                  fontSize: 25,
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
