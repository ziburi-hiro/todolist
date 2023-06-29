import 'package:flutter/material.dart';
import 'package:todoapp/page/Make_User_page.dart';
import 'package:todoapp/page/login_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => MakeUserPage()));
                    },
                    child: const Text('ユーザー登録'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, left: 30.0,bottom: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    child: const Text('ログイン'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
