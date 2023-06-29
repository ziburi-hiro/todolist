import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/page/first_page.dart';

///状態管理用のデータ
///ユーザ情報の受け渡しを行うためのProvider
final userProvider = StateProvider((ref) {
  return FirebaseAuth.instance.currentUser;
});

///エラー情報の受け渡しを行うためのProvider
///autoDisposeは自動で値をリセットできる
final infoTextProvider = StateProvider.autoDispose((ref) {
  return '';
});

///メールアドレスの受け渡しを行うためのProvider
final emailProvider = StateProvider.autoDispose((ref) {
  return '';
});

///パスワードの受け渡しを行うためのProvider
final passwordProvider = StateProvider.autoDispose((ref) {
  return '';
});

///メッセージの受け渡しを行うためのProvider
final messageProvider = StateProvider.autoDispose((ref) {
  return '';
});

///StreamProviderを使うことでStreamも扱うことができる
/// ※ autoDisposeを付けることで自動的に値をリセットできます
final usersQueryProvider = StreamProvider.autoDispose((ref) {
  return FirebaseFirestore.instance
      .collection('users')
      .orderBy('date')
      .snapshots();
});


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ProviderScope(
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstPage(),
    );
  }
}
