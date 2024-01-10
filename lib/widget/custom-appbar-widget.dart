import 'package:flutter/material.dart';
import 'package:noteapp/widget/icon-search-button.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key, required this.title, required this.icon, this.onPressed});
final String title;
final Icon icon;
final void Function()?  onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        IconSearchButton(icon: icon,onPressed:onPressed ,)
      ],
    );
  }
}

