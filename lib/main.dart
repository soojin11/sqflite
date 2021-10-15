import 'package:flutter/material.dart';
import 'package:sqflite_tutorial/database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sqflite Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  //id는 자동으로 생성되도록 해야함(primary key)
                  int i = await DatabaseHelper.instance
                      .insert({DatabaseHelper.columnName: 'Soojin'});

                  print('the inserted id is $i');
                },
                child: Text('insert'),
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 40)),
              ),
              TextButton(
                onPressed: () async {
                  List<Map<String, dynamic>> queryRows =
                      await DatabaseHelper.instance.queryAll();
                  print(queryRows);
                },
                child: Text('query'),
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 40)),
              ),
              TextButton(
                onPressed: () async {
                  //columnId 12번째꺼 columnName을 Mark로 바꿀 때
                  int updatedId = await DatabaseHelper.instance.update({
                    DatabaseHelper.columnId: 12,
                    DatabaseHelper.columnName: 'Mark'
                  });
                  print(updatedId);
                },
                child: Text('update'),
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 40)),
              ),
              TextButton(
                onPressed: () async {
                  int rowsEffected = await DatabaseHelper.instance.delete(13);
                  print(rowsEffected);
                },
                child: Text('delete'),
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
