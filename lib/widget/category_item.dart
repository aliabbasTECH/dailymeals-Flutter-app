import 'package:flutter/material.dart';


//________________________Screens Imports_______>>>>>>>>>
import '../screen/category_meal_screen.dart';
//________________________Screens Imports_______>>>>>>>>>




class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCatagory(BuildContext ctx) {
    // function that navigate to selected catagory !!
    Navigator.of(ctx)
        .pushNamed(CategoryMealsScreen.routName, arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(//we can used gestureDetector but insted we used inkWell because it shows riple effect
      onTap: () => selectCatagory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(
          15), 
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
