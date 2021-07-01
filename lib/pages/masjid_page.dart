import 'package:firestore_demo/controller/List_Masjid_Controller.dart';
import 'package:firestore_demo/pages/widgets/nav_drawer.dart';
import 'package:firestore_demo/pages/widgets/form_input_masjid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/masjid_card.dart';
import 'widgets/nav_drawer.dart';

class MasjidPage extends StatelessWidget {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController kotaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ListMasjidController listMasjidC = Get.find();
    return Scaffold(
        drawer: NavDrawer(),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () => Get.changeTheme(
        //         Get.isDarkMode ? ThemeData.light() : ThemeData.dark())),
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Jajal Firestore'),
        ),
        // backgroundColor: Colors.white,
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: listMasjidC.masjids.isEmpty
                    ? Center(child: Text("Belum ada data"))
                    : ListView.builder(
                        itemCount: listMasjidC.masjids.length,
                        itemBuilder: (_, index) {
                          return MasjidCard(
                            listMasjidC.masjids[index],
                          );
                        },
                      ),
              ),
            ),
            // Add Masjid
            InputMasjid(
                namaController: namaController, kotaController: kotaController),
          ],
        ));
  }
}
