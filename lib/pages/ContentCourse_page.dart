import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/counterBloc.dart';
import '../services/database.dart';
import 'package:number_paginator/number_paginator.dart';

class ContentCourse extends StatefulWidget {
  const ContentCourse({
    Key? key,
    @PathParam('id') required this.courseid,
    @PathParam('lesson') required this.lesson,
    required this.allLesson,
    required this.doc,
  }) : super(key: key);
  final int courseid;
  final String doc;
  final int lesson;
  final int allLesson;

  @override
  State<ContentCourse> createState() => _ContentCourseState();
}

class _ContentCourseState extends State<ContentCourse> {
  late int _newLesson;
  int _currentPage = 0;

  @override
  // ignore: must_call_super
  void initState() {
    _newLesson = widget.lesson;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<counterBloc>(
        create: (context) => counterBloc(),
        child: BlocBuilder<counterBloc, int>(
          builder: (context, state) {
            return Scaffold(
              body: Container(
                margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(a)
                        .snapshots(),
                    builder: (context, snapshot) {
                      Map<String, dynamic>? data;
                      data = snapshot.data?.data() as Map<String, dynamic>?;
                      late int initialPage =
                          data?['CourseID']['${widget.courseid}']['MyLesson'];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: StreamBuilder(
                                stream: DateBase().GetMyCourse(widget.doc),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  //Исправить (наверное в кеш загрузить)
                                  if (ConnectionState.done ==
                                      snapshot.connectionState) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            DateBase().GetCourseData(
                                                'name', widget.doc, 'Курс по '),
                                            Text(
                                                'Урок № ${(_newLesson + 1).toString()}'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                                '${snapshot.data['content']['lesson${_newLesson + 1}']}'),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            //Что-нибудь придумай (контет нормально запонить)
                                          ],
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const Text('...');
                                  }
                                }),
                          ),
                          Column(
                            children: [
                              NumberPaginator(
                                numberPages: widget.allLesson,
                                initialPage: initialPage,
                                onPageChange: (int index) {
                                  _newLesson = index;
                                  // print(
                                  //     '${data?['CourseID']['${widget.courseid}']['MyLesson']} !');
                                  // print('$_newLesson !!!!!!');
                                  if (_newLesson >= initialPage) {
                                    DateBase().updateMyCourse2(widget.courseid,
                                        widget.doc, _newLesson);
                                  }

                                  BlocProvider.of<counterBloc>(context)
                                      .add(counterIncEvent());
                                },
                              ),
                            ],
                          )
                        ],
                      );
                    }),
              ),
            );
          },
        ));
  }
}
