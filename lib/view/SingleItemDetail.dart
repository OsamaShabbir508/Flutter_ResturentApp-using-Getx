import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:after_node_flutter/controllers/catcontroller.dart';

class SingleItemDetail extends StatelessWidget {
  final catController c = Get.put(catController());
  @override
  Widget build(BuildContext context) {
    String id = Get.arguments;
    // print(id);
    String title = c.getSingleMealDetaail(id).title;
    String imageUrl = c.getSingleMealDetaail(id).imageUrl;
    List<String> ingredients = c.getSingleMealDetaail(id).ingredients;
    List<String> steps = c.getSingleMealDetaail(id).steps;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: Text(
                'Ingredients',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: Colors.blueAccent)),
              // color: Colors.purpleAccent,
              margin: EdgeInsets.all(10),

              child: ListView.builder(
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        ingredients[index],
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Colors.purpleAccent,
                        thickness: 1,
                      )
                    ],
                  );
                },
              ),
            ),
            Container(
                width: 200,
                child: Column(
                  children: [
                    Text(
                      'Steps',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Colors.purpleAccent,
                      thickness: 1.5,
                    ),
                  ],
                )),
            Container(
              height: 180,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 3, color: Colors.blueAccent)),
              // color: Colors.purpleAccent,
              margin: EdgeInsets.all(10),

              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: Text(
                            index.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          steps[index],
                          style:
                              TextStyle(fontSize: 15, color: Colors.blueAccent),
                        ),
                      ),
                      Divider(
                        color: Colors.purpleAccent,
                        thickness: 1,
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
