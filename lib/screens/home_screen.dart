import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference rootRef = FirebaseDatabase.instance.ref();
  List<dynamic> boardList = [];

  @override
  void initState() {
    super.initState();
    rootRef.get().then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          boardList = snapshot.value as List? ?? [];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("게시물 목록"),
      ),
      body: Column(
        children: boardList.map((item) => Text(item["title"])).toList(),
      ),
    );
  }
}



// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("회원가입"),
//         centerTitle: true,
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(
//           vertical: 20,
//           horizontal: 30,
//         ),
//         children: [
//           Text(
//             "다음 정보를 모두 입력해주세요.",
//             textAlign: TextAlign.center,
//           ),
//           TextField(
//             autocorrect: false,
//             autofocus: true,
//             decoration: InputDecoration(
//               hintText: "이름",
//             ),
//             keyboardType: TextInputType.name,
//             textInputAction: TextInputAction.next,
//           ),
//           TextField(
//             autocorrect: false,
//             decoration: InputDecoration(
//               hintText: "이메일",
//             ),
//             keyboardType: TextInputType.emailAddress,
//             textInputAction: TextInputAction.next,
//           ),
//           TextField(
//             autocorrect: false,
//             decoration: InputDecoration(
//               hintText: "비밀번호",
//             ),
//             textInputAction: TextInputAction.next,
//             obscureText: true,
//           ),
//           TextField(
//             autocorrect: false,
//             decoration: InputDecoration(
//               hintText: "비밀번호 확인",
//             ),
//             textInputAction: TextInputAction.done,
//             obscureText: true,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Switch(
//                 value: false,
//                 onChanged: (_) {},
//               ),
//               Text("이용약관에 동의합니다."),
//             ],
//           ),
//           ElevatedButton.icon(
//             icon: Icon(Icons.send),
//             label: Text("제출"),
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
