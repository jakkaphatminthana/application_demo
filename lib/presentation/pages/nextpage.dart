import 'package:application_demo/presentation/pages/ot_add_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/show_data_dummy.dart';

class NextPageScreen extends StatelessWidget {
  const NextPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NextPage'),
        centerTitle: true,
        actions: const [ShowDataDummy()],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddOtScreen(),
              ),
            );
          },
          child: const Text('Add Form'),
        ),
      ),
    );
  }
}
