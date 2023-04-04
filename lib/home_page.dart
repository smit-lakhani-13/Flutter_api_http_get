// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'dart:convert';

import 'package:api_http_get/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'home_page.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _store = HomePageStore();

  @override
  void initState() {
    super.initState();
    _store.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (_store.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_store.hasError) {
            return Center(
              child: Text('Error: ${_store.errorMessage}'),
            );
          } else {
            return ListView.builder(
              itemCount: _store.sample.length,
              itemBuilder: (context, index) {
                final sample = _store.sample[index];
                return Container(
                  height: 330,
                  color: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Album id: ${sample.albumId}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Id: ${sample.id}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Title: ${sample.title}',
                        maxLines: 1,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Url: ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Image.network(
                        sample.url,
                        height: 60,
                        width: 60,
                      ),
                      Text(
                        'ThumbnailUrl: ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Image.network(
                        sample.thumbnailUrl,
                        width: 120,
                        height: 120,
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class HomePageStore = _HomePageStore with _$HomePageStore;

abstract class _HomePageStore with Store {
  @observable
  List<Sample> sample = [];

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> getData() async {
    try {
      isLoading = true;
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      final data = jsonDecode(response.body) as List<dynamic>;
      sample = data.map((e) => Sample.fromJson(e)).toList();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @computed
  bool get hasError => errorMessage.isNotEmpty;
}
