import 'dart:developer';

import 'package:application_demo/data/models/ot_form_entity.dart';
import 'package:application_demo/domain/ot_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowDataDummy extends ConsumerWidget {
  const ShowDataDummy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        final List<OTFormEntity> data = ref.watch(otFormNotifierProvider);

        if (data.isEmpty) log('data is empty');

        for (final item in data) {
          final index = data.indexOf(item);

          log('index: $index');
          log('StratDate: ${item.startDate}');
          log('StratTime: ${item.startTime}');
          log('EndDate: ${item.endDate}');
          log('EndTime: ${item.endTime}');
          log('Des: ${item.description}');
          log('Image: ${item.images}');
          log('File: ${item.file}');
          log('----------------------------------------------');
        }
      },
      icon: const Icon(
        Icons.remove_red_eye,
        color: Colors.black,
      ),
    );
  }
}
