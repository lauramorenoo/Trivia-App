import 'package:flutter/material.dart';

class TriviaQuiz {
  var questions = [
    "What is the Number 1 movie of all time?",
    "Which song has the most streams on Spotify?",
    "Who owns a solid gold bathtub?",
    "What's the best-selling video game console of all time?",
    "Who is the most famous video game character of all time?"
  ];

  var choices = [
    [
      "Avengers: End Game",
      "Titanic",
      "Star Wars Ep. VII: The Force Awakens",
      "Avatar"
    ],
    [
      "Blinding Lights by The Weeknd",
      "Rockstar by Post Malone",
      "God’s Plan by Drake",
      "Shape of You by Ed Sheeran"
    ],
    ["Mike Tyson", "Drake", "Jay-Z", "Oprah Winfrey"],
    ["Playstation 4", "Nintendo Wii", "Xbox 360", "Playstation 2"],
    ["Mario", "Pac-Man", "Crash", "Sonic the HedgeHog"]
  ];

  var correctAnswers = [
    "Avatar",
    "Shape of You by Ed Sheeran",
    "Mike Tyson",
    "Playstation 2",
    "Mario"
  ];
}

var finalScore = 0;
var questionNumber = 0;
var quiz = TriviaQuiz();
var quizID = 1234;

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizState();
  }
}

class QuizState extends State<Quiz> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(20.0)),
              new Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Question ${questionNumber + 1} of ${quiz.questions.length}",
                      style: TextStyle(fontSize: 22.0),
                    ),
                    Text(
                      "Score: $finalScore",
                      style: TextStyle(fontSize: 22.0),
                    )
                  ],
                ),
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new Text(
                quiz.questions[questionNumber],
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //choice 1
                  new MaterialButton(
                    minWidth: 120.0,
                    color: Colors.lightBlue,
                    onPressed: () {
                      if (quiz.choices[questionNumber][0] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("correct");
                        finalScore++;
                      } else {
                        debugPrint("wrong");
                      }
                      updateQuestion();
                    },
                    child: Text(
                      quiz.choices[questionNumber][0],
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),

                  //choice 2
                  new MaterialButton(
                    minWidth: 120.0,
                    color: Colors.lightBlue,
                    onPressed: () {
                      if (quiz.choices[questionNumber][1] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("correct");
                        finalScore++;
                      } else {
                        debugPrint("wrong");
                      }
                      updateQuestion();
                    },
                    child: Text(
                      quiz.choices[questionNumber][1],
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(10.0)),

                  //choice 2
                  new MaterialButton(
                    minWidth: 120.0,
                    color: Colors.lightBlue,
                    onPressed: () {
                      if (quiz.choices[questionNumber][2] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("correct");
                        finalScore++;
                      } else {
                        debugPrint("wrong");
                      }
                      updateQuestion();
                    },
                    child: Text(
                      quiz.choices[questionNumber][2],
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),

                  //choice 4
                  new MaterialButton(
                    minWidth: 120.0,
                    color: Colors.lightBlue,
                    onPressed: () {
                      if (quiz.choices[questionNumber][3] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("correct");
                        finalScore++;
                      } else {
                        debugPrint("wrong");
                      }
                      updateQuestion();
                    },
                    child: Text(
                      quiz.choices[questionNumber][3],
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Container(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: Colors.red,
                  minWidth: 240.0,
                  height: 30.0,
                  onPressed: resetQuiz,
                  child: Text(
                    "Quit",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new Summary(score: finalScore)));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Final Score: $score",
              style: TextStyle(fontSize: 22.0),
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new MaterialButton(
              color: Colors.red,
              onPressed: () {
                questionNumber = 0;
                finalScore = 0;
                Navigator.pop(context);
              },
              child: Text("Start Over",
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
            )
          ],
        )),
      ),
    );
  }
}
