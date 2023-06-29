import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/page/todo_add_page.dart';
import '../main.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///Providerから値を受け取る
    final User user = ref.watch(userProvider.notifier).state!;
    final AsyncValue<QuerySnapshot> asyncPostQuery = ref.watch(usersQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title:const Text('リスト一覧',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              //ログアウト処理
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pop();
              //await Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => FirstPage()));
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurpleAccent,
      ),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Text('ログイン情報:${user.email}'),
          ),
          Expanded(
            child: asyncPostQuery.when(
              ///値が取得できた時
              data: (QuerySnapshot query) {
                return ListView(
                  children: query.docs.map((document) {
                    return Card(
                      child: ListTile(
                        title: Text(document['text']),
                        subtitle: Text(document['email']),
                        trailing: document['email'] == user.email
                            ? IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            // 投稿メッセージのドキュメントを削除
                            await FirebaseFirestore.instance
                                .collection('posts')
                                .doc(document.id)
                                .delete();
                          },
                        )
                            : null,
                      ),
                    );
                  }).toList(),
                );
              },
              ///値が読み込み中の時
              loading: () {
                return const Center(
                  child: Text('読込中...'),
                );
              },
              ///値の取得に失敗した時
              error: (e, stackTrace) {
                return Center(
                  child: Text(e.toString()),
                );
              }
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            })
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}