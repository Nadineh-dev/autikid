import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_witai/flutter_witai.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autikid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final searchController = TextEditingController();
  dynamic response;
  dynamic newResponse;
  var textValue = 'null';
  var httpHandlers = 'null';

  void getValues() async {
    final wit = WitManager(
      utterance: searchController.text,
      params: 'message',
      headers: "524GK4Q4W2F3FJFX3ESTVO27C253GSZS",
    ); //Replace with SERVER ACCESS TOKEN
    response = await wit.fetchLink();
    setState(() {
      textValue = response.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('witai Demo'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: searchController,
                    )),
                    TextButton(
                        onPressed: () {
                          getValues();
                        },
                        child: Icon(Icons.search))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(textValue),
            ),
          ],
        ));
  }
}
