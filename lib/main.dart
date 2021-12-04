import 'package:flutter/material.dart';
import './quiz.dart';
import 'package:game_socket/game_socket.dart';

void main() {
  runApp(MaterialApp(
    home: TriviaQuiz(),
  ));
}

class TriviaQuiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TriviaQuizState();
  }
}

class TriviaQuizState extends State<TriviaQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cloud Race Trivia"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
                height: 50.0,
                color: Colors.green,
                onPressed: startQuiz,
                child: Text(
                  "Start Quiz",
                  style: new TextStyle(fontSize: 18.0, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  void startQuiz() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz()));
    });
  }
}
