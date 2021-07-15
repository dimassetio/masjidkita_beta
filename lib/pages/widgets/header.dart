import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderBar {
  var appBar = AppBar(
    actions: [
      IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back))
    ],
    backgroundColor: Colors.blue[900],
    title: Text('Jajal Firestore'),
  );
}
