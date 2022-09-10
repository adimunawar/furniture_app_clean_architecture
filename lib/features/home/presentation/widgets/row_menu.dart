import 'package:e_furniture/features/home/presentation/bloc/cubit/rowmenu_cubit.dart';
import 'package:e_furniture/features/home/presentation/widgets/item_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RowMenu extends StatelessWidget {
  const RowMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> rowMenus = [
      {"icon": "assets/icons/icon_chair.png", "title": "Popular"},
      {"icon": "assets/icons/icon_chair.png", "title": "Chair"},
      {"icon": "assets/icons/icon_table.png", "title": "Table"},
      {"icon": "assets/icons/icon_sofa1.png", "title": "Armchair"},
      {"icon": "assets/icons/icon_bed.png", "title": "Bed"},
      {"icon": "assets/icons/icon_lamp.png", "title": "Lamb"},
    ];
    return BlocBuilder<RowmenuCubit, RowmenuState>(
      builder: ((context, state) {
        int selectedIndex = state.selectedindex;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: rowMenus.map((e) {
              int index = rowMenus.indexOf(e);
              return ItemMenu(
                onTap: () {
                  context.read<RowmenuCubit>().onTapmenu(index);
                },
                selectedIndex: selectedIndex,
                imageAsset: e['icon'],
                title: e['title'],
                index: index,
                bgColor: index == selectedIndex
                    ? Colors.black
                    : const Color(0xffF5F5F5),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
