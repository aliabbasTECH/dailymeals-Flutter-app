import 'package:flutter/material.dart';

//________________________widget Imports_______>>>>>>>>>

import 'package:dailymeals/widget/meal_item.dart';

//________________________Model Imports_______>>>>>>>>>
import '../model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routName = '/category-meals';

  final List<Meal> avaliableMeals;
  CategoryMealsScreen(this.avaliableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final CategoryId = routArgs['id'];
      categoryTitle = routArgs["title"] as dynamic;
      displayedMeals = widget.avaliableMeals.where((meal) {
        return !meal.categories.contains(CategoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String CategoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
