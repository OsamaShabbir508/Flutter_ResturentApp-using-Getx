import 'package:flutter/material.dart';
import '../controllers/catcontroller.dart';
import '../view//itemDetail.dart';
import 'package:get/get.dart';

class GView extends StatelessWidget {
  final catController c = Get.put(catController());
  gotoItemDetail(String title, String id) {
    Get.to(ItemDetail(), arguments: [title, id]);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 1.5,
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 12,
          mainAxisSpacing: 15),
      children: c.getCategory().map((e) {
        Color c = e.color;
        return Container(
          height: 100,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          child: InkWell(
            onTap: () => {
              print('tap'),
              print(e.id),
              gotoItemDetail(e.title, e.id),
            },
            child: Card(
              color: c,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              elevation: 15,
              child: Center(
                  child: Text(
                e.title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
        );
      }).toList(),
    );
  }
}
