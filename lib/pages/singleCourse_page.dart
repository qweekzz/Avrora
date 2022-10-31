import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SinagleCourse extends StatelessWidget {
  const SinagleCourse(
      {@PathParam('id') required this.courseid, required this.doc});
  final int courseid;
  final String doc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(doc),
    );
  }
}
