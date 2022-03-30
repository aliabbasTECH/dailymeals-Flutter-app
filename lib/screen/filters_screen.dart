import 'package:flutter/material.dart';

//________________________widget Imports_______>>>>>>>>>
import '../widget/main_dawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = "/filters";
  final Function saveFilters;
   final Map<String,bool> currentFilters; 
   
   FilterScreen(this.saveFilters,this.currentFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  initState(){
   _glutenFree= widget.currentFilters['gluten'] as bool ;
   _lactoseFree= widget.currentFilters['lactose'] as bool ;
   _vegan= widget.currentFilters['vegan'] as bool ;
   _vegetarian= widget.currentFilters['vegetarian'] as bool ;
   super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    dynamic updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("your Filter"),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection. ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                       _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                )
              ],
            ))
          ],
        ));
  }
}













                
// SwitchListTile(
//                  title: Text("Gluten Free"),
//                   subtitle: Text("only include Gluten-free"),
//                  value: _glutenFree,
//                  onChanged: (val )=>setState(() => _glutenFree=val)
//                  ),
//                  SwitchListTile(
//                  title: Text("vegetarian"),
//                   subtitle: Text("only include vegetarian"),
//                  value: _vegetarian,
//                  onChanged: (val )=>setState(() => _vegetarian=val)
//                  ),
//                  SwitchListTile(
//                  title: Text("Vegan"),
//                   subtitle: Text("only include vegan"),
//                  value: _vegan,
//                  onChanged: (val )=>setState(() => _vegan=val)
//                  ),
//                  SwitchListTile(
//                  title: Text("lactose Free"),
//                   subtitle: Text("only include lactose-Free"),
//                  value: _lactoseFree,
//                  onChanged: (val )=>setState(() => _lactoseFree=val)
//                  )