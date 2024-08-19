import 'package:exer_da/pages.dart';
import 'package:flutter/material.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Apps base',
      debugShowCheckedModeBanner: false,
      home: CervejaPage(),
    );
  }
}