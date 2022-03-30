import 'package:flutter/material.dart';

//________________________widget Imports_______>>>>>>>>>
import '../dummy_Data.dart';

//________________________widget Imports_______>>>>>>>>>

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailScreen(this.toggleFavorite,this.isMealFavorite);


  Widget buildtitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) =>
        meal.id == mealId); // firstWhere function shows only first data
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl),
          ),
          buildtitle(context, "Ingredients"),
          buildListViewContainer(ListView.builder(
            itemBuilder: (ctx, index) => Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(selectedMeal.ingredients[index])),
            ),
            itemCount: selectedMeal.ingredients.length,
          )),
          buildtitle(context, "Steps"),
          buildListViewContainer(ListView.builder(
            itemBuilder: (ctx, index) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text("# ${index + 1}"),
                  ),
                  title: Text(selectedMeal.steps[index],style: TextStyle(fontSize: 14),),
                ),
                Divider(),
                
              ],
            ),
            itemCount: selectedMeal.steps.length,
          )),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isMealFavorite(mealId) ? Icons.star: Icons.star_border
        ),
        onPressed: ()=>toggleFavorite(mealId)  
        )
      

    );
  }
}
