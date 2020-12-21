import 'package:after_node_flutter/view/SingleItemDetail.dart';
import 'package:after_node_flutter/controllers/catcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetail extends StatelessWidget {
  final catController c = Get.put(catController());

  // getTODetail(String id) {
  //   Get.to(SingleItemDetail(), arguments:  id);
  // }

  @override
  Widget build(BuildContext context) {
    print('ItemDetailcall hua');
    dynamic titleArgument = Get.arguments[0];
    String idArgument = Get.arguments[1];

    //print(c.getMeal(idArgument).length);

    return Scaffold(
      appBar: AppBar(
          title: Text(titleArgument),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent),
      body: ListView(
        children: c.getMeal(idArgument).map((e) {
          return InkWell(
            // borderRadius: BorderRadius.circular(30),
            onTap: () {
              //  print(e.id);
              Get.to(SingleItemDetail(), arguments: e.id.toString());
            },
            child: Card(
              elevation: 15,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(
                        e.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: Container(
                        // height: 50,
                        width: 150,
                        color: Colors.black.withOpacity(.5),
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Text(
                          e.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(Icons.details),
                          onPressed: () {
                            print('Osama');
                            Get.to(SingleItemDetail(), arguments: e.id);
                          }),
                      Icon(Icons.timer),
                      Container(
                        width: 10,
                      ),
                      Text(
                        e.duration.toString() + " min",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
                )
              ]),
            ),
          );
        }).toList(),
      ),
    );
  }
}
