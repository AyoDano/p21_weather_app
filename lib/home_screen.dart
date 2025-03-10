import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: const Text(
                textAlign: TextAlign.center,
                'Shut the door not that it lets in the cold but that it lets out the coziness. - Mark Twain',
              ),
            ),
            TextButton(onPressed: () {}, child: Text('Drück Mich')),
          ],
        ),
      ),
    );
  }
}
