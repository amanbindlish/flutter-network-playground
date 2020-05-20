import 'package:flutter/material.dart';
import 'package:networkingplayground/ui/user_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 30, color: Colors.white),
          subtitle2: TextStyle(fontSize: 20, color: Colors.white),
          bodyText2: TextStyle(fontSize: 15, color: Colors.white),
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Network Demo Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: UserWidget(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.7],
            colors: [
              Color(0xFF133F7E),
              Color(0xFF305D9E),
            ],
          ),
        ),
      ),
    );
  }
}
