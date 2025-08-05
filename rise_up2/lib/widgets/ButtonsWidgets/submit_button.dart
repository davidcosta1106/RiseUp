import 'package:flutter/material.dart';

class ButtonSubmitWidget extends StatelessWidget {
  final VoidCallback onclicked;

  const ButtonSubmitWidget({
    Key? key,
    required this.text,
    required this.onclicked,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 35,
            vertical: 15,
          ),
        ),
        onPressed: onclicked,
        child: Text(text),
      );
}
