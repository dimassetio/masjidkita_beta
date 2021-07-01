import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_demo/controller/bindings/binding.dart';
import 'package:firestore_demo/pages/masjid_page.dart';
import 'package:firestore_demo/routes/route_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: StartBinding(),
      home: MasjidPage(),
      getPages: AppPage.pages,
    );
  }
}
