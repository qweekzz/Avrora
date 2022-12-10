// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:firebase_core/firebase_core.dart';

// class OtpPage extends StatefulWidget {
//   final String phoneTest;

//   const OtpPage({required this.phoneTest});

//   @override
//   _OtpPageState createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage> {
//   final _controller1 = TextEditingController();
//   var _verificationCode;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.white,
//         leadingWidth: 110,
//         leading: IconButton(
//             onPressed: () {
//               AutoRouter.of(context).navigateBack();
//             },
//             icon: Container(
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 108, 14, 164),
//                     Color.fromARGB(255, 153, 28, 172)
//                   ],
//                   end: Alignment.bottomRight,
//                   begin: Alignment.topLeft,
//                 ),
//               ),
//               width: 35,
//               height: 35,
//               child: Icon(
//                 Icons.arrow_back,
//                 size: 20,
//               ),
//             )),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Column(
//               children: [
//                 Text('Ваш номер телефона ' +
//                     widget.phoneTest +
//                     ' \nесли это не так то нажмите сюда'),
//               ],
//             ),
//             Column(
//               children: [
//                 TextField(
//                   controller: _controller1,
//                 )
//               ],
//             ),
//             Padding(padding: EdgeInsets.only(bottom: 40)),
//             Column(
//               children: [
//                 ElevatedButton(
//                     onPressed: () async {
//                       await FirebaseAuth.instance
//                           .signInWithCredential(PhoneAuthProvider.credential(
//                               verificationId: _verificationCode,
//                               smsCode: _controller1.text))
//                           .then((value) => {
//                                 if (value.user != null)
//                                   {
//                                     print('пользователь вошел в систему 2'),
//                                   }
//                                 else
//                                   {
//                                     print('test поьзователя 2'),
//                                   }
//                               });
//                     },
//                     style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
//                     child: Padding(
//                       padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
//                       child: Text('Продолжить'),
//                     )),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   _verifyPhone() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: widget.phoneTest,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await FirebaseAuth.instance
//             .signInWithCredential(credential)
//             .then((value) => {
//                   if (value.user != null)
//                     {
//                       print('пользователь вошел в систему'),
//                     }
//                   else
//                     {
//                       print('test поьзователя'),
//                     }
//                 });
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         if (e.code == 'invalid-phone-number') {
//           print('The provided phone number is not valid.');
//         }
//         print('ERROR ${e.message}');
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         setState(() {
//           _verificationCode = verificationId;
//         });
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         setState(() {
//           _verificationCode = verificationId;
//         });
//       },
//       timeout: Duration(seconds: 60),
//     );
//   }

//   @override
//   void initState() {
//     _verifyPhone();
//     super.initState();
//   }
// }
