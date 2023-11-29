class StateQuestion {
  final int id;
  final String text;
  final List<StateOption> options;
  bool isLocked;
  StateOption? selectedWiidgetOption;
  StateOption? correctAnswer;

  StateQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
  });
  StateQuestion copyWith() {
    return StateQuestion(
      id: id,
      text: text,
      options: options.map((option) => StateOption(text: option.text, isCorrect: option.isCorrect)).toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class StateOption {
  final String text;
  final bool isCorrect;

  const StateOption({
    required this.text,
    required this.isCorrect,
  });
}

final stateQuestionsList = [
  StateQuestion(
    text: "Qual clube brasileiro conquistou a Copa do Brasil em 2009?",
    options: [
      const StateOption(text: "Grêmio", isCorrect: false),
      const StateOption(text: "Internacional", isCorrect: false),
      const StateOption(text: "Corinthians", isCorrect: true),
      const StateOption(text: "Cruzeiro", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const StateOption(text: "Corinthians", isCorrect: true),
  ),
  StateQuestion(
    text: "Quem foi o artilheiro da Série A do Campeonato Brasileiro em 2009?",
    options: [
      const StateOption(text: "Fred", isCorrect: false),
      const StateOption(text: "Adriano", isCorrect: true),
      const StateOption(text: "Diego Tardelli", isCorrect: false),
      const StateOption(text: "Kléber Pereira", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const StateOption(text: "Adriano", isCorrect: true),
  ),
  StateQuestion(
    text: "Qual time foi campeão da Copa Libertadores da América em 2009?",
    options: [
      const StateOption(text: "Flamengo", isCorrect: false),
      const StateOption(text: "São Paulo", isCorrect: false),
      const StateOption(text: "Internacional", isCorrect: true),
      const StateOption(text: "Palmeiras", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const StateOption(text: "Internacional", isCorrect: true),
  ),
  StateQuestion(
    text: "Quem foi o técnico da seleção brasileira na Copa das Confederações de 2009?",
    options: [
      const StateOption(text: "Tite", isCorrect: false),
      const StateOption(text: "Dunga", isCorrect: true),
      const StateOption(text: "Luiz Felipe Scolari", isCorrect: false),
      const StateOption(text: "Mano Menezes", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const StateOption(text: "Dunga", isCorrect: true),
  ),
  StateQuestion(
    text: "Qual clube venceu o Campeonato Paulista em 2009?",
    options: [
      const StateOption(text: "Palmeiras", isCorrect: false),
      const StateOption(text: "São Paulo", isCorrect: false),
      const StateOption(text: "Santos", isCorrect: true),
      const StateOption(text: "Corinthians", isCorrect: false),
    ],
    id: 4,
    correctAnswer: const StateOption(text: "Dunga", isCorrect: true),
  ),
  StateQuestion(
    text: "Quem foi o artilheiro da Copa do Brasil de 2009, ajudando o Corinthians a conquistar o título?",
    options: [
      const StateOption(text: "Jorge Henrique", isCorrect: false),
      const StateOption(text: "Jorge Preá", isCorrect: false),
      const StateOption(text: "Ronaldo", isCorrect: true),
      const StateOption(text: "Jorge Wagner", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const StateOption(text: "Ronaldo", isCorrect: true),
  ),
  StateQuestion(
    text: "Qual time brasileiro foi vice-campeão da Copa Sul-Americana em 2009?",
    options: [
      const StateOption(text: "Corinthians", isCorrect: false),
      const StateOption(text: "São Paulo", isCorrect: false),
      const StateOption(text: "Fluminense", isCorrect: true),
      const StateOption(text: "Internacional", isCorrect: false),
    ],
    id: 6,
    correctAnswer: const StateOption(text: "Fluminense", isCorrect: true),
  ),
  StateQuestion(
    text: "Quem foi o goleiro da seleção brasileira na Copa das Confederações de 2009?",
    options: [
      const StateOption(text: "Dida", isCorrect: false),
      const StateOption(text: "Júlio César", isCorrect: true),
      const StateOption(text: "Marcos", isCorrect: false),
      const StateOption(text: "Renan", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const StateOption(text: "Júlio César", isCorrect: true),
  ),
  StateQuestion(
    text: "Qual jogador brasileiro foi eleito o melhor do mundo pela FIFA em 2009?",
    options: [
      const StateOption(text: "Kaká", isCorrect: true),
      const StateOption(text: "Ronaldo", isCorrect: false),
      const StateOption(text: "Ronaldinho Gaúcho", isCorrect: false),
      const StateOption(text: "Luis Fabiano", isCorrect: false),
    ],
    id: 8,
    correctAnswer: const StateOption(text: "Kaká", isCorrect: true),
  ),
  StateQuestion(
    text: "Quem foi o técnico do Corinthians durante a campanha vitoriosa na Copa do Brasil de 2009?",
    options: [
      const StateOption(text: "Tite", isCorrect: false),
      const StateOption(text: "Mano Menezes", isCorrect: false),
      const StateOption(text: "Ricardo Gomes", isCorrect: true),
      const StateOption(text: "Muricy Ramalho", isCorrect: false),
    ],
    id: 9,
    correctAnswer: const StateOption(text: "Ricardo Gomes", isCorrect: true),
  ),
];
