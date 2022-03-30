import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//________________________Screens Imports_______>>>>>>>>>
import '../screen/filters_screen.dart';
//________________________Screens Imports_______>>>>>>>>>


class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(fontFamily: "RobotoCondensed"),
      ),
      onTap: ()=>tapHandler(),   // this is call-back function
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            // ignore: deprecated_member_use
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            "Meals", 
            Icons.restaurant,
            ()=>Navigator.of(context).pushReplacementNamed('/') ),    // this will navigate to the main ans PushReplacementNamed methad of nevation remove the vrivous widget from stack this is for lower the cache memory    
          buildListTile(
            "Filters",
             Icons.filter, 
            ()=>Navigator.of(context).pushReplacementNamed(FilterScreen.routName) ), // this will navigate to the main ans PushReplacementNamed methad of nevation remove the vrivous widget from stack this is for lower the cache memory 
        ],
      ),
    );
  }
}
