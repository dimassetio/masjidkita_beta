import 'package:firestore_demo/services/database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputMasjid extends StatelessWidget {
  const InputMasjid({
    Key key,
    @required this.namaController,
    @required this.kotaController,
  }) : super(key: key);

  final TextEditingController namaController;
  final TextEditingController kotaController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black12,
            offset: Offset(-5, 0),
            blurRadius: 15,
            spreadRadius: 3)
      ]),
      width: double.infinity,
      height: 130,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  style: GoogleFonts.poppins(),
                  controller: namaController,
                  decoration: InputDecoration(hintText: "Nama"),
                ),
                TextField(
                  style: GoogleFonts.poppins(),
                  controller: kotaController,
                  decoration: InputDecoration(hintText: "Kota"),
                ),
              ],
            ),
          ),
          Container(
            height: 130,
            width: 130,
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.blue[900],
                child: Text(
                  'Add Data',
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Database().addMasjid(
                    namaController.text,
                    kotaController.text,
                  );
                  namaController.clear();
                  kotaController.clear();
                }),
          )
        ],
      ),
    );
  }
}
