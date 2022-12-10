// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:flutter_app/routes/router.gr.dart';

import 'dart:ui' as ui;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Second extends StatefulWidget {
  final String UserPhone = '123';
  const Second({Key? key, userPhone}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final _controllerNumb = TextEditingController(text: '+7');

  final _formKey = GlobalKey<FormState>();
  // String? get _errorText {
  //   final text = _controllerNumb.value.text;

  //   if (text.isEmpty) {
  //     return 'Can\'t be empty';
  //   }
  //   if (text.toString().trim().length < 18) {
  //     return 'Too short';
  //   }
  //   return null;
  // }

  // void navigate() {
  //   AutoRouter.of(context).push(
  //     ConfirmPassRoute(userPhone: _controllerNumb.text),
  //   );
  // }

  var text = '';
  bool checkField = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width1 = size.width;

    var maskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      type: MaskAutoCompletionType.eager,
      filter: {"#": RegExp(r'[0-9]')},
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height1,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      color: const Color.fromARGB(255, 108, 14, 164),
                      width: width1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipPath(
                              child: CustomPaint(
                            size: Size(
                                width1 / 1.28, (height1 / 1.15).toDouble()),
                            painter: RPSCustomPainter(),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height1 / 1.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(40, 0, 0, 15),
                                  child: const Text(
                                    'Вход по номеру \nтелефона',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(40, 15, 0, 0),
                                  child: const Text(
                                    'Укажите свой номер телефона ниже \nи далее подтвердите его.',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ValueListenableBuilder(
                                  builder:
                                      (context, TextEditingValue value, child) {
                                    text = value.text;
                                    return Form(
                                      key: _formKey,
                                      child: Container(
                                        width: width1 - 40,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          validator: (value) {
                                            print('$value value');
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Поле не может быть пустым';
                                            }
                                            if (value.length < 18) {
                                              return 'нужно 11 цифр';
                                            }
                                          },
                                          inputFormatters: [maskFormatter],
                                          controller: _controllerNumb,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            // errorText:
                                            //     checkField ? _errorText : null,
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red)),
                                            border: OutlineInputBorder(),
                                            labelText: 'Номер телефона',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  valueListenable: _controllerNumb,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 50, 20, 0),
                                  width: width1 - 40,
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
                                      if (_formKey.currentState!.validate()) {
                                        AutoRouter.of(context).push(
                                          ConfirmPassRoute(
                                              userPhone: _controllerNumb.text),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 20, 0, 20),
                                      child: Text('Продолжить'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    width: 30,
                    height: 30,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          iconSize: 25,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          // alignment: Alignment.topLeft,
                          onPressed: () {
                            AutoRouter.of(context).navigateBack();
                          },
                          icon: const Icon(
                            Icons.close_sharp,
                            color: Color.fromARGB(255, 108, 14, 164),
                          )),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                    width: width1 / 2 + 80,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'При входе на ресурс,\nвы принимаете ',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: 'условия доступа',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                AutoRouter.of(context).pushNamed('/license');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Эта переменная для лучшего понимания, какое значение указать в методе quadraticBezierTo
    var controlPoint1 = Offset((size.width / 1) + 30, size.height - 200);
    var controlPoint2 = Offset((size.width / 1) - 180, size.height / 1.1);
    var endPoint = Offset(size.width, size.height - 40);

    Path path = Path()
      ..lineTo(0, 0)
      // ..lineTo(size.width / 3, size.height / 4)
      // ..lineTo(size.width / 1.5, 0)
      // ..lineTo(size.width, 0)
      ..lineTo(0, size.height - 200)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      // ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

//Фигуры с волнистыми линиями
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint0.shader = ui.Gradient.linear(
        Offset(size.width * 0.2, size.height * 0.42),
        Offset(size.width, size.height * 0.75), [
      const Color.fromARGB(255, 153, 28, 172),
      const Color.fromARGB(150, 121, 14, 164),
      const Color.fromARGB(0, 108, 14, 164)
    ], [
      0.00,
      0.73,
      0.99
    ]);

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.06380109, size.height * 0.1469723);
    path_0.cubicTo(
        size.width * -0.01459322,
        size.height * 0.2205975,
        size.width * -0.006278841,
        size.height * 0.2982136,
        size.width * 0.01579254,
        size.height * 0.3833060);
    path_0.cubicTo(
        size.width * 0.03786377,
        size.height * 0.4683984,
        size.width * 0.1675728,
        size.height * 0.5691786,
        size.width * 0.3329120,
        size.height * 0.6005955);
    path_0.cubicTo(
        size.width * 0.4286232,
        size.height * 0.6187700,
        size.width * 0.5495362,
        size.height * 0.6216961,
        size.width * 0.6369710,
        size.height * 0.6504209);
    path_0.cubicTo(
        size.width * 0.7615507,
        size.height * 0.6914292,
        size.width * 0.8121486,
        size.height * 0.7488049,
        size.width * 0.8586775,
        size.height * 0.8339589);
    path_0.cubicTo(
        size.width * 0.7210870,
        size.height * 0.9481622,
        size.width * 1.043804,
        size.height * 0.9942916,
        size.width * 1.251254,
        size.height * 0.9981520);
    path_0.cubicTo(
        size.width * 1.473902,
        size.height * 1.002201,
        size.width * 1.695286,
        size.height * 0.9239487,
        size.width * 1.812547,
        size.height * 0.7714805);
    path_0.cubicTo(
        size.width * 1.896511,
        size.height * 0.6622464,
        size.width * 1.905228,
        size.height * 0.5392033,
        size.width * 1.842417,
        size.height * 0.4255092);
    path_0.cubicTo(
        size.width * 1.740627,
        size.height * 0.2413326,
        size.width * 1.446826,
        size.height * -0.08269055,
        size.width * 0.6318623,
        size.height * -0.04419671);
    path_0.cubicTo(
        size.width * 0.3201938,
        size.height * -0.02948686,
        size.width * 0.1771087,
        size.height * 0.04082423,
        size.width * 0.06380109,
        size.height * 0.1469723);
    path_0.close();

    canvas.drawPath(path_0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
