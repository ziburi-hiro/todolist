import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/Widget/Post.dart';
import 'package:todoapp/Widget/slidenavigation.dart';

class AdminMobilePage extends StatefulWidget {
  const AdminMobilePage({Key? key}) : super(key: key);

  @override
  State<AdminMobilePage> createState() => _AdminMobilePageState();
}

class _AdminMobilePageState extends State<AdminMobilePage> {
  @override
  Widget build(BuildContext context) {
    final String name;
    final String message;
    final String textReason;
    final Color colorPrimary;
    final Color colorPositive;
    final String textPositive;
    final Color colorNegative;
    final String textNegative;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const SlideNavigation(),
            const VerticalDivider(
              thickness: 1,
              width: 1,
            ),

            Expanded(
              child: Container(
                height: double.infinity,
                color: Colors.grey[300],
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              leading: ClipOval(
                                child: Container(
                                  color: Colors.grey[400],
                                  width: 48,
                                  height: 48,
                                  child: Icon(
                                    Icons.storage,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                              title: const Text('Posts',style: TextStyle(
                                  fontSize: 14
                              ),),
                              subtitle: const Text('20 Posts',style: TextStyle(
                                  fontSize: 10
                              ),),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              leading: ClipOval(
                                child: Container(
                                  color: Colors.grey[400],
                                  width: 48,
                                  height: 48,
                                  child: Icon(
                                    Icons.style,
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ),
                              title: const Text('All Types',style: TextStyle(
                                fontSize: 14,
                              ),),
                              subtitle: const Text(''),
                            ),
                          )
                        ],
                      ),
                    ),

                    Expanded(
                      child: PostList(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}