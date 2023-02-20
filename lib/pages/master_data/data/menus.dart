import 'package:flutter/material.dart';

List<Menu> menus = [
  Menu(
    title: "Barang",
    icon: null,
    children: [
      Menu(
        title: "Barang",
        description: "Daftar Layanan atau dagangan yang akan dijual.",
        icon: ClipRRect(
          child: Image.asset("assets/icons/clothes.png", height: 45, width: 45,),
        ),
        onPress: () {
          print("Barang");
        }
      ),
      Menu(
        title: "Kategori Barang",
        description: "Digunakan untuk pengelompokkan item.",
        icon: ClipRRect(
          child: Image.asset("assets/icons/four-squares-color.png", height: 45, width: 45,),
        ),
        onPress: () {
          print("Kategori Barang");
        }
      ),
    ]
  ),
  Menu(
    title: "Layanan",
    icon: null,
    children: [
      Menu(
        title: "Layanan",
        description: "Jenis Layanan yang tersedia dalam suatu Laundry.",
        icon: ClipRRect(
          child: Image.asset("assets/icons/laundry-basket.png", height: 40, width: 40,),
        ),
        onPress: () {
          print("Layanan");
        }
      ),
    ]
  ),
];

class Menu {
  String? title;
  String? description;
  Widget? icon;
  Function? onPress;
  List<Menu>? children;

  Menu({
    required this.title,
    this.description,
    this.icon,
    this.onPress,
    this.children,
  });
}