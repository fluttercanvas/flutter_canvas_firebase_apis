import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

fetch(table, [cond]) async {
  Query<Map<String, dynamic>> tempString =
      FirebaseFirestore.instance.collection(table);
  if (cond == null) {
    tempString = FirebaseFirestore.instance.collection(table);
  } else {
    tempString = FirebaseFirestore.instance.collection(table);
    cond.forEach((key, value) {
      tempString = tempString.where(key, isEqualTo: value);
    });
  }
  var tempData = await tempString.get();
  return tempData.docs;
}

fetchDoc(table, cond) async {
  DocumentReference<Map<String, dynamic>> tempString;
  tempString = FirebaseFirestore.instance.collection(table).doc(cond);
  var tempData = await tempString.get();
  return tempData.data();
}

insert(data, table) async {
  CollectionReference<Map<String, dynamic>> tempString;
  tempString = FirebaseFirestore.instance.collection(table);
  var tempData = await tempString.add(data);
  return tempData.id;
}

Future update(data, table, cond) async {
  var tempString = FirebaseFirestore.instance.collection(table);
  tempString.doc(cond).set(data).then((value) {
    var tempData = cond;
    return tempData;
  }).catchError((error) => debugPrint("Failed to update user: $error"));
}

Future updateToken(data, table, cond) async {
  if (DateTime.now().day == 15 || DateTime.now().day == 28) {
    return update(data, table, cond);
  }
}

delete(table, cond) async {
  CollectionReference<Map<String, dynamic>> tempString;
  tempString = FirebaseFirestore.instance.collection(table);
  tempString.doc(cond).delete().then((value) {
    return cond;
  });
}
