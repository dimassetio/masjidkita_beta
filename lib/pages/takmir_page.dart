import 'package:firestore_demo/controller/Takmir_Controller.dart';
import 'package:firestore_demo/pages/widgets/takmir_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/header.dart';
import 'widgets/nav_drawer.dart';

class TakmirPage extends StatelessWidget {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController jabatanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TakmirController takmirC = Get.find();
    return Scaffold(
        // drawer: NavDrawer(),

        appBar: HeaderBar().appBar,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Obx(() => takmirC.takmirs.isEmpty
                ? Center(child: Text("Belum ada Takmir"))
                : ListView.builder(
                    itemCount: takmirC.takmirs.length,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          TakmirCard(takmirC.takmirs[index]),
                        ],
                      );
                      // return TakmirCard(takmirController.takmirs[index]);
                    })),

            // Form Add
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
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
                              controller: jabatanController,
                              decoration: InputDecoration(hintText: "Jabatan"),
                              keyboardType: TextInputType.number,
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              takmirC.addTakmir(
                                namaController.text,
                                jabatanController.text,
                                Get.parameters['id'],
                              );
                              print('screen passed');
                              namaController.clear();
                              jabatanController.clear();
                            }),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
