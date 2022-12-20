import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/database.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("你好"),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: DateBase().getSubData(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //проверка на ошибке (вдруг в базе не чего не окажется)
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              //!!! запомнить
              final doc = snapshot.data!.docs;
              return Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ListView.separated(
                  itemCount: doc.length,
                  itemBuilder: ((BuildContext context, int index) {
                    final data = doc[index].data() as Map<String, dynamic>?;
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 235, 31, 224),
                            Color.fromARGB(255, 191, 74, 209),
                            Color.fromARGB(255, 213, 161, 221),
                          ],
                          end: Alignment.bottomRight,
                          begin: Alignment.topLeft,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          AutoRouter.of(context).pushNamed('/start');
                        },
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Container(
                                    width: 85,
                                    height: 100,
                                    // color: Colors.blue,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10)),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            textDirection: TextDirection.ltr,
                                            children: [
                                              Text(
                                                data!['name'],
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'author : ${data['author']}',
                                                style: const TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              Text(
                                                data['difficult'],
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
