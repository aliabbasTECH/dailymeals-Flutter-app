import 'package:dailymeals/model/meal.dart';
import 'package:flutter/material.dart';

//________________________Screens Imports_______>>>>>>>>>
import './categories_screen.dart';
import 'package:dailymeals/screen/favorit_screen.dart';
//________________________Screens Imports_______>>>>>>>>>

//________________________widget Imports_______>>>>>>>>>
import '../widget/main_dawer.dart';
//________________________widget Imports_______>>>>>>>>>
import '../model/meal.dart';

class TabScreen extends StatefulWidget {
  
  final List<Meal> favoriteMeals;
  TabScreen(this.favoriteMeals);
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
   late List<Map<String, dynamic>> _pages;
     
   @override
   void initState (){
      _pages = [
    {
      'page':  CategoriesScreen() ,
      "title": "Categories",
    },
    {
      'page': FavoritScreen(widget.favoriteMeals) ,
      'title': "Favorits Meals",
    }
  ];
  super.initState();
   } 


  


  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text( _pages[_selectPageIndex]['title'] ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectPageIndex]['page'] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        // ignore: deprecated_member_use
        selectedItemColor: Theme.of(context).accentColor,

        currentIndex: _selectPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}



























//  ___________________________________________________<< TOP TABBAR >>_______________________________________ 

// class TabScreen extends StatefulWidget {
//   const TabScreen({Key? key}) : super(key: key);

//   @override
//   State<TabScreen> createState() => _TabScreenState();
// }

// class _TabScreenState extends State<TabScreen> {
//   @override
//   Widget build(BuildContext context) { 
//     return DefaultTabController(            
//         length: 2, 
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("Meals"),
//             bottom: TabBar(tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: "Catogories",
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: "Favorites",
//               ),
//             ]),
//           ),
//           body: TabBarView(children: [
//             CategoriesScreen(),FavoritScreen(),
//           ]),
//         ));
//   }
// }