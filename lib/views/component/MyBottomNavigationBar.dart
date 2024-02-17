import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

BottomNavigationBarItem buildBottomNavigationBarItem(
  String iconPath,
  String label,
  Color color,
) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      iconPath,
      width: 24,
      height: 24,
      color: color,
    ),
    label:label,
  );
}
