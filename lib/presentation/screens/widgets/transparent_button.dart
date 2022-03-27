import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function callback;
  const TransparentButton(
      {Key? key,
      required this.icon,
      required this.size,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => callback(),
      child: Icon(
        icon,
        size: size,
      ),
      splashColor: Colors.blue.withOpacity(1.0),
      shape: const CircleBorder(),
      elevation: 5,
      highlightElevation: 0,
      fillColor: Colors.blue.withOpacity(0.3),
    );
  }
}