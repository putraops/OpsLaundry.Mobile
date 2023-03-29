import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:mobile_apps/context/GlobalContext.dart';

enum SkeletonType {
  // ignore: constant_identifier_names
  Line,
  // ignore: constant_identifier_names
  Item,
}

class SkeletonAppend extends StatelessWidget {
  final SkeletonType? type;
  final int total;
  final double? height;
  final double? width;

  const SkeletonAppend({
    this.type = SkeletonType.Line,
    required this.total,
    this.height,
    this.width,
    super.key
  });

  List<Widget> widgets(SkeletonType type) {
    List<Widget> result = [];
    for (int i = 0; i < total; i++) {
      if (type == SkeletonType.Line) {
        var context = NavigationService.navigatorKey.currentContext!;
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
        // return Column(children: result, );
      } else {
        result.addAll([
          SkeletonLine(
            style: SkeletonLineStyle(
                height: height ?? 30,
                width: width ?? 70,
                borderRadius: BorderRadius.circular(8)),
          ),
          const SizedBox(width: 5,),
        ]);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    switch(type ?? SkeletonType.Line) {
      case SkeletonType.Item:
        return Row(children: widgets(SkeletonType.Item),);
      default:
        return Column(children: widgets(SkeletonType.Line),);
    }
  }
}
