import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_dose/models/drugData.dart';
import 'package:time_dose/screen/dose_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DrugData>(
      create: (BuildContext context) => DrugData(),
      child: MaterialApp(title: 'Flutter Demo', home: DoseScreen()),
    );
  }
}
