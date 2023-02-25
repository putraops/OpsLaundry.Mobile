import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:mobile_apps/context/GlobalContext.dart';


class SkeletonAppend extends StatelessWidget {
  final int totalLines;

  const SkeletonAppend({
    required this.totalLines,
    super.key
  });

  Widget print() {
    var context = NavigationService.navigatorKey.currentContext!;

    List<Widget> result = [];
    for (int i = 0; i < totalLines; i++) {
      result.add(
        SkeletonListTile(
          hasSubtitle: true,
          hasLeading: true,
          leadingStyle: const SkeletonAvatarStyle(
            width: 50,
            height: 50,
          ),
          contentSpacing: 10,
          titleStyle: SkeletonLineStyle(
            height: 15,
            width: MediaQuery.of(context).size.width,
          ),
          subtitleStyle: SkeletonLineStyle(
            height: 25,
            width: MediaQuery.of(context).size.width,
          ),
        )
      );
    }
    return Column(children: result, );
  }

  @override
  Widget build(BuildContext context) {
    return print();
  }
}
