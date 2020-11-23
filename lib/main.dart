import 'package:flutter/material.dart';

void main () => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData (
    brightness: Brightness.dark,
    primaryColor: Colors.deepOrange,
    accentColor: Colors.grey,
  ),
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = List();
  String input = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDoS"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Add ToDo"),
                content: TextField(
                  onChanged: (String val) {
                    input = val;
                  },
                ),
                actions: <Widget>[
                  FlatButton(onPressed: () {
                    setState(() {
                      setState(() {
                        todos.add(input);
                      });
                    });
                    Navigator.of(context).pop();
                  },
                      child: Text("Add"))
                ],
              );
            }
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(key: Key (todos[index]), child: Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                  title: Text(todos[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                      color: Colors.red),
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);
                        });
                      },
                    ),
                  ),

            ));
    }),
    );
  }
}
