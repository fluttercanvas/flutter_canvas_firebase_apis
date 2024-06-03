import 'package:flutter_canvas_firebase_apis/flutter_canvas_firebase_apis.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseInit();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? docId;
  _insertDocument({data, collectionName}) async {
    String newDocId = await insert(data, collectionName);
    var snackBar = SnackBar(
      content: Text('Inserted Succesfully , document ID: $newDocId'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _insertDocument(
                  data: {'name': 'John Doe', 'age': 30},
                  collectionName: 'user'),
              child: Text('Insert Document'),
            ),
          ],
        ),
      ),
    );
  }
}
