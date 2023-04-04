// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'dart:convert';

import 'package:api_http_get/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Sample> sample = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: sample.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 130,
                    color: Colors.grey,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'User id: ${sample[index].userId}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Id: ${sample[index].id}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Title: ${sample[index].title}',
                            maxLines: 1,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Body: ${sample[index].body}',
                            maxLines: 1,
                            style: TextStyle(fontSize: 18),
                          ),
                        ]),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<Sample>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        sample.add(Sample.fromJson(index));
      }
      return sample;
    } else {
      return sample;
    }
  }
}
