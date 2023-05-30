import 'package:application_demo/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/pages/ot_add_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thitaram Demo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const AddOtScreen(),
    );
  }
}
