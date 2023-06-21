import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/page/todo_add_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト一覧',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //firebasecloudに値追加
          await FirebaseFirestore.instance.collection('users').doc('id_jkl').set({'name':'ikuko','age':56});
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return const TodoAddPage();
          }),
          );
          if (newListText != null){
            setState(() {
              todoList.add(newListText);
            });
          }
          print(widget.email);
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
