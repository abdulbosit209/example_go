

import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key, required this.onTap, required this.icon, required this.color,
  });

  final VoidCallback? onTap;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 35,
      child: Material(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: color),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onTap,
          child: Icon(icon, color: color),
        ),
      ),
    );
  }
}