import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trinity_test/screen/secondScreen.ui.dart';

class MainFn {
  BuildContext context;
  Function(VoidCallback) setState;
  MainFn(this.context, this.setState);

  bool isLoading = false;
  bool isSearch = false;

  TextEditingController searchController = TextEditingController();

  void setInitData() {
    readJson().then((value) {
      isLoading = false;
    });
  }

  refresh() {
    setInitData();
  }

  List results = [];
  List dataFromJson = [];

  Future<void> readJson() async {
    isLoading = true;

    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
      dataFromJson = data;
    });
  }

  void setResults(String query) {
    results = dataFromJson
        .where((elem) =>
            elem['firstName']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            elem['lastName']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            elem['email']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            elem['phone']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();
  }

  navToSecondPage(int indexFromList) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreenUi(
          index: indexFromList,
          firstName: dataFromJson[indexFromList]['firstName'] ?? '',
          lastName: dataFromJson[indexFromList]['lastName'] ?? '',
          phone: dataFromJson[indexFromList]['email'] ?? '',
          email: dataFromJson[indexFromList]['phone'] ?? '',
        ),
      ),
    ).then((value) {
      print('value $value');
      if (indexFromList == value['index']) {
        setState(() {
          dataFromJson[indexFromList]['firstName'] = value['firstName'];
          dataFromJson[indexFromList]['lastName'] = value['lastName'];
          dataFromJson[indexFromList]['email'] = value['email'];
          dataFromJson[indexFromList]['phone'] = value['phone'];
        });
      }
    });
  }
}
