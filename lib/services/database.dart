import 'package:auto_route/annotations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/myCourses_page.dart';
import 'package:flutter_app/routes/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/database.dart';
import '../services/storage.dart';
import 'counterBloc.dart';
import 'package:auto_route/auto_route.dart';

//Всплывающие окно
// ScaffoldMessenger.of(context).showSnackBar(
//   const SnackBar(
//       content: Text('Processing Data')),
// );

final User? uID = FirebaseAuth.instance.currentUser;
//убрать a
var a = FirebaseAuth.instance.currentUser?.uid;

bool bol = false;
dynamic ava;
late String ava2;

class Users {
  String name;
  String nickName;
  String city;
  String school;
  String birthday;
  String ava;
  int schoolClass;
  int phoneNumber;
  int age;

  Users({
    required this.name,
    required this.nickName,
    required this.birthday,
    required this.schoolClass,
    required this.phoneNumber,
    required this.city,
    required this.school,
    required this.age,
    required this.ava,
  });
}

class DateBase {
  // final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');
  // final uId = _auth.UserInfo(_data)

// простое добавление в БД
  Future addUser(Users user, y, m, d) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uID!.uid)
        .set({
      'Name': user.name,
      'Nickname': user.nickName,
      'Birthday': user.birthday,
      'Class': user.schoolClass,
      'Phone': user.phoneNumber,
      'City': user.city,
      'School': user.school,
      'Age': user.age,
      'Ava': user.ava,
      'Timestamp': Timestamp.fromDate(DateTime.now()).toDate(),
    });
  }

//проверка на то какой юзер щас авторизован
  Future checkUser() async {
    var checkUid = await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.map((e) => e.reference.id));
    return bol = checkUid.contains(a);
  }

// получаем в консоль данные из БД (лишняя фигня)
  // Future getUser() async {
  //   Map<String, dynamic>? data;
  //   var birthday;
  //   var checkUid = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(a)
  //       .get()
  //       .then((snapshot) => {
  //             data = snapshot.data(),
  //             print(data?['Birthday']),
  //             birthday = data?['Birthday'],
  //             name = data?['Name']
  //           });
  //   return name;
  // }

//получаю данные из БД и могу их нормально использоать(где хочу) + разобраться с ConnectionState.done
  Widget getUserData(String userField, dynamic colors, double fZ, dynamic fW) {
    Map<String, dynamic>? data;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(a).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            data = snapshot.data!.data() as Map<String, dynamic>?;
            return Text((data?[userField]).toString(),
                style: TextStyle(color: colors, fontSize: fZ, fontWeight: fW));
          } else {
            return Text('else');
          }
        });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSubData() {
    return FirebaseFirestore.instance.collection('courses').snapshots();
  }

  Future getAva() {
    String ava2;
    // Map<String, dynamic>? ava;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uID!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      ava = documentSnapshot.data() as Map<String, dynamic>?;
      ava = ava?["Ava"];
      print("ava = ${ava}");
      return ava;
      print('aaa = ${ava}');
    });
  }

  // Future getImage() async {
  //   final image = await FilePicker.platform.pickFiles(
  //     allowMultiple: false,
  //     type: FileType.custom,
  //     allowedExtensions: ['jpg', 'png'],
  //   );

  //   if (image != null) {
  //     final path = image.files.single.path;
  //     final fileName = image.files.single.name;
  //     print(path);
  //     print(fileName);
  //   } else {
  //     print("Error when image = null");
  //   }
  // }

  Future addImageToStorage() async {
    var fileName;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result == null) {
      return;
    } else {
      final file = result.files.single;

      // функция которая открывает фаил и сохраняет его в cache (удалиться после закрытия приложения)

      //функция которая сохранить фаил в бд
      Storage().saveFile(file).then((value) => print('Done'));

      var cut = file.path!.lastIndexOf('/').toString();
      ava = file.path!.substring(int.parse(cut) + 1);

      print("path = ${file.path}");
    }
  }

  Future downloadURL(String imageName) async {
    String downloadURL = await FirebaseStorage.instance
        .ref('avatars/$imageName')
        .getDownloadURL();

    return downloadURL;
  }

  Stream<String> downloadURLStream(String imageName, context) async* {
    String downloadURL = await FirebaseStorage.instance
        .ref('avatars/$imageName')
        .getDownloadURL();
    yield downloadURL;
    await BlocProvider.of<counterBloc>(context);
  }

  Future updateAva() async {
    await FirebaseFirestore.instance.collection('users').doc(uID!.uid).update({
      'Ava': ava,
    });
  }

  Future GetImageName() async {
    String downloadURL = await FirebaseStorage.instance.ref('avatars').bucket;
    // downloadURL.indexOf('/');
    print(ava.toString() + '!!!!!!!!!!');
    return await ava;
  }

  Future GetCourseImg(doc) async {
    var collection = FirebaseFirestore.instance.collection('courses').doc(doc);
    var querySnapshot = await collection.get();
    var data = querySnapshot.data();
    // print(querySnapshot.data());
    var img = data!['img'];
    // print(data['content']['lesson1']);
    return data['img'];
    // print(querySnapshot.data()?['author'] ?? 'error');
  }

  Stream GetMyCourse(doc) async* {
    var collection = FirebaseFirestore.instance.collection('courses').doc(doc);
    var querySnapshot = await collection.get();
    var data = querySnapshot.data();
    yield data;
  }

  Future updateMyCourse(doc, lesson) async {
    FirebaseFirestore.instance.collection('courses').doc(doc).set({
      'myLessons': lesson,
    }, SetOptions(merge: true));
  }

  Widget GetCourseData(String userField, doc, String text) {
    Map<String, dynamic>? data;
    CollectionReference users =
        FirebaseFirestore.instance.collection('courses');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(doc).get(),
        builder: (context, snapshot) {
          data = snapshot.data?.data() as Map<String, dynamic>?;
          print('DATA $data');
          return Text(text + (data?[userField]).toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400));
        });
  }

  Future addCourse(doc) async {
    return FirebaseFirestore.instance.collection('users').doc(uID!.uid).set({
      'CourseID': FieldValue.arrayUnion([doc]),
    }, SetOptions(merge: true));
  }

  Widget key2() {
    Map<String, dynamic>? data;
    Map<String, dynamic>? data2;
    var coll = FirebaseFirestore.instance.collection('courses');
    var user = FirebaseFirestore.instance.collection('users').doc(uID!.uid);
    return FutureBuilder<DocumentSnapshot>(
        future: user.get(),
        builder: (context, snapshot) {
          data = snapshot.data?.data() as Map<String, dynamic>?;
          print("snapshot ${data?['CourseID']}");
          if (snapshot.connectionState == ConnectionState.done) {
            data = snapshot.data?.data() as Map<String, dynamic>?;
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: 3,
              itemBuilder: (context, index) {
                var hz = data?['CourseID'][index];
                return FutureBuilder<DocumentSnapshot>(
                  future: coll.doc(hz).get(),
                  builder: (context, snapshot) {
                    final data2 =
                        snapshot.data?.data() as Map<String, dynamic>?;
                    var docId = (snapshot.data?.id).toString();
                    var allLesson = data2?['lessons'] ?? 1;
                    var myLesson = data2?['myLessons'] ?? 1;
                    var progress = (myLesson / allLesson);
                    var backImg = data2?['img'] ?? 'sonnic.png';
                    print('object ${snapshot.data?.id}');
                    return InkWell(
                      onTap: () {
                        AutoRouter.of(context).push(ContentCourseRoute(
                            courseid: index, doc: docId, lesson: myLesson));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://firebasestorage.googleapis.com/v0/b/avrora-d2ff5.appspot.com/o/avatars%2F$backImg?alt=media&token=3264b4ec-30c0-4aa5-93d8-8ca0b173dd66'),
                              fit: BoxFit.cover,
                            )),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                          decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.description,
                                    color: Colors.white70,
                                    size: 18,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${allLesson ?? 1}',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text(
                                    'уроков',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${data2?['name'] ?? 'noName'}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${data2?['desc'] ?? 'noDesc'}',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 18,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${myLesson ?? 0} /${allLesson ?? 0}',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  LinearProgressIndicator(
                                    minHeight: 7,
                                    value: progress ?? 0,
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.green),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Text('else');
          }
        });
  }
}
