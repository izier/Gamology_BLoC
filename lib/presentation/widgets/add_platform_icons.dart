import 'package:flutter/material.dart';
import 'package:gamology_bloc/domain/entities/platform.dart';

Widget addPlatformIcons(List<Platform> platforms) {
  List platformList1 = [];
  for (int i = 0; i < platforms.length; i++) {
    String temp = platforms[i].name;
    if(temp == "PC") {
      platformList1.add(1);
    } else if (temp == "PlayStation 5" || temp == "PlayStation 4" || temp == "PlayStation 3") {
      platformList1.add(2);
    } else if (temp == "Xbox Series S/X" || temp == "Xbox Series One" || temp == "Xbox 360") {
      platformList1.add(3);
    } else if (temp == "Nintendo Switch") {
      platformList1.add(4);
    }
  }
  List platformList2 = platformList1.toSet().toList();
  platformList2.sort();
  return SizedBox(
    height: 20,
    width: (20 * platformList2.length).toDouble(),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        String platform = platformList2[index].toString();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Image.asset("icons/platform_$platform.png", width: 16),
        );
      }, itemCount: platformList2.length,
    ),
  );
}