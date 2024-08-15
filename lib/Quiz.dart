import 'package:flutter/material.dart';
import 'package:w/Q.dart';

late int score = 0;

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex; // Track the selected answer index

  void _answerQuestion(int selectedIndex) {
    setState(() {
      _selectedAnswerIndex = selectedIndex;
      if (selectedIndex ==
          questions[_currentQuestionIndex].correctAnswerIndex) {
        score++;
      } else if (_selectedAnswerIndex != null &&
          _selectedAnswerIndex != selectedIndex) {
        // Decrement the score if the user changes from a correct answer to a wrong one
        score--;
      }
    });
  }

  void _nextQuestion() {
    if (_selectedAnswerIndex != null) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswerIndex = null; // Reset selected answer
      });

      // Navigate to the results screen if all questions are answered
      if (_currentQuestionIndex >= questions.length) {
        Navigator.pushNamed(context, '/resulte');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff86948F),
        title: const Text(
          'Quiz',
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: _currentQuestionIndex < questions.length
          ? Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      child: Image.asset(
                        'assets/Ellipse 1.png',
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 360,
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffB8E893),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 200.0,
                            ),
                            child: Center(
                              child: Text(
                                '$_currentQuestionIndex/${questions.length}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              questions[_currentQuestionIndex].questionText,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          ...questions[_currentQuestionIndex]
                              .answers
                              .asMap()
                              .entries
                              .map((entry) {
                            bool isSelected = entry.key == _selectedAnswerIndex;

                            return Column(
                              children: [
                                Container(
                                  width: 420,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: isSelected
                                        ? Colors.green
                                        : Colors.transparent,
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .transparent, // Transparent background
                                      foregroundColor:
                                          Colors.black, // Text color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () => _answerQuestion(entry.key),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        entry.value,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                          const SizedBox(height: 10.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF86948F), // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 8),
                            ),
                            onPressed: _nextQuestion,
                            child: const Text('Next',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
