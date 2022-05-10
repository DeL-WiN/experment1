import 'package:experment1/widgets/example/example.dart';
import 'package:flutter/material.dart';

import 'domain/api_clients/api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('32323232444');
    return MaterialApp(
      home: Example(),
    );
  }
}