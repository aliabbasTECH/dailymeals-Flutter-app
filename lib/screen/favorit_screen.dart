import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widget/meal_item.dart';

class FavoritScreen extends StatelessWidget {
 final List<Meal> favoritMeals;

 FavoritScreen(this.favoritMeals);

  @override
  Widget build(BuildContext context) {
    return favoritMeals.isEmpty ? 
     Center(child:Text("you have no favorit yet"))
    :ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritMeals[index].id,
            title: favoritMeals[index].title,
            imageUrl: favoritMeals[index].imageUrl,
            duration: favoritMeals[index].duration,
            complexity: favoritMeals[index].complexity,
            affordability: favoritMeals[index].affordability,
            
          );
        },
        itemCount: favoritMeals.length,
      );
  }
}