// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:isar/isar.dart';
// import 'package:mobx/mobx.dart';
// import './login_store.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _LoginPage();
// }

// class _LoginPage extends State<LoginPage> {
//   final LoginStore loginStore = LoginStore();

//   void initState() {
//     super.initState();
//     loginStore.setupValidations();
//   }

//   void dispose() {
//     loginStore.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Observer(
//               builder: (_) => TextField(
//                 onChanged: (value) => loginStore.username = value,
//                 decoration: InputDecoration(
//                     labelText: "Username",
//                     hintText: "Enter username",
//                     errorText: loginStore.error.username),
//               ),
//             ),
//             SizedBox(
//               height: 16.0,
//             ),
//             Observer(
//               builder: (_) => TextField(
//                 onChanged: (value) => loginStore.password = value,
//                 decoration: InputDecoration(
//                     labelText: "Password",
//                     hintText: "Enter password",
//                     errorText: loginStore.error.password),
//               ),
//             ),
//             SizedBox(
//               height: 16.0,
//             ),
//             Observer(
//                 builder: (_) => TextButton(
//                       onPressed: loginStore.canLogin ? () {} : null,
//                       child: Text("Login"),
//                     ))
//           ],
//         ),
//       ),
//     );
//   }
// }
