import 'package:flutter/material.dart';
import 'package:mobile_apps/context/GlobalContext.dart';
import 'package:mobile_apps/navigation/AnimateNavigation.dart';

import 'package:mobile_apps/pages/master_data/product_category/ProductCategoryPage.dart';
import 'package:mobile_apps/pages/master_data/service_type/ServiceTypePage.dart';
import 'package:mobile_apps/pages/service/ServicePage.dart';

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
          Navigator.pop(NavigationService.navigatorKey.currentContext!);
        }
      ),
      Menu(
        title: "Kategori Barang",
        description: "Digunakan untuk pengelompokkan item.",
        icon: ClipRRect(
          child: Image.asset("assets/icons/four-squares-color.png", height: 45, width: 45,),
        ),
        onPress: () {
          Navigator.pop(NavigationService.navigatorKey.currentContext!);
          Navigator.of(NavigationService.navigatorKey.currentContext!).push(AnimateNavigation(const ProductCategoryPage()));
        }
      ),
    ]
  ),
  Menu(
    title: "Layanan",
    icon: null,
    children: [
      Menu(
          title: "Tipe",
          description: "Tipe Layanan yang tersedia dalam suatu Laundry.",
          icon: ClipRRect(
            child: Image.asset("assets/icons/question-mark.png", height: 40, width: 40,),
          ),
          onPress: () {
            Navigator.pop(NavigationService.navigatorKey.currentContext!);
            Navigator.of(NavigationService.navigatorKey.currentContext!).push(AnimateNavigation(const ServiceTypePage()));
          }
      ),
      Menu(
        title: "Layanan",
        description: "Jenis Layanan yang tersedia dalam suatu Laundry.",
        icon: ClipRRect(
          child: Image.asset("assets/icons/laundry-basket.png", height: 40, width: 40,),
        ),
        onPress: () {
          Navigator.pop(NavigationService.navigatorKey.currentContext!);
          Navigator.of(NavigationService.navigatorKey.currentContext!).push(AnimateNavigation(const ServicePage()));
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