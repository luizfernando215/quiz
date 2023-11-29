class WidgetQuestion {
  final int id;
  final String text;
  final List<WiidgetOption> options;
  bool isLocked;
  WiidgetOption? selectedWiidgetOption;
  WiidgetOption correctAnswer;

  WidgetQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
  });

  WidgetQuestion copyWith() {
    return WidgetQuestion(
      id: id,
      text: text,
      options: options.map((option) => WiidgetOption(text: option.text, isCorrect: option.isCorrect)).toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class WiidgetOption {
  final String? text;
  final bool? isCorrect;

  const WiidgetOption({
    this.text,
    this.isCorrect,
  });
}

final widgetQuestionsList = [
  WidgetQuestion(
    text: "Qual time brasileiro conquistou a Copa Libertadores da América em 2017?",
    options: [
      const WiidgetOption(text: "Santos", isCorrect: false),
      const WiidgetOption(text: "Flamengo", isCorrect: false),
      const WiidgetOption(text: "Palmeiras", isCorrect: false),
      const WiidgetOption(text: "Grêmio", isCorrect: true),
    ],
    id: 0,
    correctAnswer: const WiidgetOption(text: "Grêmio", isCorrect: true),
  ),
  WidgetQuestion(
      text: "Quem foi o artilheiro do Campeonato Brasileiro Série A em 2017?",
      options: [
        const WiidgetOption(text: "Henrique Dourado", isCorrect: false),
        const WiidgetOption(text: "Jô", isCorrect: true),
        const WiidgetOption(text: "Lucca", isCorrect: false),
        const WiidgetOption(text: "Diego Souza", isCorrect: false),
      ],
      id: 1,
      correctAnswer: const WiidgetOption(text: "Jô", isCorrect: true)),
  WidgetQuestion(
      text: "Qual clube venceu a Copa do Brasil em 2017?",
      options: [
        const WiidgetOption(text: "Cruzeiro", isCorrect: true),
        const WiidgetOption(text: "Flamengo", isCorrect: false),
        const WiidgetOption(text: "Palmeiras", isCorrect: false),
        const WiidgetOption(text: "Grêmio", isCorrect: false),
      ],
      id: 2,
      correctAnswer: const WiidgetOption(text: "Cruzeiro", isCorrect: true)),
  WidgetQuestion(
      text: "Quem foi o treinador da seleção brasileira de futebol masculino em 2017?",
      options: [
        const WiidgetOption(text: "Tite", isCorrect: true),
        const WiidgetOption(text: "Dunga", isCorrect: false),
        const WiidgetOption(text: "Mano Menezes", isCorrect: false),
        const WiidgetOption(text: "Felipão", isCorrect: false),
      ],
      id: 3,
      correctAnswer: const WiidgetOption(text: "Tite", isCorrect: true)),
  WidgetQuestion(
      text: "Qual jogador brasileiro foi transferido por um valor recorde para o futebol francês em 2017?",
      options: [
        const WiidgetOption(text: "Neymar", isCorrect: true),
        const WiidgetOption(text: " Philippe Coutinho", isCorrect: false),
        const WiidgetOption(text: "Gabriel Jesus", isCorrect: false),
        const WiidgetOption(text: "Vinícius Júnior", isCorrect: false),
      ],
      id: 4,
      correctAnswer: const WiidgetOption(text: "Neymar", isCorrect: true)),
  WidgetQuestion(
      text: "Quais times foram rebaixados para a Série B do Campeonato Brasileiro em 2017?",
      options: [
        const WiidgetOption(text: "Avaí e Ponte Preta", isCorrect: true),
        const WiidgetOption(text: "Atlético Goianiense e Sport", isCorrect: false),
        const WiidgetOption(text: "Coritiba e Chapecoense", isCorrect: false),
        const WiidgetOption(text: "São Paulo e Vitória", isCorrect: false),
      ],
      id: 5,
      correctAnswer: const WiidgetOption(text: "Avaí e Ponte Preta", isCorrect: true)),
  WidgetQuestion(
      text: "Qual clube brasileiro participou da final do Mundial de Clubes da FIFA em 2017?",
      options: [
        const WiidgetOption(text: "Flamengo", isCorrect: false),
        const WiidgetOption(text: "Palmeiras", isCorrect: false),
        const WiidgetOption(text: "Grêmio", isCorrect: true),
        const WiidgetOption(text: "Santos", isCorrect: false),
      ],
      id: 6,
      correctAnswer: const WiidgetOption(text: "Grêmio", isCorrect: true)),
  WidgetQuestion(
      text: "Quem foi eleito o melhor jogador do Campeonato Brasileiro de 2017?",
      options: [
        const WiidgetOption(text: "Lucas Lima", isCorrect: false),
        const WiidgetOption(text: "Luan", isCorrect: true),
        const WiidgetOption(text: "Diego", isCorrect: false),
        const WiidgetOption(text: "Henrique Dourado", isCorrect: false),
      ],
      id: 7,
      correctAnswer: const WiidgetOption(text: "Luan", isCorrect: true)),
  WidgetQuestion(
      text: "Qual foi o time revelação do futebol brasileiro em 2017?",
      options: [
        const WiidgetOption(text: "Chapecoense", isCorrect: false),
        const WiidgetOption(text: "Flamengo", isCorrect: false),
        const WiidgetOption(text: "Santos", isCorrect: false),
        const WiidgetOption(text: "Corinthians", isCorrect: true),
      ],
      id: 8,
      correctAnswer: const WiidgetOption(text: "Corinthians", isCorrect: true)),
  WidgetQuestion(
    text: "Quais foram os finalistas da Copa Sul-Americana em 2017?",
    options: [
      const WiidgetOption(text: "Flamengo e Independiente", isCorrect: true),
      const WiidgetOption(text: "Atlético Mineiro e Nacional", isCorrect: false),
      const WiidgetOption(text: "Corinthians e Racing", isCorrect: false),
      const WiidgetOption(text: "Ponte Preta e Junior Barranquilla", isCorrect: false),
    ],
    id: 9,
    correctAnswer: const WiidgetOption(text: "Flamengo e Independiente", isCorrect: true),
  ),
];
