import 'package:after_node_flutter/view/bottomNavigation.dart';
import 'package:after_node_flutter/view/gridview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrwer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Column(
        children: [
          Container(
              height: 220,
              color: Colors.purple,
              width: double.infinity,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Meal App',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.blueAccent,
                      thickness: 2,
                    ),
                  )
                ],
              )),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: IconButton(
                  icon: Icon(Icons.category),
                  onPressed: () => {
                        Get.to(BottomNaBar()),
                      }),
            ),
            title: Text(
              'Category',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: IconButton(
                  icon: Icon(Icons.favorite_border_outlined),
                  onPressed: () => {
                        Get.to(BottomNaBar()),
                      }),
            ),
            title: Text(
              'Favourite',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
