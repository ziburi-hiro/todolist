import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/page/admin_mobile.dart';

class TodoAddPage extends ConsumerWidget {
  const TodoAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///Providerから値を受け取る
    final user = ref.watch(userProvider);
    final messageText = ref.watch(messageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加画面',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(messageText),

            const SizedBox(height: 8,),

            TextField(
              decoration: const InputDecoration(
                  labelText: 'ToDoテキスト'
              ),
              onChanged: (String value){
                ref.watch(messageProvider.notifier).state = value;
              },
            ),

            const SizedBox(height: 8,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  //現在の時刻取得
                  final date = DateTime.now().toLocal().toIso8601String();
                  final email = user!.email;
                  //make a document
                  await FirebaseFirestore.instance.collection('users').doc().set({
                    'text' : messageText,
                    'email' : email,
                    'date' : date,
                  });

                  Navigator.of(context).pop();
                },
                child: const Text('リスト追加'),
              ),
            ),

            const SizedBox(height: 8,),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('キャンセル'),
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return AdminMobilePage();
                      })
                  );
                },
                child: const Text('Test'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
