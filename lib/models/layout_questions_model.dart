class LayOutQuestion {
  final int id;
  final String text;
  final List<LayOutOption> options;
  bool isLocked;
  LayOutOption? selectedWiidgetOption;
  LayOutOption? correctAnswer;
  // final int timeSeconds;

  LayOutQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
    //  required this.timeSeconds
  });

  LayOutQuestion copyWith() {
    return LayOutQuestion(
      id: id,
      text: text,
      options: options
          .map(
            (option) => LayOutOption(text: option.text, isCorrect: option.isCorrect),
          )
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class LayOutOption {
  final String text;
  final bool isCorrect;

  const LayOutOption({
    required this.text,
    required this.isCorrect,
  });
}

final layOutQuestionsList = [
  LayOutQuestion(
    text: 'Qual jogador brasileiro foi artilheiro da Copa Libertadores da América de 2020?',
    options: [
      const LayOutOption(text: "Gabigol", isCorrect: false),
      const LayOutOption(text: "Borja", isCorrect: false),
      const LayOutOption(text: "Bruno Henrique", isCorrect: false),
      const LayOutOption(text: "Rony", isCorrect: true),
    ],
    id: 0,
    correctAnswer: const LayOutOption(text: "Rony", isCorrect: true),
  ),
  LayOutQuestion(
    text: 'Qual clube brasileiro conquistou o título do Campeonato Brasileiro Série A em 2020?',
    options: [
      const LayOutOption(text: "Palmeiras", isCorrect: false),
      const LayOutOption(text: "Flamengo", isCorrect: true),
      const LayOutOption(text: "Internacional", isCorrect: false),
      const LayOutOption(text: "Corinthians", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const LayOutOption(text: "Flamengo", isCorrect: true),
  ),
  LayOutQuestion(
    text: 'Quem foi o artilheiro da Série A do Campeonato Brasileiro em 2020?',
    options: [
      const LayOutOption(text: "Gabigol", isCorrect: false),
      const LayOutOption(text: "Marinho", isCorrect: false),
      const LayOutOption(text: "Keno", isCorrect: false),
      const LayOutOption(text: "Luciano", isCorrect: true),
    ],
    id: 2,
    correctAnswer: const LayOutOption(text: "Luciano", isCorrect: true),
  ),
  LayOutQuestion(
    text: 'Qual clube venceu a edição de 2020 da Copa do Brasil?',
    options: [
      const LayOutOption(text: "Grêmio", isCorrect: false),
      const LayOutOption(text: "Palmeiras", isCorrect: true),
      const LayOutOption(text: "Cruzeiro", isCorrect: false),
      const LayOutOption(text: "Flamengo", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const LayOutOption(text: "Palmeiras", isCorrect: true),
  ),
  LayOutQuestion(
    text: 'Quem foi o artilheiro da Copa do Brasil em 2020?',
    options: [
      const LayOutOption(text: "Rony", isCorrect: false),
      const LayOutOption(text: "Pepê", isCorrect: false),
      const LayOutOption(text: "Diego Souza", isCorrect: false),
      const LayOutOption(text: "Luiz Adriano", isCorrect: true),
    ],
    id: 4,
    correctAnswer: const LayOutOption(text: "Luiz Adriano", isCorrect: true),
  ),
  LayOutQuestion(
    text: 'Qual equipe brasileira foi vice-campeã da Copa Libertadores da América em 2020?',
    options: [
      const LayOutOption(text: "Santos", isCorrect: true),
      const LayOutOption(text: "Palmeiras", isCorrect: false),
      const LayOutOption(text: "Flamengo", isCorrect: false),
      const LayOutOption(text: "Grêmio", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const LayOutOption(text: "Santos", isCorrect: true),
  ),
  LayOutQuestion(
    text: 'Quem foi o artilheiro da Copa Libertadores da América em 2020?',
    options: [
      const LayOutOption(text: "Gabriel Veron", isCorrect: false),
      const LayOutOption(text: "Marinho", isCorrect: false),
      const LayOutOption(text: "Gabriel Barbosa (Gabigol)", isCorrect: false),
      const LayOutOption(text: "Borja", isCorrect: true),
    ],
    id: 6,
    correctAnswer: const LayOutOption(text: "Borja", isCorrect: true),
  ),
  LayOutQuestion(
    text: 'Qual time brasileiro foi campeão da Copa Sul-Americana em 2020?',
    options: [
      const LayOutOption(text: "Athletico Paranaense", isCorrect: false),
      const LayOutOption(text: "São Paulo", isCorrect: false),
      const LayOutOption(text: "Bahia", isCorrect: false),
      const LayOutOption(text: "Defensa y Justicia", isCorrect: true),
    ],
    id: 7,
    correctAnswer: const LayOutOption(text: "Defensa y Justicia", isCorrect: true),
  ),
  LayOutQuestion(
    text:
        'Quem foi o técnico da seleção brasileira na conquista da Copa América de 2019, que teve sua final realizada em 2020?',
    options: [
      const LayOutOption(text: "Tite", isCorrect: true),
      const LayOutOption(text: "Dunga", isCorrect: false),
      const LayOutOption(text: "Mano Menezes", isCorrect: false),
      const LayOutOption(text: "Felipão", isCorrect: false),
    ],
    id: 8,
    correctAnswer: const LayOutOption(text: "Tite", isCorrect: true),
  ),
  LayOutQuestion(
    text: 'Qual clube brasileiro foi rebaixado para a Série B do Campeonato Brasileiro em 2020?',
    options: [
      const LayOutOption(text: "Botafogo", isCorrect: false),
      const LayOutOption(text: "Coritiba", isCorrect: true),
      const LayOutOption(text: "Bahia", isCorrect: false),
      const LayOutOption(text: "Corinthians", isCorrect: false),
    ],
    id: 9,
    correctAnswer: const LayOutOption(text: "Coritiba", isCorrect: true),
  ),
];
