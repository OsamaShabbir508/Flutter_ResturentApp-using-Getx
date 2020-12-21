import 'package:after_node_flutter/controllers/catcontroller.dart';
import 'package:after_node_flutter/view/MianDrwaer.dart';
import 'package:flutter/material.dart';
import 'package:after_node_flutter/view/gridview.dart';
import 'package:after_node_flutter/view/Favourite.dart';
import 'package:get/get.dart';

class BottomNaBar extends StatelessWidget {
  final catController c = Get.put(catController());
  List<Map<String, Widget>> _list = [
    {'Category': GView()},
    {'favourite': Favourite()}
  ];
  selectItem(index) {
    c.navBar.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(
            _list[c.navBar.value].keys.contains('Category')
                ? 'Category'
                : 'Favourite',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
            textAlign: TextAlign.center,
          );
        }),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      drawer: MainDrwer(),
      body: Obx(() => _list[c.navBar.value].containsKey('Category')
          ? GView()
          : Favourite()),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: c.navBar.value,
            onTap: selectItem,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                    color: Colors.purple,
                  ),
                  label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.purple,
                  ),
                  label: 'Favourite'),
            ]),
      ),
    );
  }
}
