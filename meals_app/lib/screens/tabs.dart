import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;
  // final List<Meal> favoriteMeals = [];
  Map<Filters, bool> selectedFilters = kInitialFilters;

  //check if the meal is in favorites or not in the mealDetails screen
  // void toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = favoriteMeals.contains(meal);

  //   if (isExisting) {
  //     setState(() {
  //       favoriteMeals.remove(meal);
  //       infoMessage('Meal removed from favorites');
  //     });
  //   } else {
  //     setState(() {
  //       favoriteMeals.add(meal);
  //       infoMessage('Meal added to favorites');
  //     });
  //   }
  // }

//to set the screen on the drawer
  void setScreen(String identifier) async {
    if (identifier == 'filters') {
      //navigate to filter screen
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: selectedFilters),
        ),
      );
      setState(() {
        selectedFilters = result ?? kInitialFilters;
      });
    } else {
      //since we are already on the tabs screen we'll close the drawer
      Navigator.of(context).pop();
    }
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
      if (selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      // onToggleFavorite: toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoritesProvider);
      activePage = MealsScreen(
          // onToggleFavorite: toggleMealFavoriteStatus,
          meals: favoriteMeals);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
        onTap: selectPage,
      ),
    );
  }
}
