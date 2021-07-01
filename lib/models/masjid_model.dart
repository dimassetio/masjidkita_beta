import 'package:cloud_firestore/cloud_firestore.dart';

class MasjidModel {
  String nama;
  String kota;
  String masjidID;
  // Timestamp dateCreated;

  MasjidModel({
    this.nama,
    this.kota,
  });

  MasjidModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    masjidID = documentSnapshot.id;
    nama = documentSnapshot.data()["nama"];
    kota = documentSnapshot.data()["kota"];
  }
}
