import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trinity_test/function/main.fn.dart';
import 'package:trinity_test/helper/colorpicker.dart';

import 'function/global.fn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GlobalFn globalFn = GlobalFn(context, setState);
  late MainFn mainFn = MainFn(context, setState);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mainFn.setInitData();
  }

  @override
  Widget build(BuildContext context) {
    globalFn.screenHeight = MediaQuery.of(context).size.height;
    globalFn.screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: mainFn.isSearch
          ? AppBar(
              title: Container(
                height: 40,
                width: globalFn.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withOpacity(0.4)),
                ),
                child: TextField(
                  controller: mainFn.searchController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (val) {
                    mainFn.setResults(val);
                  },
                  maxLines: null,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    isCollapsed: true,
                    counterText: '',
                    border: InputBorder.none,
                  ),
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        mainFn.isSearch = false;
                        mainFn.searchController.text = '';
                      });
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colorpick.primaryOrange,
                    ),
                  ),
                )
              ],
            )
          : AppBar(
              title: const Text(
                'Contacts',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      color: Colorpick.primaryOrange,
                    ),
                  ),
                )
              ],
              leading: InkWell(
                onTap: () {
                  setState(() {
                    mainFn.isSearch = true;
                  });
                },
                child: const Icon(
                  Icons.search,
                  color: Colorpick.primaryOrange,
                ),
              ),
            ),
      backgroundColor: Colors.white,
      body: mainFn.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                await mainFn.refresh();
              },
              child: SingleChildScrollView(
                child: mainFn.searchController.text.isEmpty
                    ? Column(
                        children: List.generate(
                          mainFn.dataFromJson.length,
                          (index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    mainFn.navToSecondPage(index);
                                  },
                                  child: Container(
                                    width: globalFn.screenWidth,
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(40),
                                              ),
                                              color: Colorpick.primaryOrange),
                                          child: const Icon(Icons.person),
                                        ),
                                        Text(
                                          mainFn.dataFromJson[index]
                                                  ['firstName'] +
                                              ' ' +
                                              mainFn.dataFromJson[index]
                                                  ['lastName'],
                                          style: const TextStyle(fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(thickness: 1),
                              ],
                            );
                          },
                        ),
                      )
                    : Column(
                        children: List.generate(
                          mainFn.results.length,
                          (index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    mainFn.navToSecondPage(index);
                                  },
                                  child: Container(
                                    width: globalFn.screenWidth,
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(40),
                                              ),
                                              color: Colorpick.primaryOrange),
                                          child: const Icon(Icons.person),
                                        ),
                                        Text(
                                          mainFn.results[index]['firstName'] +
                                              ' ' +
                                              mainFn.results[index]['lastName'],
                                          style: const TextStyle(fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(thickness: 1),
                              ],
                            );
                          },
                        ),
                      ),
              ),
            ),
    );
  }
}
