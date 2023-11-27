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
    text: 'Quem é conhecido como "The Notorious" no mundo do MMA?',
    options: [
      const LayOutOption(text: "Jon Jones", isCorrect: false),
      const LayOutOption(text: "Georges St-Pierre", isCorrect: false),
      const LayOutOption(text: "Khabib Nurmagomedov", isCorrect: false),
      const LayOutOption(text: "Conor McGregor", isCorrect: true),
    ],
    id: 0,
    correctAnswer: const LayOutOption(text: "Conor McGregor", isCorrect: true),
  ),
  LayOutQuestion(
    text: "Qual é a organização de MMA mais famosa e influente do mundo?",
    options: [
      const LayOutOption(text: "Bellator", isCorrect: false),
      const LayOutOption(text: "ONE Championship", isCorrect: false),
      const LayOutOption(text: "UFC", isCorrect: true),
      const LayOutOption(text: "PFL", isCorrect: false),
    ],
    id: 1,
    correctAnswer: const LayOutOption(text: "UFC", isCorrect: true),
  ),
  LayOutQuestion(
    text: 'Quem é considerado o "Rei da Selva" no MMA brasileiro?',
    options: [
      const LayOutOption(text: "José Aldo", isCorrect: false),
      const LayOutOption(text: "Anderson Silva", isCorrect: false),
      const LayOutOption(text: "Wanderlei Silva", isCorrect: true),
      const LayOutOption(text: "Fabricio Werdum", isCorrect: false),
    ],
    id: 2,
    correctAnswer: const LayOutOption(text: "Wanderlei Silva", isCorrect: true),
  ),
  LayOutQuestion(
    text: "Qual é a técnica de finalização em que um lutador utiliza suas pernas para estrangular o oponente?",
    options: [
      const LayOutOption(text: "Armlock", isCorrect: false),
      const LayOutOption(text: "Kimura", isCorrect: false),
      const LayOutOption(text: "Triângulo", isCorrect: true),
      const LayOutOption(text: "RNC (Rear-Naked Choke)", isCorrect: false),
    ],
    id: 3,
    correctAnswer: const LayOutOption(text: "Triângulo", isCorrect: true),
  ),
  LayOutQuestion(
    text: 'Quem é conhecido por seu apelido "The Last Stylebender"?',
    options: [
      const LayOutOption(text: "Israel Adesanya", isCorrect: true),
      const LayOutOption(text: "Robert Whittaker", isCorrect: false),
      const LayOutOption(text: "Kelvin Gastelum", isCorrect: false),
      const LayOutOption(text: "Paulo Costa", isCorrect: false),
    ],
    id: 4,
    correctAnswer: const LayOutOption(text: "Israel Adesanya", isCorrect: true),
  ),
  LayOutQuestion(
    text: 'Qual lutador é famoso por sua técnica "Showtime Kick"?',
    options: [
      const LayOutOption(text: "Nate Diaz", isCorrect: false),
      const LayOutOption(text: "Tony Ferguson", isCorrect: false),
      const LayOutOption(text: "Anthony Pettis", isCorrect: true),
      const LayOutOption(text: "Donald Cerrone", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const LayOutOption(text: "Anthony Pettis", isCorrect: true),
  ),
  LayOutQuestion(
    text: "Quem foi o primeiro campeão peso-pesado do UFC?",
    options: [
      const LayOutOption(text: "Randy Couture", isCorrect: true),
      const LayOutOption(text: "Brock Lesnar", isCorrect: false),
      const LayOutOption(text: "Frank Mir", isCorrect: false),
      const LayOutOption(text: "Mark Coleman", isCorrect: false),
    ],
    id: 6,
    correctAnswer: const LayOutOption(text: "Randy Couture", isCorrect: true),
  ),
  LayOutQuestion(
    text: "Qual é o lutador russo invicto que se aposentou com um recorde de 29-0?",
    options: [
      const LayOutOption(text: "Fedor Emelianenko", isCorrect: false),
      const LayOutOption(text: "Khabib Nurmagomedov", isCorrect: true),
      const LayOutOption(text: "Alexander Gustafsson", isCorrect: false),
      const LayOutOption(text: "Stipe Miocic", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const LayOutOption(text: "Khabib Nurmagomedov", isCorrect: true),
  ),
  LayOutQuestion(
    text: "Quem detém o recorde de defesas consecutivas do cinturão dos meio-médios no UFC?",
    options: [
      const LayOutOption(text: "Georges St-Pierre", isCorrect: false),
      const LayOutOption(text: "yron Woodley", isCorrect: false),
      const LayOutOption(text: "Matt Hughes", isCorrect: true),
      const LayOutOption(text: "Johny Hendricks", isCorrect: false),
    ],
    id: 8,
    correctAnswer: const LayOutOption(text: "Matt Hughes", isCorrect: true),
  ),
  LayOutQuestion(
    text:
        'Qual é o evento de MMA japonês conhecido por suas regras únicas, como chutes na cabeça de um oponente caído?',
    options: [
      const LayOutOption(text: "Pancrase", isCorrect: false),
      const LayOutOption(text: "Rizin FF", isCorrect: true),
      const LayOutOption(text: "Dream", isCorrect: false),
      const LayOutOption(text: "Shooto", isCorrect: false),
    ],
    id: 9,
    correctAnswer: const LayOutOption(text: "Rizin FF", isCorrect: true),
  ),
];
