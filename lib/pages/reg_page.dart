import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'package:auto_route/auto_route.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Reg extends StatefulWidget {
  Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  final _formKey = GlobalKey<FormState>();

  final _controllerNumb = TextEditingController();
  final _controllerName = TextEditingController();
  final _controllerSurname = TextEditingController();
  final _controllerPatronymic = TextEditingController();
  final _controllerBirthday = TextEditingController();
  final _controllerCity = TextEditingController();
  final _controllerClass = TextEditingController();
  final _controllerSchool = TextEditingController();

  // Антификация по номеру телефона, но из за ошибки при подлючении firebase_core, пока не работает.
  // Future signUp() async{
  //   var _phoneNumber = _controllerNumb.text.trim();
  //   var _Name = _controllerName.text.trim();
  //   var _Surname = _controllerSurname.text.trim();
  //   var _Patronymic = _controllerPatronymic.text.trim();
  //   var _Birthday = _controllerBirthday.text.trim();
  //   var _City = _controllerCity.text.trim();
  //   var _Class = _controllerClass.text.trim();
  //   var _School = _controllerSchool.text.trim();

  //   var verifyPhoneNumber = _auth.verifyPhoneNumber(phoneNumber: _phoneNumber,
  //    verificationCompleted: (PhoneAuthCredential) {

  //      _auth.signInWithCredential(PhoneAuthCredential).then((user) async => {
  //        if(user != null){
  //          await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
  //             'userName': _Name,
  //             'userSurname': _Surname,
  //             'userPatronymic': _Patronymic,
  //             'userBirthday': _Birthday,
  //             'city': _City,
  //             'class': _Class,
  //             'school': _School,
  //             'phone': _phoneNumber,
  //           }, SetOptions(merge: true)
  //          ).then((value) => {
  //            AutoRouter.of(context).pushNamed('/second')
  //          }).catchError((onError) => {
  //            debugPrint('Err: ' + onError)
  //          })
  //        }
  //      });
  //    },
  //    verificationFailed: (FirebaseAuthException error) {
  //      debugPrint(error.message);
  //    },
  //    codeSent: (verificationId, resendToken){
  //      var verificationCode = verificationId;
  //      debugPrint(verificationId);
  //    },
  //    codeAutoRetrievalTimeout: (verificationId){
  //      var verificationCode = verificationId;
  //      debugPrint(verificationId);
  //    },
  //    timeout: Duration(seconds: 60));

  //    await verifyPhoneNumber;
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width1 = size.width;

    // виджет для инпутов
    Widget _input(String text, dynamic inputController) => Container(
          padding: const EdgeInsets.only(bottom: 15),
          child: TextFormField(
            controller: inputController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Поле не может быть пустым';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: text,
              labelStyle: const TextStyle(
                fontSize: 16,
              ),
              counterText: '',
              isCollapsed: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 18, 10, 18),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.grey)),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 108, 14, 164),
                  )),
            ),
          ),
        );

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leadingWidth: 110,
          leading: IconButton(
              onPressed: () {
                AutoRouter.of(context).navigateBack();
              },
              icon: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 108, 14, 164),
                      Color.fromARGB(255, 153, 28, 172)
                    ],
                    end: Alignment.bottomRight,
                    begin: Alignment.topLeft,
                  ),
                ),
                width: 35,
                height: 35,
                child: Icon(
                  Icons.arrow_back,
                  size: 20,
                ),
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            // height: height1,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(40, 10, 0, 0),
                      child: const Text(
                        'Заполните профиль',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 15),
                      child: const Text(
                          'Указывайте ваши настоящие данные, это потребуется при выдаче сертификатов и наград'),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _input('Фамилия', _controllerSurname),
                              _input('Имя', _controllerName),
                              _input('Отчество', _controllerPatronymic),
                              _input('Дата рождения', _controllerBirthday),
                              // _input('Населенный пункт', _controllerCity),
                              // _input('Учебное заведение', _controllerSchool),
                              _input('Класс', _controllerClass),
                              _input('Телефон', _controllerNumb),
                              //Кнопка
                              Container(
                                width: width1,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(1, 4),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 108, 14, 164),
                                      Color.fromARGB(255, 153, 28, 172)
                                    ],
                                    end: Alignment.bottomRight,
                                    begin: Alignment.topLeft,
                                  ),
                                ),
                                // color: Colors.white,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        );
                                        AutoRouter.of(context).pushNamed('/home');
                                        // signUp();
                                      } else {
                                        AutoRouter.of(context).pushNamed('/home');
                                        print('добваить route');
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 15, 0, 15),
                                      child: Text('Зарегистрироваться'),
                                    )),
                              ),
                            ],
                          )),
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                          alignment: AlignmentDirectional.bottomStart,
                          width: width1,
                          child: TextButton(
                              onPressed: () {},
                              style:
                                  TextButton.styleFrom(primary: Colors.green),
                              child: const Text(
                                'При входе на ресурс,\nвы принимаете условия доступа',
                                style: TextStyle(color: Colors.grey),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
