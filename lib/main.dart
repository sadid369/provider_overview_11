import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_11/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider 09',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Foo with ChangeNotifier {
  String value = "Foo";
  void changeValue() {
    value = value == "Foo" ? "Bar" : "Foo";
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider 11"),
      ),
      body: ChangeNotifierProvider(
          create: (context) => Counter(),
          child: Builder(builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${context.watch<Counter>().counter}",
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<Counter>().increment();
                      },
                      child: Text(
                        "Change Value",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ))
                ],
              ),
            );
          })),
    );
  }
}
