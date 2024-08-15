// ignore: file_names
import 'package:flutter/material.dart';
import 'package:w/Quiz.dart';
import 'package:w/Quize_home.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF86948F),
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 220,
                  width: 750,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFABBFB8), // Card color
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text('HELLO ${name} YOUR SCORE IS ',
                          style: const TextStyle(fontSize: 24)),
                      const SizedBox(height: 6),
                      Text('$score/10', style: const TextStyle(fontSize: 30)),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                          score = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFFB8E893), // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 6),
                        ),
                        child: const Text(
                          'Back to Start',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 185,
              left: 60,
              child: Container(
                height: 35,
                width: 200,
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFB8E893), // Card color
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'CONGRATULATIONS!!!!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0), // Welcome text color
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
