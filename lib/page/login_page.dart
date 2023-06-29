import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/page/todolist_page.dart';

import '../main.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///Providerから値を受け取る
    final infoText = ref.watch(infoTextProvider);
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン画面',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              TextFormField(
                // テキスト入力のラベルを設定
                decoration: const InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  ref.watch(emailProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: "パスワード（６文字以上）"),
                // パスワードが見えないようにする
                obscureText: true,
                onChanged: (String value) {
                  ref.watch(passwordProvider.notifier).state = value;
                },
              ),

              const SizedBox(height: 8),

              ElevatedButton(
                onPressed: () async {
                  try {
                    // メール/パスワードでユーザー登録
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final UserCredential result =
                    await auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    //ログインに成功した場合
                    // 登録したユーザー情報
                    ref.watch(userProvider.notifier).state = result.user;
                    if (result.user != null){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TodoListPage()));
                    }
                  }catch (e) {
                    //ログインに失敗した場合
                    ref.watch(infoTextProvider.notifier).state = 'ログインに失敗しました:${e.toString()}';
                  }
                },
                child: const Text("ログイン"),
              ),
              const SizedBox(height: 8),
              Text(infoText)
            ],
          ),
        ),
      ),
    );
  }
}