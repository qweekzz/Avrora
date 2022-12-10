import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:flutter_app/routes/router.gr.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import '../services/counterBloc.dart';
import '../services/database.dart';

import '../services/auth.dart';

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

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  static const prifile = AssetImage('images/prof2.png');
  List userList = [];

  //убрать в отдельный файл
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  late List<Widget> _contentInHomePage = <Widget>[
    // Page 1
    MainHome(),
    // Page 2
    register(context),
    // _register(context),
    // Page 3
    Select(context)
  ];

  // Кастомный Widget для input на странице _register
  // Widget _selectPage() {
  //   return bol ? _profilePage() : _NullProfile();
  // }

  Widget Select(BuildContext context) => FutureBuilder(
      future: DateBase().checkUser(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return bol ? profilePage() : _NullProfile();
      });

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
  Widget register(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width1 = size.width;

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: DateBase().key2(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Страница заполненного профили (сделать динамику)
  Widget profilePage() {
    return BlocProvider<counterBloc>(
      create: (BuildContext context) => counterBloc(),
      child:
          BlocBuilder<counterBloc, int>(builder: (BuildContext context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'Open shopping cart',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Хотите выйти?'),
                        // titlePadding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                        content: Text(
                            'Это опять вводить телефон, ждать СМС, вам оно надо?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              AutoRouter.of(context).pop();
                            },
                            child: Text('Отмена'),
                          ),
                          TextButton(
                            onPressed: () async {
                              print('LogOut');
                              AuthServices().signOut();
                              AutoRouter.of(context).pushNamed('/');
                            },
                            child: Text('Выйти'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
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
                            InkWell(
                              onTap: () async {
                                await DateBase().updateAva();
                                await DateBase().addImageToStorage();
                                BlocProvider.of<counterBloc>(context)
                                    .add(counterIncEvent());
                              },
                              child: StreamBuilder(
                                stream:
                                    DateBase().downloadURLStream(ava, context),
                                initialData: Image(
                                  image: prifile,
                                  width: 100,
                                  // height: 180,
                                  // fit: BoxFit.cover,
                                ),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      snapshot.hasData) {
                                    // print(snapshot);
                                    return CircleAvatar(
                                      radius: 50,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                                  NetworkImage(snapshot.data!),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                    );
                                  } else {
                                    return Image(
                                      image: prifile,
                                      width: 100,
                                      // height: 180,
                                      // fit: BoxFit.cover,
                                    );
                                  }
                                },
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 25)),
                            DateBase().getUserData(
                                'Nickname', Colors.white, 18, FontWeight.w400),
                            Text("$state"),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                                  DateBase().getUserData(
                                                      'City',
                                                      Colors.black,
                                                      14,
                                                      FontWeight.w400)
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
                                                  DateBase().getUserData(
                                                      'Phone',
                                                      Colors.black,
                                                      14,
                                                      FontWeight.w400)
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
                                                  DateBase().getUserData(
                                                      'School',
                                                      Colors.black,
                                                      14,
                                                      FontWeight.w400)
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
                                                    '...',
                                                    style:
                                                        TextStyle(fontSize: 14),
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
                              DateBase().getUserData(
                                  'Age', Colors.black, 16, FontWeight.w400),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Birthday',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 16)),
                              DateBase().getUserData('Birthday', Colors.black,
                                  16, FontWeight.w400),
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
                              DateBase().getUserData(
                                  'Class', Colors.black, 16, FontWeight.w400),
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
      }),
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
                                // print("${uID!.uid} id пользователя");
                                // print("$bol b");
                                AutoRouter.of(context).pushNamed('/reg');
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Text("Войти"),
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
                                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                                              padding: EdgeInsets.only(top: 15))
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
                                              EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                                                      EdgeInsets.only(top: 15))
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
                                              EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                                                      EdgeInsets.only(top: 15))
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
                                              EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                                                      EdgeInsets.only(top: 15))
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

  Widget MainHome() {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: DateBase().getSubData(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //проверка на ошибке (вдруг в базе не чего не окажется)
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          //!!! запомнить
          final doc = snapshot.data!.docs;
          return Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: ListView.separated(
              itemCount: doc.length,
              itemBuilder: ((BuildContext context, int index) {
                final docId = snapshot.data!.docs[index].id;
                final data = doc[index].data() as Map<String, dynamic>?;
                print(data!['img']);
                final Url;
                if (data['img'] != null) {
                  Url =
                      'https://firebasestorage.googleapis.com/v0/b/avrora-d2ff5.appspot.com/o/avatars%2F${data['img']}?alt=media&token=3264b4ec-30c0-4aa5-93d8-8ca0b173dd66';
                } else {
                  Url =
                      'https://firebasestorage.googleapis.com/v0/b/avrora-d2ff5.appspot.com/o/avatars%2Fsonnic.png?alt=media&token=3264b4ec-30c0-4aa5-93d8-8ca0b173dd66';
                }
                // var tws = snapshot.data!.docChanges.forEach()
                print("INDEX ${(index)}");
                return Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 235, 31, 224),
                        Color.fromARGB(255, 191, 74, 209),
                        Color.fromARGB(255, 213, 161, 221),
                      ],
                      end: Alignment.bottomRight,
                      begin: Alignment.topLeft,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      // String str = '2ernNzXalG2JOAQZrv0t';
                      // var runes = str.runes.join();
                      // print(runes);
                      AutoRouter.of(context).push(
                          SinagleCourseRoute(courseid: index, doc: docId));
                    },
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                width: 85,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(Url),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10)),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        textDirection: TextDirection.ltr,
                                        children: [
                                          Text(
                                            data['name'],
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'author : ${data['author']}',
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300),
                                          ),
                                          Text(
                                            data['difficult'],
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  // StreamBuilder(
  //         stream: DateBase().getSubData2(),
  //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //           print("SNAP ${snapshot.data?.docs.map((e) => e.id)}");
  //           return ListView.separated(
  //             itemCount: 1,
  //             itemBuilder: ((BuildContext context, int index) {
  //               print("snapshot ${DateBase().getSubData2()}");
  //               return Text('1');
  //             }),
  //             separatorBuilder: (BuildContext context, int index) =>
  //                 const Divider(),
  //           );
  //         },
  //       )

  // FutureBuilder(
  //         future: DateBase().checkUser(),
  //         builder: ((BuildContext context, AsyncSnapshot snapshot) {
  //           // print("snapshot ${snapshot}");
  //           return ListView.separated(
  //             itemCount: 1,
  //             itemBuilder: ((BuildContext context, int index) {
  //               print("snapshot ${DateBase().getSubData2()}");
  //               return DateBase().getSubData();
  //             }),
  //             separatorBuilder: (BuildContext context, int index) =>
  //                 const Divider(),
  //           );
  //         }),
  //       )

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

  // Widget build(BuildContext context) {
  //   return AutoTabsRouter(
  //     // list of your tab routes
  //     // routes used here must be declaraed as children
  //     // routes of /dashboard
  //     routes: [
  //       MainHomePageRoute(),
  //       MyCoursesRoute(),
  //       ProfileRoute(),
  //     ],
  //     builder: (context, child, animation) {
  //       // obtain the scoped TabsRouter controller using context
  //       final tabsRouter = AutoTabsRouter.of(context);
  //       // Here we're building our Scaffold inside of AutoTabsRouter
  //       // to access the tabsRouter controller provided in this context
  //       //
  //       //alterntivly you could use a global key
  //       return Scaffold(
  //         body: FadeTransition(
  //           opacity: animation,
  //           // the passed child is techinaclly our animated selected-tab page
  //           child: child,
  //         ),
  //         bottomNavigationBar: SalomonBottomBar(
  //             currentIndex: tabsRouter.activeIndex,
  //             onTap: (index) {
  //               // here we switch between tabs
  //               tabsRouter.setActiveIndex(index);
  //             },
  //             items: [
  //               SalomonBottomBarItem(
  //                 icon: Icon(Icons.book),
  //                 title: Text('study'),
  //               ),
  //               SalomonBottomBarItem(
  //                 icon: Icon(Icons.search),
  //                 title: Text('search'),
  //               ),
  //               SalomonBottomBarItem(
  //                 icon: Icon(Icons.person),
  //                 title: Text('profile'),
  //               ),
  //             ]),
  //       );
  //     },
  //   );
  // }

  Future? test;

  @override
  void initState() {
    super.initState();
    //СРАБАТЫВАЕТ И ПРИНТ И ФУНКЦИЯ !!!
    DateBase().getAva();
    DateBase().checkUser();
  }
}
