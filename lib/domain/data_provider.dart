import 'package:application_demo/data/models/data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataNotifier extends StateNotifier<List<DataModel>> {
  DataNotifier() : super([]);

  void addState(DataModel data) {
    state = [...state];
  }
}

final dataProvider = StateNotifierProvider<DataNotifier, List<DataModel>>(
    (ref) => DataNotifier());
