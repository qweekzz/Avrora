import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

//Всплывающие окно
// ScaffoldMessenger.of(context).showSnackBar(
//   const SnackBar(
//       content: Text('Processing Data')),
// );

final User? uID = FirebaseAuth.instance.currentUser;
//убрать a
var a = FirebaseAuth.instance.currentUser?.uid;
bool bol = false;
String name = '1';

class Users {
  String name;
  String surname;
  String patronymic;
  int birthday;
  int schoolClass;
  int phoneNumber;

  Users({
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.birthday,
    required this.schoolClass,
    required this.phoneNumber,
  });
}

class DateBase {
  // final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');
  // final uId = _auth.UserInfo(_data)

// простое добавление в БД
  Future addUser(Users user) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(uID!.uid)
        .set({
      'Name': user.name,
      'Surname': user.surname,
      'Patronymic': user.patronymic,
      'Birthday': user.birthday,
      'Class': user.schoolClass,
      'Phone': user.phoneNumber
      // 'city': user.city,
      // 'school': user.name,
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
  Future getUser() async {
    Map<String, dynamic>? data;
    var birthday;
    var checkUid = await FirebaseFirestore.instance
        .collection('users')
        .doc(a)
        .get()
        .then((snapshot) => {
              data = snapshot.data(),
              print(data?['Birthday']),
              birthday = data?['Birthday'],
              name = data?['Name']
            });
    return name;
  }

//получаю данные из БД и могу их нормально использоать(где хочу) + разобраться с ConnectionState.done
  Widget getUserData(String userField) {
    Map<String, dynamic>? data;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(a).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            data = snapshot.data!.data() as Map<String, dynamic>?;
            return Text((data?[userField]).toString());
          } else {
            return Text('else');
          }
        });
  }
}
