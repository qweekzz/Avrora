import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// Все 3 страницы вообщем
class _HomePageState extends State<HomePage> {
  int index = 0;

  final _formKey = GlobalKey<FormState>();

  final _controllerNumb = TextEditingController();
  final _controllerName = TextEditingController();
  final _controllerSurname = TextEditingController();
  final _controllerPatronymic = TextEditingController();
  final _controllerBirthday = TextEditingController();
  final _controllerCity = TextEditingController();
  final _controllerClass = TextEditingController();
  final _controllerSchool = TextEditingController();

  // var a = FirebaseAuth.instance.currentUser?.uid;
  // var tes;
  // bool bo = tes;

  static const prifile = AssetImage('images/prof2.png');

  late List<Widget> _contentInHomePage = <Widget>[
    // Page 1
    _NullProfile(),
    // Page 2
    _register(context),
    // Page 3
    _selectPage(context)
  ];

  // Кастомный Widget для input на странице _register
  // Widget _selectPage() {
  //   return bol ? _profilePage() : _NullProfile();
  // }

  Widget _selectPage(BuildContext context) => FutureBuilder(
      future: DateBase().checkUser(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return bol ? _profilePage() : _NullProfile();
      });

  @override
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

  // Страница регистрации
  Widget _register(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width1 = size.width;

    return SingleChildScrollView(
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
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
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
                          _input('Класс', _controllerClass),
                          _input('Телефон', _controllerNumb),
                          // _input('Населенный пункт', _controllerCity),
                          // _input('Учебное заведение', _controllerSchool),
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
                                    DateBase().addUser(Users(
                                      name: _controllerName.text,
                                      surname: _controllerSurname.text,
                                      patronymic: _controllerPatronymic.text,
                                      birthday:
                                          int.parse(_controllerBirthday.text),
                                      schoolClass:
                                          int.parse(_controllerClass.text),
                                      phoneNumber:
                                          int.parse(_controllerNumb.text),
                                    ));
                                    print('OK');
                                    // AutoRouter.of(context).pushNamed('/home');
                                  } else {
                                    print('validation failed');
                                    // AutoRouter.of(context).pushNamed('/home');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
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
                          style: TextButton.styleFrom(primary: Colors.green),
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
    );
  }

  // Страница заполненного профили (сделать динамику)
  Widget _profilePage() {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 6,
                child: Container(
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 108, 14, 164),
                        Color.fromARGB(255, 153, 28, 172)
                      ],
                      end: Alignment.bottomRight,
                      begin: Alignment.topLeft,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: prifile,
                          width: 100,
                          // height: 180,
                          // fit: BoxFit.cover,
                        ),
                        Padding(padding: EdgeInsets.only(top: 25)),
                        Text(
                          'Nickname',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 75, 0, 0)),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Информация",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.house,
                                            color: Colors.blue,
                                            size: 50,
                                          )
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Адрес',
                                                style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2)),
                                          Column(
                                            children: [
                                              Text(
                                                'Генерала Горбатого 7/5',
                                                style: TextStyle(fontSize: 14),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: Colors.green,
                                            size: 50,
                                          )
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Телефон',
                                                style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2)),
                                          Column(
                                            children: [
                                              Text(
                                                '+7 (982) 445 38 85',
                                                style: TextStyle(fontSize: 14),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.school,
                                            color: Colors.red,
                                            size: 50,
                                          )
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Учебное заведение',
                                                style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2)),
                                          Column(
                                            children: [
                                              Text(
                                                'Генерала Горбатого 7/5',
                                                style: TextStyle(fontSize: 14),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.science,
                                            color: Colors.orange,
                                            size: 50,
                                          )
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Последний курс',
                                                style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2)),
                                          Column(
                                            children: [
                                              Text(
                                                'Биология 10-11 класс',
                                                style: TextStyle(fontSize: 14),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 80,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 40),
            // color: Colors.white,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Age',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 16)),
                          Text('15',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Birthday',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 16)),
                          Text('5 марта',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Class',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 16)),
                          Text('7a',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Страница не заполненного профили (сделать динамику)
  Widget _NullProfile() {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width1 = size.width;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 6,
                child: Container(
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 108, 14, 164),
                        Color.fromARGB(255, 153, 28, 172)
                      ],
                      end: Alignment.bottomRight,
                      begin: Alignment.topLeft,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //моя картинка из assets
                        Image(
                          image: prifile,
                          width: 100,
                          // height: 180,
                          // fit: BoxFit.cover,
                        ),
                        Padding(padding: EdgeInsets.only(top: 25)),
                        Text(
                          'Гость',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                        Text(
                          'После того как вы войдете в профиль вы сможите делать ...',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                    Column(
                      children: [
                        Container(
                          width: width1,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(1, 4),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              end: Alignment.bottomRight,
                              begin: Alignment.topLeft,
                              colors: [
                                Color.fromARGB(255, 108, 14, 164),
                                Color.fromARGB(255, 153, 28, 172)
                              ],
                            ),
                          ),
                          child: ElevatedButton(
                              onPressed: () {
                                print("${uID!.uid} id пользователя");
                                print("$bol b");
                                // AutoRouter.of(context).pushNamed('/reg');
                                DateBase().getUser();
                                DateBase().getUserData("Name");
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: DateBase().getUserData("Class"),
                              )),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.contact_page,
                                        color: Colors.grey,
                                        size: 35,
                                      )
                                    ],
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10)),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.black87),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'О нас',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 20))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.phone_android,
                                            color: Colors.grey,
                                            size: 35,
                                          )
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10)),
                                      Expanded(
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 25, 0, 0),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'О приложении',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 20))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.school,
                                            color: Colors.grey,
                                            size: 35,
                                          )
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10)),
                                      Expanded(
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 25, 0, 0),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Контакты',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 20))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.science,
                                            color: Colors.grey,
                                            size: 35,
                                          )
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10)),
                                      Expanded(
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 25, 0, 0),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Условие соглашения',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 20))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  // Widget который делит стрицу на 3 (Solomon Bar)
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width1 = size.width;

    return Scaffold(
      body: Center(
        child: _contentInHomePage.elementAt(index),
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: index,
          onTap: (i) => {setState(() => index = i)},
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.book),
              title: Text('study'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text('search'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text('profile'),
            ),
          ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("$bol 3");
    DateBase().checkUser();
    DateBase().getUser();
    DateBase().getUserData('Name');
    print("$bol 4");

    void fun() {
      if (bol == true) {
        print('$bol 1');
      } else {
        print('$bol 2');
      }
    }

    setState(() {
      fun();
    });
    fun();
  }
}
