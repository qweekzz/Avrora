import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/counterBloc.dart';
import '../services/database.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
String birthDateInString = '';

class Reg extends StatefulWidget {
  Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  final _formKey = GlobalKey<FormState>();

  final _controllerNumb = TextEditingController();
  final _controllerName = TextEditingController();
  final _controllerNickname = TextEditingController();
  TextEditingController _controllerBirthday =
      TextEditingController(text: birthDateInString);
  final _controllerCity = TextEditingController();
  final _controllerClass = TextEditingController();
  final _controllerSchool = TextEditingController();
  final _controllerAge = TextEditingController();

  bool isDateSelected = false;
  late DateTime birthDate; // instance of DateTime
  // late String birthDateInString;

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

    return BlocProvider<counterBloc>(
      create: (BuildContext context) => counterBloc(),
      child: BlocBuilder<counterBloc, int>(
        builder: (BuildContext context, state) {
          return Scaffold(
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
                        padding: const EdgeInsets.fromLTRB(40, 35, 0, 0),
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
                                _input('Nickname', _controllerNickname),
                                _input('ФИО', _controllerName),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: TextFormField(
                                    controller: _controllerBirthday,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Поле не может быть пустым';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () async {
                                            final DateTime? datePick =
                                                await showDatePicker(
                                                    context: context,
                                                    initialEntryMode:
                                                        DatePickerEntryMode
                                                            .input,
                                                    initialDate:
                                                        new DateTime.utc(
                                                            1999, 1, 1),
                                                    firstDate:
                                                        new DateTime(1900),
                                                    lastDate:
                                                        new DateTime(2023),
                                                    helpText:
                                                        'выберите дату рождения',
                                                    fieldHintText:
                                                        'дд/мм/гггг');
                                            if (datePick != null) {
                                              setState(() {
                                                birthDate = datePick;
                                                birthDateInString =
                                                    "${birthDate.day.toString().padLeft(2, '0')}.${birthDate.month.toString().padLeft(2, '0')}.${birthDate.year.toString().padLeft(2, '0')}";
                                                _controllerBirthday =
                                                    TextEditingController(
                                                        text:
                                                            birthDateInString);
                                              });
                                            }
                                            String timestamp =
                                                "${birthDate.year.toString()}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}";
                                            print("$timestamp qwe");
                                            // print(birthDateInString);
                                          },
                                          icon: Icon(Icons.date_range)),
                                      labelText: 'Birthday',
                                      labelStyle: TextStyle(
                                        fontSize: 16,
                                      ),
                                      counterText: '',
                                      isCollapsed: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 18, 10, 18),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.0)),
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 108, 14, 164),
                                          )),
                                    ),
                                  ),
                                ),
                                _input('Класс', _controllerClass),
                                _input('Телефон', _controllerNumb),
                                _input('Населенный пункт', _controllerCity),
                                _input('Учебное заведение', _controllerSchool),
                                _input('Возраст', _controllerAge),
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
                                          DateBase().addUser(
                                              Users(
                                                name: _controllerName.text,
                                                nickName:
                                                    _controllerNickname.text,
                                                city: _controllerCity.text,
                                                school: _controllerSchool.text,
                                                age: int.parse(
                                                    _controllerAge.text),
                                                birthday:
                                                    (_controllerBirthday.text),
                                                schoolClass: int.parse(
                                                    _controllerClass.text),
                                                phoneNumber: int.parse(
                                                    _controllerNumb.text),
                                                ava: '',
                                              ),
                                              _controllerBirthday.text,
                                              _controllerBirthday.text,
                                              _controllerBirthday.text);
                                          print('OK');
                                          AutoRouter.of(context)
                                              .pushNamed('/home');
                                        } else {
                                          print('validation failed');
                                          // AutoRouter.of(context).pushNamed('/home');
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
        },
      ),
    );
  }
}
