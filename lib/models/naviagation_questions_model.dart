class NavigateQuestion {
  final int id;
  final String text;
  final List<NavigationsOption> options;
  bool isLocked;
  NavigationsOption? selectedWiidgetOption;
  NavigationsOption? correctAnswer;

  NavigateQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
  });

  NavigateQuestion copyWith() {
    return NavigateQuestion(
      id: id,
      text: text,
      options: options.map((option) => NavigationsOption(text: option.text, isCorrect: option.isCorrect)).toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class NavigationsOption {
  final String text;
  final bool isCorrect;

  const NavigationsOption({
    required this.text,
    required this.isCorrect,
  });
}

final navigateQuestionsList = [
  NavigateQuestion(
    text: "",
    options: [
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const NavigationsOption(text: "", isCorrect: true),
  ),
  NavigateQuestion(
    text: "",
    options: [
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const NavigationsOption(text: "", isCorrect: true),
  ),
  NavigateQuestion(
    text: "",
    options: [
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const NavigationsOption(text: "", isCorrect: true),
  ),
  NavigateQuestion(
    text: "",
    options: [
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
    ],
    id: 4,
    correctAnswer: const NavigationsOption(text: "", isCorrect: true),
  ),
  NavigateQuestion(
    text: "",
    options: [
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const NavigationsOption(text: "", isCorrect: true),
  ),
  NavigateQuestion(
    text: "",
    options: [
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
    ],
    id: 6,
    correctAnswer: const NavigationsOption(text: "", isCorrect: true),
  ),
  NavigateQuestion(
    text: "",
    options: [
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const NavigationsOption(text: "", isCorrect: true),
  ),
  NavigateQuestion(
    text: "",
    options: [
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const NavigationsOption(text: "", isCorrect: true),
  ),
  NavigateQuestion(
    text: "",
    options: [
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
    ],
    id: 8,
    correctAnswer: const NavigationsOption(text: "", isCorrect: true),
  ),
  NavigateQuestion(
    text: "",
    options: [
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
      const NavigationsOption(text: "", isCorrect: false),
    ],
    id: 9,
    correctAnswer: const NavigationsOption(text: "", isCorrect: true),
  ),
];
