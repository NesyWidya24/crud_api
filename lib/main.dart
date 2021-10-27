import 'package:crud_api/post_result_model.dart';
import 'package:crud_api/user_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  User user = null;
  String output = "no data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("API Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((postResult != null)
                  ? postResult.id +
                      " |  " +
                      postResult.name +
                      "  | " +
                      postResult.job +
                      "   | " +
                      postResult.created
                  : "Tidak ada data"),
              ElevatedButton(
                onPressed: () {
                  PostResult.connectToApi("kagu", "QA").then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: Text("POST"),
              ),
              Container(
                height: 30,
              ),
              Text((user != null)
                  ? user.id + " |  " + user.name
                  : "Tidak ada data"),
              ElevatedButton(
                onPressed: () {
                  User.connectToApi("3").then((value1) {
                    user = value1;
                    setState(() {});
                  });
                },
                child: Text("GET"),
              ),
              Container(
                height: 30,
              ),
              Text(output),
              ElevatedButton(
                onPressed: () {
                  User.getUsers("2").then((users) {
                    output = "";
                    for (int i = 0; i < users.length; i++)
                      output = output + "[ " + users[i].name + " ] ";
                    setState(() {});
                  });
                },
                child: Text("GET"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
