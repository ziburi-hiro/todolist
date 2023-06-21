import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({Key? key}) : super(key: key);

  @override
  State<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';
  List<DocumentSnapshot> documentList = [];
  String orderDocumentInfo = '';


  @override
  Widget build(BuildContext context) {
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
            Text(_text),

            const SizedBox(height: 8,),

            TextField(
              onChanged: (String value){
                setState(() {
                  _text = value;
                });
              },
            ),

            const SizedBox(height: 8,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_text);
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

            ElevatedButton(
              onPressed: () async {
                final snapshot = await FirebaseFirestore.instance.collection('users').get();
                setState(() {
                  documentList = snapshot.docs;
                  print(documentList);
                });
              },
              child: Text('ドキュメント一覧取得'),
            ),

            Column(
              children: documentList.map((doc) {
                return ListTile(
                  title: Text('${doc['name']}さん'),
                  subtitle: Text('${doc['age']}歳'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
