import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    this.onTap,
    this.isLoading = false,
  }) : super(key: key);
  final Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 151, 182, 141),
              borderRadius: BorderRadius.circular(25)),
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Save')),
        ),
      ),
    );
  }
}
