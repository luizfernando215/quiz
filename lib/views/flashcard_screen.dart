import 'dart:developer' as dev;
import 'dart:math';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flashcards_quiz/views/quiz_screen.dart';
import 'package:flashcards_quiz/widgets/flash_card_widget.dart';
import 'package:flashcards_quiz/widgets/linear_progress_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewCard extends StatefulWidget {
  final String topicName;
  final List<dynamic> typeOfTopic;
  const NewCard({super.key, required this.topicName, required this.typeOfTopic});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    //const Color bgColor = Color(0xFF4993FA);
    const Color bgColor3 = Color(0xFF5170FD);
    const Color cardColor = Color(0xFF4993FA);

    // Get a list of 4 randomly selected Questions objects
    Map<dynamic, dynamic> randomQuestionsMap = getRandomQuestionsAndOptions(widget.typeOfTopic, 4);

    List<dynamic> randomQuestions = randomQuestionsMap.keys.toList();
    dynamic randomOptions = randomQuestionsMap.values.toList();

    return Scaffold(
      backgroundColor: bgColor3,
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(right: 18.0),
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.clear,
                        color: Colors.white,
                        weight: 10,
                      ),
                    ),
                    MyProgressIndicator(
                      questionlenght: randomQuestions,
                      optionsList: randomOptions,
                      topicType: widget.topicName,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.height * 0.60,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: AppinioSwiper(
                    loop: true,
                    backgroundCardCount: 2,
                    swipeOptions: const SwipeOptions.all(),
                    controller: controller,
                    onSwipeEnd: _swipeEnd,
                    onEnd: _onEnd,
                    cardCount: randomQuestions.length,
                    cardBuilder: (BuildContext context, int index) {
                      var cardIndex = randomQuestions[index];
                      return FlipCardsWidget(
                        bgColor: cardColor,
                        cardsLenght: randomQuestions.length,
                        currentIndex: index + 1,
                        answer: cardIndex.correctAnswer.text,
                        question: cardIndex.text,
                        currentTopic: widget.topicName,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(cardColor),
                      fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width * 0.85, 30),
                      ),
                      elevation: MaterialStateProperty.all(4),
                    ),
                    onPressed: () => controller.unswipe(),
                    child: const Text(
                      "Reorder Cards",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(cardColor),
                      fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.sizeOf(context).width * 0.85, 30),
                      ),
                      elevation: MaterialStateProperty.all(4),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            questionlenght: randomQuestions,
                            optionsList: randomOptions,
                            topicType: widget.topicName,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Start Quiz",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Map<dynamic, dynamic> getRandomQuestionsAndOptions(
  List<dynamic> allQuestions,
  int count,
) {
  final randomQuestions = <dynamic>[];
  final randomOptions = <dynamic>[];
  final random = Random();

  if (count >= allQuestions.length) {
    count = allQuestions.length;
  }

  while (randomQuestions.length < count) {
    final randomIndex = random.nextInt(allQuestions.length);
    final selectedQuestion = allQuestions[randomIndex];

    if (!randomQuestions.contains(selectedQuestion)) {
      randomQuestions.add(selectedQuestion);
      randomOptions.add(selectedQuestion.options);
    }
  }

  return Map.fromIterables(randomQuestions, randomOptions);
}

// List<dynamic> getRandomQuestions(List<dynamic> allQuestions, int count) {
//   if (count >= allQuestions.length) {
//     return List.from(allQuestions);
//   }
//   List<dynamic> randomQuestions = [];

//   List<int> indexes = List.generate(allQuestions.length, (index) => index);
//   final random = Random();

//   while (randomQuestions.length < count) {
//     final randomIndex = random.nextInt(indexes.length);
//     final selectedQuestionIndex = indexes[randomIndex];
//     final selectedQuestion = allQuestions[selectedQuestionIndex];
//     randomQuestions.add(selectedQuestion);

//     indexes.removeAt(randomIndex);
//   }
//   return randomQuestions;
// }

void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
  switch (activity) {
    case Swipe():
      dev.log('The card was swiped to the : ${activity.direction}');
      dev.log('previous index: $previousIndex, target index: $targetIndex');
      break;
    case Unswipe():
      dev.log('A ${activity.direction.name} swipe was undone.');
      dev.log('previous index: $previousIndex, target index: $targetIndex');
      break;
    case CancelSwipe():
      dev.log('A swipe was cancelled');
      break;
    case DrivenActivity():
      dev.log('Driven Activity');
      break;
  }
}

void _onEnd() {
  dev.log('end reached!');
}
