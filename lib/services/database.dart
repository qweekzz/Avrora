import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/database.dart';
import '../services/storage.dart';
import 'counterBloc.dart';

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
      // openFile(file);

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

  void q() {}

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
}
