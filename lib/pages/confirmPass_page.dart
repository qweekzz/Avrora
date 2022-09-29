import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_app/globals.dart' as globals;

import 'package:auto_route/auto_route.dart';

class ConfirmPass extends StatefulWidget {
  final String userPhone;

  const ConfirmPass({required this.userPhone});

  @override
  State<ConfirmPass> createState() => _ConfirmPassState();
}

class _ConfirmPassState extends State<ConfirmPass> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final _controller6 = TextEditingController();
  String _verificationCode = '';
  var name = '';
  var all = '';
  final node1 = FocusNode();
  final node2 = FocusNode();
  final node3 = FocusNode();
  final node4 = FocusNode();
  final node5 = FocusNode();
  final node6 = FocusNode();

  // var random = new Random();
  // late var randomNumber = random.nextInt(code.length);
  // late var randomNumberFromList = code.elementAt(randomNumber);
  // List code = [
  //   '1234',
  //   '4636',
  //   '8563',
  //   '1204',
  //   '6538',
  //   '4723',
  //   '9597',
  //   '5645',
  //   '2952',
  //   '3907',
  // ];

  _sendPass() {
    print('Код: ' + globals.code.elementAt(globals.randomNumber));
    return print(globals.randomNumber);
  }

  _OnChanged1(String $text1) {
    print($text1);
    node1.nextFocus();
    return $text1;
  }

  _OnChanged2(String $text2) {
    print($text2);
    node2.nextFocus();
    return $text2;
  }

  _OnChanged3(String $text3) {
    print($text3);
    node3.nextFocus();
    return $text3;
  }

  _OnChanged4(String $text4) {
    print($text4);
    node4.nextFocus();
    return $text4;
  }

  _OnChanged5(String $text5) {
    print($text5);
    node5.nextFocus();
    return $text5;
  }

  _OnChanged6(String $text6) {
    print($text6);
    node6.nextFocus();
    return $text6;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height1 = size.height;
    var width1 = size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leadingWidth: 110,
          leading: IconButton(
              onPressed: () {
                AutoRouter.of(context).navigateBack();
              },
              icon: Container(
                // margin: EdgeInsets.only(left: 15),
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
        body: Column(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 10,
              child: Container(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  width: width1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: const Text(
                                    'Введите код',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700),
                                  ))
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Text(
                                      'На номер телефона ${widget.userPhone} был отправлен код подтверждения, введите его в поле ниже.'))
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // padding: EdgeInsets.fromLTRB(16, 16, 12, 16),
                                  width: 42,
                                  // height: 88,
                                  margin: const EdgeInsets.only(right: 12),
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 38,
                                    ),
                                    controller: _controller1,
                                    focusNode: node1,
                                    onChanged: _OnChanged1,
                                    // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    maxLines: 1,
                                    maxLength: 1,
                                    // maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                                    textInputAction: TextInputAction.next,
                                    showCursor: false,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    // autofocus: true,
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      isCollapsed: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 16, 10, 16),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 108, 14, 164),
                                      )),
                                    ),
                                  ),
                                ),
                                Container(
                                  // padding: EdgeInsets.fromLTRB(16, 16, 12, 16),
                                  width: 42,
                                  // height: 88,
                                  margin: const EdgeInsets.only(right: 12),
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 38,
                                    ),
                                    controller: _controller2,
                                    focusNode: node2,
                                    onChanged: _OnChanged2,
                                    maxLines: 1,
                                    maxLength: 1,
                                    // maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                                    showCursor: false,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    // autofocus: true,
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      isCollapsed: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 16, 10, 16),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 108, 14, 164),
                                      )),
                                    ),
                                  ),
                                ),
                                Container(
                                  // padding: EdgeInsets.fromLTRB(16, 16, 12, 16),
                                  width: 42,
                                  // height: 88,
                                  margin: const EdgeInsets.only(right: 12),
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 38,
                                    ),
                                    controller: _controller3,
                                    focusNode: node3,
                                    onChanged: _OnChanged3,
                                    maxLines: 1,
                                    maxLength: 1,
                                    // maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                                    showCursor: false,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    // autofocus: true,
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      isCollapsed: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 16, 10, 16),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 108, 14, 164),
                                      )),
                                    ),
                                  ),
                                ),
                                Container(
                                  // padding: EdgeInsets.fromLTRB(16, 16, 12, 16),
                                  width: 42,
                                  // height: 88,
                                  margin: const EdgeInsets.only(right: 12),
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 38,
                                    ),
                                    controller: _controller4,
                                    focusNode: node4,
                                    onChanged: _OnChanged4,
                                    maxLines: 1,
                                    maxLength: 1,
                                    // maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                                    showCursor: false,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    // autofocus: true,
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      isCollapsed: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 16, 10, 16),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 108, 14, 164),
                                      )),
                                    ),
                                  ),
                                ),
                                Container(
                                  // padding: EdgeInsets.fromLTRB(16, 16, 12, 16),
                                  width: 42,
                                  // height: 88,
                                  margin: const EdgeInsets.only(right: 12),
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 38,
                                    ),
                                    controller: _controller5,
                                    focusNode: node5,
                                    onChanged: _OnChanged5,
                                    maxLines: 1,
                                    maxLength: 1,
                                    // maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                                    showCursor: false,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    // autofocus: true,
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      isCollapsed: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 16, 10, 16),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 108, 14, 164),
                                      )),
                                    ),
                                  ),
                                ),
                                Container(
                                  // padding: EdgeInsets.fromLTRB(16, 16, 12, 16),
                                  width: 42,
                                  // height: 88,
                                  margin: const EdgeInsets.only(right: 12),
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 38,
                                    ),
                                    controller: _controller6,
                                    focusNode: node6,
                                    onChanged: _OnChanged6,
                                    maxLines: 1,
                                    maxLength: 1,
                                    // maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                                    showCursor: false,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    // autofocus: true,
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      isCollapsed: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 16, 10, 16),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 108, 14, 164),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: width1,
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
                                onPressed: () async {
                                  setState(() {
                                    name = _controller1.text;
                                    all = _controller1.text +
                                        _controller2.text +
                                        _controller3.text +
                                        _controller4.text +
                                        _controller5.text +
                                        _controller6.text;
                                  });
                                  print(all);
                                  await FirebaseAuth.instance
                                      .signInWithCredential(
                                          PhoneAuthProvider.credential(
                                              verificationId: _verificationCode,
                                              smsCode: all))
                                      .then((value) => {
                                            if (value.user != null)
                                              {
                                                print(
                                                    'пользователь вошел в систему 2'),
                                                AutoRouter.of(context)
                                                    .pushNamed('/reg')
                                              }
                                            else
                                              {
                                                print('test поьзователя 2'),
                                              }
                                          });
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: Text('Подтвердить код'),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  width: width1,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: TextButton(
                            onPressed: () {
                              _sendPass();
                            },
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Отправить код повторно'),
                                  Icon(Icons.replay)
                                ],
                              ),
                            )),
                      ),
                      Container(
                        alignment: AlignmentDirectional.bottomStart,
                        width: width1,
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(primary: Colors.green),
                            child: Text(
                              'При входе на ресурс,\nвы принимаете условия доступа',
                              style: TextStyle(color: Colors.grey),
                            )),
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.userPhone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => {
                  if (value.user != null)
                    {
                      print('пользователь вошел в систему'),
                    }
                  else
                    {
                      print('test поьзователя'),
                    }
                });
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        print('ERROR ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  @override
  void initState() {
    _verifyPhone();
    super.initState();
  }
}



// TextField(
//   // autofocus: true,
//   decoration: InputDecoration(
//     isCollapsed: true,
//     contentPadding: EdgeInsets.fromLTRB(8, 16, 12, 16),
//     border: OutlineInputBorder(

//     ),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Color.fromARGB(255, 108, 14, 164),
//       )
//     ),
//   ),
// ),