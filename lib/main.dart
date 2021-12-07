import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import './quiz.dart';

void main() {
  runApp(MaterialApp(
    home: TriviaQuiz(
      channel: WebSocketChannel.connect(Uri.parse('ws://localhost:8080/ws')),
    ),
  ));
}

/*importvoid main() {
  runApp(MaterialApp());
}*/

class TriviaQuiz extends StatefulWidget {
  final WebSocketChannel channel;
  TriviaQuiz({required this.channel});

  @override
  State<StatefulWidget> createState() {
    return TriviaQuizState();
  }
}

class TriviaQuizState extends State<TriviaQuiz> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  var quizID = 1234;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cloud Race Trivia"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Form(
        //margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Enter Game Code"),
              controller: _controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter valid Game Code';
                }
                quizID = value as int;
                return null;
              },
            ),
            ),
            StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            ),
            MaterialButton(
              height: 50.0,
              color: Colors.green,
              onPressed: startQuiz,
              child: Text(
                "Start Quiz",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send),
        onPressed: startQuiz,
      ),
    );
  }

  void startQuiz() {
    if (_controller.text.isNotEmpty) {
      widget.channel.sink.add(_controller.text);
    }
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz()));
    });
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}
