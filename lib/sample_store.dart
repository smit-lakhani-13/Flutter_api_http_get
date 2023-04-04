import 'dart:convert';

import 'package:api_http_get/model.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'sample_store.g.dart';

class SampleStore = _SampleStore with _$SampleStore;

abstract class _SampleStore with Store {
  @observable
  ObservableList<Sample> sampleList = ObservableList<Sample>();

  @action
  Future<void> getData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        sampleList.add(Sample.fromJson(index));
      }
    }
  }
}
