import 'package:get/get.dart';
import '../models/catagory.dart';
import '../models/meal.dart';

import '../models/3.2 dummy_data.dart.dart';

class catController extends GetxController {
  var navBar = 0.obs;

  getcategoryLenght() {
    return DUMMY_CATEGORIES.length;
  }

  List<Category> getCategory() {
    return DUMMY_CATEGORIES;
  }

  List<Meal> getMeal(String id) {
    final list = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
    print(list.map((e) => e.title).toList());
    return list;
  }

  Meal getSingleMealDetaail(String id) {
    print(id);
    Meal meal;

    DUMMY_MEALS.forEach((element) {
      if (element.id == id) {
        meal = element;
      }
    });
    return meal;
  }
}
