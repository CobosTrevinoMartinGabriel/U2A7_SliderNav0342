import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyAppCapcom());

class MyAppCapcom extends StatelessWidget {
  const MyAppCapcom({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'UII Act 7 slider Navigation y tabBar',
      debugShowCheckedModeBanner: false,
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        // useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: Capcom(),
    );
  }
}

class Capcom extends StatefulWidget {
  const Capcom({Key? key}) : super(key: key);

  @override
  State<Capcom> createState() => _CapcomState();
}

class _CapcomState extends State<Capcom> {
  final List<String> catal = [
    "https://raw.githubusercontent.com/CobosTrevinoMartinGabriel/Img_ios/main/FlutterFlowA12/ApolloJusticeTrilogy.jpg",
    "https://raw.githubusercontent.com/CobosTrevinoMartinGabriel/Img_ios/main/FlutterFlowA12/CapcomArcade2ndStadium.jpg",
    "https://raw.githubusercontent.com/CobosTrevinoMartinGabriel/Img_ios/main/FlutterFlowA12/DeadRising4.jpg",
    "https://raw.githubusercontent.com/CobosTrevinoMartinGabriel/Img_ios/main/FlutterFlowA12/MarvelVSCapcomUltimate.jpg",
    "https://raw.githubusercontent.com/CobosTrevinoMartinGabriel/Img_ios/main/FlutterFlowA12/GhostTrick.jpg",
    "https://raw.githubusercontent.com/CobosTrevinoMartinGabriel/Img_ios/main/FlutterFlowA12/MegaManZ_ZXLegacyCollection.jpg"
  ];
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x610051ff),
      appBar: AppBar(
        title: Text("Martin Gabriel Cobos Treviño/Slider Capcom"),
      ),
      body: Center(
          child: Column(
        children: [
          CarouselSlider(
              items: catal
                  .map((e) => Container(
                        child: Center(
                          child: Image(image: NetworkImage(e)),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                scrollDirection: Axis.vertical,
                onPageChanged: (value, _) {
                  setState(() {
                    _page = value;
                  });
                },
              )),
          buildCarouselIndicator(catal.length, _page),
        ],
      )),
    );
  }
}

buildCarouselIndicator(a, b) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < a; i++)
          Container(
            margin: EdgeInsets.all(5),
            width: i == b ? 7 : 5,
            height: i == b ? 7 : 5,
            decoration: BoxDecoration(
                color: i == b ? Color(0xffff4107) : Colors.blueGrey,
                shape: BoxShape.circle),
          )
      ],
    ),
  );
}
