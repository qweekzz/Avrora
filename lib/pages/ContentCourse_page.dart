import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/counterBloc.dart';
import '../services/database.dart';

class ContentCourse extends StatefulWidget {
  ContentCourse({
    @PathParam('id') required this.courseid,
    @PathParam('lesson') required this.lesson,
    required this.doc,
  });
  final int courseid;
  final String doc;
  final int lesson;

  @override
  State<ContentCourse> createState() => _ContentCourseState();
}

class _ContentCourseState extends State<ContentCourse> {
  late int _newLesson;

  @override
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: StreamBuilder(
                          stream: DateBase().GetMyCourse(widget.doc),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            //Исправить (наверное в кеш загрузить)
                            if (ConnectionState.done ==
                                snapshot.connectionState) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 0, 20, 20),
                                        height: 50,
                                        width: 180,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black54
                                                  .withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(1, 4),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color.fromARGB(255, 108, 14, 164),
                                              Color.fromARGB(255, 153, 28, 172)
                                            ],
                                            end: Alignment.bottomRight,
                                            begin: Alignment.topLeft,
                                          ),
                                        ),
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              if (_newLesson + 1 <
                                                  snapshot.data['lessons']) {
                                                _newLesson++;
                                              }
                                              await DateBase().updateMyCourse(
                                                  widget.doc, _newLesson);

                                              BlocProvider.of<counterBloc>(
                                                      context)
                                                  .add(counterIncEvent());
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.transparent),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 15, 0, 15),
                                              child: Row(
                                                children: [
                                                  Text('Следующий урок'),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Icon(Icons.navigate_next)
                                                ],
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              return Text('...');
                            }
                          }),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
