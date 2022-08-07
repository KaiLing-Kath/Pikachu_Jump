import 'package:flutter/material.dart';
import 'package:pikachu_jump/animation_controller.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
  var score=0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pikachu Can JUMP!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(

              child: Text("Score: $score"),
            ),
            Container(
              alignment: Alignment(MediaQuery.of(context).size.width/2,
                  MediaQuery.of(context).size.height*0.6),
              child: Image.asset('assets/stay.png'),
              width: 80,
              height: 80,
            ),
            animationController(),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(10.0),
                primary: Colors.white,
                backgroundColor: Colors.teal,
                textStyle: const TextStyle(fontSize: 15),
              ),
              onPressed: (){},
              child: const Text('Jump'),
            ),
          ],
        ),
      ),
    );
  }
}
