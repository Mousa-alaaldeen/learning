import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learning/component/app_audio.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/models/animal_model.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({Key? key}) : super(key: key);

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  @override
  void initState() {
    super.initState;
    playWelcomeSound();
  }

  void playWelcomeSound() async {
    await player.play(AssetSource(AppOudio.bird_oudio));
  }

  int selectedAnimalIndex = 0;
  final List<AnimalModel> animalsList = [
    AnimalModel(
      imagePath: AppImages.bird_oudio,
      soundPath: AppOudio.bird_oudio,
      name: 'عصفور',
    ),
    AnimalModel(
      imagePath: AppImages.camel_oudio,
      soundPath: AppOudio.camel_oudio,
      name: 'جمل',
    ),
    AnimalModel(
      imagePath: AppImages.cat_oudio,
      soundPath: AppOudio.cat_oudio,
      name: 'قطه',
    ),
    AnimalModel(
      imagePath: AppImages.cheep_oudio,
      soundPath: AppOudio.cheep_oudio,
      name: 'خروف',
    ),
    AnimalModel(
      imagePath: AppImages.chicken_oudio,
      soundPath: AppOudio.chicken_oudio,
      name: 'ديك',
    ),
    AnimalModel(
      imagePath: AppImages.dog_oudio,
      soundPath: AppOudio.dog_oudio,
      name: 'كلب',
    ),
    AnimalModel(
      imagePath: AppImages.elephant_oudio,
      soundPath: AppOudio.elephant_oudio,
      name: 'فيل',
    ),
    AnimalModel(
      imagePath: AppImages.frog_oudio,
      soundPath: AppOudio.frog_oudio,
      name: 'ضفدع',
    ),
    AnimalModel(
      imagePath: AppImages.lion_oudio,
      soundPath: AppOudio.lion_oudio,
      name: 'أسد',
    ),
    AnimalModel(
      imagePath: AppImages.monkey_oudio,
      soundPath: AppOudio.monkey_oudio,
      name: 'قرد',
    ),
    AnimalModel(
      imagePath: AppImages.donkey,
      soundPath: AppOudio.donkey,
      name: 'حمار',
    ),
    AnimalModel(
      imagePath: AppImages.mouse,
      soundPath: AppOudio.mouse,
      name: 'فأر',
    ),
    AnimalModel(
      imagePath: AppImages.wolf_oudio,
      soundPath: AppOudio.wolf,
      name: 'ذئب',
    ),
    AnimalModel(
      imagePath: AppImages.cow,
      soundPath: AppOudio.cow,
      name: 'بقره',
    ),
    AnimalModel(
      imagePath: AppImages.duck,
      soundPath: AppOudio.duck,
      name: 'بطه',
    ),
    AnimalModel(
      imagePath: AppImages.gorilla,
      soundPath: AppOudio.gorilla,
      name: 'غوريلا',
    ),
    AnimalModel(
      imagePath: AppImages.bear,
      soundPath: AppOudio.bear,
      name: 'دب',
    ),
    AnimalModel(
      imagePath: AppImages.horse,
      soundPath: AppOudio.horse,
      name: 'حصان',
    ),
  ];
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors5,
        centerTitle: true,
        title: const Text('أصوات الحيوانات', style: Styles.textStyle25),
      ),
      body: Column(
        children: [
          AnimalImage(
              animalsList: animalsList,
              selectedAnimalIndex: selectedAnimalIndex),
          const SizedBox(
            height: 10,
          ),
          itemAnimals(),
        ],
      ),
    );
  }

  Expanded itemAnimals() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: animalsList.length, // عدد الحيوانات في القائمة
        itemBuilder: (context, index) {
          final animal = animalsList[index];
          return GestureDetector(
            onTap: () async {
              setState(() {
                selectedAnimalIndex = index;
              });
              if (player.state == PlayerState.playing) {
                await player.stop();
              }
              await player.play(AssetSource(animalsList[index].soundPath));
            },
            child: Card(
              color: selectedAnimalIndex == index ? colors5 : Colors.white,
              child: Column(
                children: [
                  Expanded(child: Image.asset(animal.imagePath)),
                  Text(
                    animal.name,
                    style: Styles.textStyle20,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: selectedAnimalIndex == index
                        ? const Icon(Icons.volume_up_outlined)
                        : Icon(
                            Icons.abc_outlined,
                            color: Colors.grey.shade100,
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
}

class AnimalImage extends StatelessWidget {
  const AnimalImage({
    Key? key,
    required this.animalsList,
    required this.selectedAnimalIndex,
  }) : super(key: key);

  final List<AnimalModel> animalsList;
  final int selectedAnimalIndex;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      animalsList[selectedAnimalIndex].imagePath,
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }
}
