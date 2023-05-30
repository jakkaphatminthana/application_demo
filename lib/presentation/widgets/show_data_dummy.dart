import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/data_model.dart';
import '../../domain/data_provider.dart';

class ShowDataDummy extends ConsumerWidget {
  const ShowDataDummy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        final List<DataModel> data = ref.watch(dataProvider);
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
