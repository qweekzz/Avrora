import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/icon/my_flutter_app_icons.dart';

// import 'package:auto_route/ro';

import 'dart:ui' as ui;

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width1 = size.width;
    var h_Flex2 = 270;
    var w_Flex2 = 270;
    // const Color.fromARGB(255, 108, 14, 164),

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                  flex: 10,
                  fit: FlexFit.loose,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            ClipPath(
                              clipper: MyCustomClipper(),
                              child: Container(
                                  width: width1,
                                  color:
                                      const Color.fromARGB(255, 108, 14, 164),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ClipPath(
                                        child: CustomPaint(
                                          size: Size(width1 / 1.28,
                                              (height1).toDouble()),
                                          painter: RPSCustomPainter(),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            // Text('data')
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.fromLTRB(35, 0, 0, 20),
                                child: Text(
                                  'Вход через социальные сети',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                margin: const EdgeInsets.only(bottom: 30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: const Border(
                                      top: BorderSide(color: Colors.white),
                                      right: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.white),
                                      left: BorderSide(color: Colors.white),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54.withOpacity(0.4),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(1, 4),
                                      )
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Будет позже')),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.facebook,
                                      color: Colors.blue,
                                    )),
                              ),
                              Container(
                                width: 64,
                                height: 64,
                                margin: const EdgeInsets.only(bottom: 30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: const Border(
                                      top: BorderSide(color: Colors.white),
                                      right: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.white),
                                      left: BorderSide(color: Colors.white),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54.withOpacity(0.4),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(1, 4),
                                      )
                                    ]),
                                child: IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Будет позже')),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.email,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Container(
                                width: 64,
                                height: 64,
                                margin: const EdgeInsets.only(bottom: 30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: const Border(
                                      top: BorderSide(color: Colors.white),
                                      right: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.white),
                                      left: BorderSide(color: Colors.white),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54.withOpacity(0.4),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(1, 4),
                                      )
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Уже тут')),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.phone,
                                      color: Colors.green,
                                    )),
                              ),
                              Container(
                                width: 64,
                                height: 64,
                                margin: const EdgeInsets.only(bottom: 30),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: const Border(
                                      top: BorderSide(color: Colors.white),
                                      right: BorderSide(color: Colors.white),
                                      bottom: BorderSide(color: Colors.white),
                                      left: BorderSide(color: Colors.white),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black54.withOpacity(0.4),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(1, 4),
                                      )
                                    ]),
                                child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Будет позже')),
                                      );
                                    },
                                    icon: const Icon(
                                      MyFlutterApp.vk,
                                      color: Colors.blue,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
              Flexible(
                flex: 3,
                child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                width: width1 - 40,
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
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 108, 14, 164),
                                      Color.fromARGB(255, 153, 28, 172)
                                    ],
                                    end: Alignment.bottomRight,
                                    begin: Alignment.topLeft,
                                  ),
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      AutoRouter.of(context)
                                          .pushNamed('/second');
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 20, 0, 20),
                                      child: Text('Вход по номеру телефона'),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                              width: width1 / 2 + 80,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text:
                                          'При входе на ресурс,\nвы принимаете ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: 'условия доступа',
                                      style:
                                          const TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          AutoRouter.of(context)
                                              .pushNamed('/license');
                                        },
                                    ),
                                    TextSpan(text: '3'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
          Positioned(
            top: 50,
            left: 56,
            width: 120,
            child: Column(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 35,
            width: 120,
            child: Column(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 45,
            left: 10,
            width: 120,
            child: Column(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 65,
            left: -5,
            width: 120,
            child: Column(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 90,
            left: -5,
            width: 120,
            child: Column(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 70,
            left: 70,
            width: 130,
            child: Column(
              children: const [
                Text(
                  'АВРОРА',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              ],
            ),
          ),
          Positioned(
            top: 110,
            left: 70,
            width: 130,
            child: Column(
              children: const [
                Text(
                  'центр развития талантов',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Фигуры с волнистыми линиями
class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset((size.width / 6) + 80, size.height + 60);
    var controlPoint2 = Offset((size.width / 3) + 100, size.height - 150);
    var endPoint = Offset(size.width, size.height);

    Path path = Path()
      ..lineTo(0, 0)
      // ..lineTo(size.width / 3, size.height / 4)
      // ..lineTo(size.width / 1.5, 0)
      // ..lineTo(size.width, 0)
      ..lineTo(0, size.height - 60)
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
