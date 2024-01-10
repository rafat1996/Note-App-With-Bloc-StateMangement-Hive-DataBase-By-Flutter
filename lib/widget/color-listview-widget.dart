import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/cubit/add-note-cubit/add_note_cubit_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 33,
            ))
        : CircleAvatar(
            backgroundColor: color,
            radius: 33,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> listColor = const [
    Color(0xff51e2f5),
    Color(0xff9df9ef),
    Color(0xffedf756),
    Color(0xffffa8B6),
    Color(0xffa28089),
    Color(0xffff1d58),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listColor.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<AddNoteCubitCubit>(context).color=listColor[index];
                  setState(() {});
                },
                child: ColorItem(
                  isSelected: currentIndex == index,
                  color: listColor[index],
                ),
              ),
            );
          }),
    );
  }
}
