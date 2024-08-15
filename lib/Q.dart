// ignore: file_names
// ignore: file_names
class Question {
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;

  Question(this.questionText, this.answers, this.correctAnswerIndex);
}

final List<Question> questions = [

  Question('What is the value of π (pi)?', ['3.14', '2.71', '1.41', '1.61'], 0),
  Question('What is the square root of 64?', ['6', '7', '8', '9'], 2),
  Question('What is the derivative of x^2?', ['x', '2x', 'x^2', '2'], 1),
  Question('What is the value of 2 + 2 * 2?', ['4', '6', '8', '10'], 1),
  Question('What is 7 squared?', ['14', '21', '49', '64'], 2),
  Question('What is the sum of angles in a triangle?', ['180 degrees', '90 degrees', '360 degrees', '45 degrees'], 0),
  Question('What is the factorial of 5?', ['120', '60', '24', '10'], 0),
  Question('What is the value of the golden ratio (φ)?', ['1.62', '1.41', '3.14', '2.71'], 0),
  Question('What is the integral of 1/x dx?', ['ln(x)', 'x', '1/x', 'e^x'], 0),
  Question('What is the value of 10^3?', ['100', '1000', '10000', '10'], 1),
];
