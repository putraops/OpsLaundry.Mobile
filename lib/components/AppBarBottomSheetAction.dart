import 'package:flutter/material.dart';
import 'package:mobile_apps/components/BottomSheet.dart';

class AppBarBottomSheetAction extends StatefulWidget {
  final String? title;
  final Widget action;
  final Widget body;
  final double? size;
  final double? sizeInPixel;
  final bool? inPixel;
  final bool? hasRadius;

  const AppBarBottomSheetAction({
    super.key,
    this.title,
    required this.action,
    required this.body,
    this.size = 0.5,
    this.sizeInPixel = 0,
    this.inPixel = false,
    this.hasRadius = true,
  });

  @override
  State<AppBarBottomSheetAction> createState() => _AppBarBottomSheetActionState();
}

class _AppBarBottomSheetActionState extends State<AppBarBottomSheetAction> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: widget.action,
        onTap: () {
          bottomSheet(context,
              widget.title ?? "",
              widget.body,
              size: widget.size,
              inPixel: widget.inPixel,
              sizeInPixel: widget.sizeInPixel,
              hasRadius: widget.hasRadius
          );
        },
      ),
    );
  }
}
