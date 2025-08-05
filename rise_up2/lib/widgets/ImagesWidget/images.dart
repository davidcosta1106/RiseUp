import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  final String imagePath;

  const Images({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
      padding: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imagePath,
          width: 360,
          height: 200,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
