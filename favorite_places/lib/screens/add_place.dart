import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final titleController = TextEditingController();

  void savePlace() {
    final enteredTitle = titleController.text;

    if (enteredTitle == null || enteredTitle.isEmpty) {
      return;
    }

    ref.read(placesProvider.notifier).addPlace(enteredTitle);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Place"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                label: Text(
                  'Title',
                ),
              ),
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            SizedBox(
              height: 10,
            ),
            ImageInput(),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: savePlace,
              child: Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
