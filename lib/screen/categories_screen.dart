

import 'package:flutter/material.dart';

//________________________widget Imports_______>>>>>>>>>
import '../dummy_Data.dart';
import '../widget/category_item.dart';
//________________________Widget Imports_______>>>>>>>>>

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
       GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map((CatData) => CategoryItem(CatData.id, CatData.title,CatData.color))
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      );
    
  }
} 
