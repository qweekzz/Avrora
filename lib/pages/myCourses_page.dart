import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/pages/MainHome.dart';
import 'package:flutter_app/routes/router.gr.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/counterBloc.dart';
import '../services/database.dart';
import '../services/storage.dart';

class myCourses extends StatefulWidget {
  const myCourses({super.key});

  @override
  State<myCourses> createState() => _myCoursesState();
}

class _myCoursesState extends State<myCourses> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
