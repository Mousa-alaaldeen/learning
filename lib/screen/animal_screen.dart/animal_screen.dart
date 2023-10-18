import 'package:flutter/material.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/models/animal_model.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({Key? key}) : super(key: key);

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  int selectedAnimalIndex = 0; // قيمة ابتدائية لا تحدد أي عنصر محدد

  final List<AnimalModel> animalsList = [
    AnimalModel(
      imagePath: AppImages.ANIMALS,
      soundPath: 'assets/sounds/lion.mp3',
      name: 'أسد',
    ),
    AnimalModel(
      imagePath: AppImages.muslem,
      soundPath: 'assets/sounds/duck.mp3',
      name: 'بطه',
    ),
    AnimalModel(
      imagePath: AppImages.LETTER_AR,
      soundPath: 'assets/sounds/duck.mp3',
      name: 'بطه',
    ),
    AnimalModel(
      imagePath: AppImages.muslem,
      soundPath: 'assets/sounds/duck.mp3',
      name: 'بطه',
    ),
    AnimalModel(
      imagePath: AppImages.LETTER_AR,
      soundPath: 'assets/sounds/duck.mp3',
      name: 'بطه',
    ),
    AnimalModel(
      imagePath: AppImages.muslem,
      soundPath: 'assets/sounds/duck.mp3',
      name: 'بطه',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(158, 210, 190, 10),
        centerTitle: true,
        title: const Text('أصوات الحيوانات', style: Styles.textStyle25),
      ),
      body: Column(
        children: [
          Image.asset(
            animalsList[selectedAnimalIndex].imagePath,
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // عدد العناصر في السطر الواحد
              ),
              itemCount: animalsList.length, // عدد الحيوانات في القائمة
              itemBuilder: (context, index) {
                final animal = animalsList[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAnimalIndex = index;
                    });
                    // هنا يمكنك تشغيل الصوت الخاص بالحيوان عند النقر عليه باستخدام مكتبة audioplayers.
                  },
                  child: Card(
                    color: selectedAnimalIndex == index
                        ? const Color.fromRGBO(158, 210, 190, 10)
                        : Colors.grey.shade100,
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
                                  )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
