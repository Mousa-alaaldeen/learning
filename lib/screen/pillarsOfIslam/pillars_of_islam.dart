import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PillarsOfIslam extends StatefulWidget {
  const PillarsOfIslam({Key? key}) : super(key: key);

  @override
  State<PillarsOfIslam> createState() => _PillarsOfIslamState();
}

class _PillarsOfIslamState extends State<PillarsOfIslam> {
  int selectedAnimalIndex = -1;

  final List<String> pillarsOfIslam = const [
    'الشهادة - الإيمان بأن لا إله إلا الله وأن محمدًا رسول الله',
    'الصلاة - أداء الصلوات الخمس في اليوم والليلة',
    'الزكاة - دفع الزكاة أو الصدقات للفقراء والمحتاجين',
    'الصوم - صيام شهر رمضان من الفجر حتى المغرب',
    'الحج - أداء فريضة الحج إذا كانت الإمكانيات تسمح بها',
  ];

  FlutterTts flutterTts = FlutterTts();

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(126, 170, 146, 10),
        centerTitle: true,
        title: const Text(
          ' أركان الإسلام',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(w / 30),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: pillarsOfIslam.length,
          itemBuilder: (BuildContext c, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: 30,
                verticalOffset: 300.0,
                child: FlipAnimation(
                  duration: const Duration(milliseconds: 3000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  flipAxis: FlipAxis.y,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: EdgeInsets.only(bottom: w / 20),
                    height: w / 4,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(126, 170, 146, 10),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            pillarsOfIslam[index],
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            _speak(pillarsOfIslam[index]);
                          },
                          icon: const Icon(Icons.volume_up),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }
}
