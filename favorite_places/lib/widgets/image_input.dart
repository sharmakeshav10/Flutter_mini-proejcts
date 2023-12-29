import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  ImageInput({super.key});

  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Theme.of(context).colorScheme.primary)),
      height: 200,
      width: double.infinity,
      child: TextButton.icon(
        icon: Icon(Icons.camera),
        onPressed: () {},
        label: Text('Take a picture'),
      ),
    );
  }
}
