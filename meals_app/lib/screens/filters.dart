import 'package:flutter/material.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filters, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFreeFilter = false;
  var isLactoseFreeFilter = false;
  var isVegetarianFilter = false;
  var isVeganFilter = false;

  @override
  void initState() {
    super.initState();
    isGlutenFreeFilter = widget.currentFilters[Filters.glutenFree]!;
    isLactoseFreeFilter = widget.currentFilters[Filters.lactoseFree]!;
    isVegetarianFilter = widget.currentFilters[Filters.vegetarian]!;
    isVeganFilter = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(
            {
              Filters.glutenFree: isGlutenFreeFilter,
              Filters.lactoseFree: isLactoseFreeFilter,
              Filters.vegetarian: isVegetarianFilter,
              Filters.vegan: isVeganFilter
            },
          );
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: isGlutenFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  isGlutenFreeFilter = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              value: isLactoseFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  isLactoseFreeFilter = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              value: isVegetarianFilter,
              onChanged: (isChecked) {
                setState(() {
                  isVegetarianFilter = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              value: isVeganFilter,
              onChanged: (isChecked) {
                setState(() {
                  isVeganFilter = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
