import 'package:feelingsmiles/home.dart';
import 'package:flutter/material.dart';
import 'loading.dart';
import 'home.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feeling Smiles',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
        home:Home()// MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


