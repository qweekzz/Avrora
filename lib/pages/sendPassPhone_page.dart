// import 'package:flutter/material.dart';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter_app/routes/router.gr.dart';

// class SendPassPhonePage extends StatefulWidget {
//   final String phoneTest = 'qweek123';
//   const SendPassPhonePage({Key? key, phoneTest}) : super(key: key);

//   @override
//   _SendPassPhonePageState createState() => _SendPassPhonePageState();
// }

// class _SendPassPhonePageState extends State<SendPassPhonePage> {
//   final String _url = 'http://test.com';
//   final _controller1 = TextEditingController();

//   _sendPass() {
//     return print('randomNumber');
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var height1 = size.height;
//     var width1 = size.width;

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
//         margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
//         color: Colors.white,
//         child: Column(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Phone authentication',
//                   style: TextStyle(fontSize: 32),
//                 ),
//               ],
//             ),
//             Padding(padding: EdgeInsets.only(bottom: 40)),
//             Column(
//               children: [
//                 TextField(
//                   controller: _controller1,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Номер телефона',
//                   ),
//                 ),
//               ],
//             ),
//             Padding(padding: EdgeInsets.only(bottom: 20)),
//             Column(
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       AutoRouter.of(context)
//                           .push(OtpPageRoute(phoneTest: _controller1.text));
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
// }
