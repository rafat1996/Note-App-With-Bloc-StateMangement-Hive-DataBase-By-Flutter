import 'package:flutter/material.dart';

class IconSearchButton extends StatelessWidget {
  const IconSearchButton({
    super.key, required this.icon, this.onPressed,
  });
final Icon icon;
final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}