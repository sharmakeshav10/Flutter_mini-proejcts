import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var isGlutenFreeFilter = false;
  var isLactoseFreeFilter = false;
  var isVegetarianFilter = false;
  var isVeganFilter = false;

  @override
  void initState() {
    super.initState();

    ///get the active filters from the filters provider
    final activeFilters = ref.read(filtersProvider);
    isGlutenFreeFilter = activeFilters[Filters.glutenFree]!;
    isLactoseFreeFilter = activeFilters[Filters.lactoseFree]!;
    isVegetarianFilter = activeFilters[Filters.vegetarian]!;
    isVeganFilter = activeFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filters.glutenFree: isGlutenFreeFilter,
            Filters.lactoseFree: isLactoseFreeFilter,
            Filters.vegetarian: isVegetarianFilter,
            Filters.vegan: isVeganFilter
          });

          return true;
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
