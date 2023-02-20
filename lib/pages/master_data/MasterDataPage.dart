import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/pages/master_data/data/menus.dart';
import 'package:mobile_apps/pages/service/components/ServiceView.dart';

class MasterDataPage extends StatefulWidget {
  const MasterDataPage({Key? key}) : super(key: key);

  @override
  State<MasterDataPage> createState() => _MasterDataPageState();
}

class _MasterDataPageState extends State<MasterDataPage> {

  List<Widget> masterDataMenu() {
    List<Widget> widgets = [];

    for (var menu in menus) {
      List<Widget> children = [];

      if (menu.children != null) {
        for (var child in menu.children!) {
          children.add(
            Column(
              children: [
                GestureDetector(
                  onTap: child.onPress == null ? null : () { child.onPress!();},
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 50,
                            child: child.icon!,
                          ),
                          const SizedBox(width: 7.5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(child.title ?? "", style: const TextStyle(fontSize: 15.5, letterSpacing: -.5),),
                                const SizedBox(height: 2.5,),
                                Text(
                                  child.description ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 13, color: color.defaultTextColor, letterSpacing: -.15),
                                ),
                                // Text(child.description ?? "", style: const TextStyle(fontSize: 12, color: color.defaultTextColor, letterSpacing: -.15),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
              ],
            )
          );
        }
      }
      widgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 5),
                Text(menu.title ?? "", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
              ],
            ),
            const SizedBox(height: 15,),
            Column(children: children,)
          ],
        )
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: masterDataMenu(),
      ),
    );
  }
}
