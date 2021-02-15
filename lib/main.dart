import 'package:flutter/material.dart';

import 'hub/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bi Cycle',
      theme: ThemeData(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.amber,
      ),
      home: HubPage(),
    );
  }
}
