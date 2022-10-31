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

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static const prifile = AssetImage('images/prof2.png');
  @override
  Widget build(BuildContext context) {
    return Select(context);
  }

  Widget Select(BuildContext context) => FutureBuilder(
      future: DateBase().checkUser(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return bol ? profilePage() : _NullProfile();
      });

  Widget profilePage() {
    return BlocProvider<counterBloc>(
      create: (BuildContext context) => counterBloc(),
      child:
          BlocBuilder<counterBloc, int>(builder: (BuildContext context, state) {
        const prifile = AssetImage('images/prof2.png');
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
                                    const prifile =
                                        AssetImage('images/prof2.png');
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

  Widget _NullProfile() {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width1 = size.width;
    const prifile = AssetImage('images/prof2.png');
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
}
