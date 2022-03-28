import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final void Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  const FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _isVegan = false;
  bool _isVegeterian = false;
  bool _isLactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _isLactoseFree = widget.currentFilters['lactose'] as bool;
    _isVegan = widget.currentFilters['vegan'] as bool;
    _isVegeterian = widget.currentFilters['vegeterian'] as bool;
    super.initState();
  }

  Widget _buildSwitchTile(
    bool value,
    String title,
    String description,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters!'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegeterian': _isVegeterian,
                };
                widget.saveFilters(selectedFilter);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                  _glutenFree,
                  'Gluten-Free',
                  'Only include gluten-gree meals.',
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchTile(_isLactoseFree, 'Lactose-Free',
                    'Only include lactose-gree meals.', (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                _buildSwitchTile(_isVegan, 'Vegan', 'Only include vegan meals.',
                    (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                _buildSwitchTile(
                  _isVegeterian,
                  'Vegeterian',
                  'Only include Vegeterian meals.',
                  (newValue) {
                    setState(() {
                      _isVegeterian = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
