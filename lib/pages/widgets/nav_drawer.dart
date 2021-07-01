import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/route_name.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 40),
      color: Colors.blue[900],
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                // Get.toNamed(RouteName.page_user);
              },
              child: Text('User', style: TextStyle(color: Colors.white))),
          // TextButton(
          //     onPressed: () {
          //       Get.toNamed(RouteName.page_takmir);
          //     },
          //     child: Text('takmir', style: TextStyle(color: Colors.white))),
          TextButton(
              onPressed: () {
                Get.toNamed(RouteName.list_masjid);
              },
              child: Text(
                'masjid',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
