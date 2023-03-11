import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;

const _backgroundColor = Colors.transparent;
const double _nav = 13;
const double _header = 55;
const double _separator = 1;

double calculateHeightInPixel(double screenHeight, double contentHeight) {
  return ((contentHeight / screenHeight) * screenHeight) + _nav + _header + _separator;
}

void draggableBottomSheet(context, Widget widget) {
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: _backgroundColor,
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius:BorderRadius.vertical(top: Radius.circular(10))
    ),
    builder: (BuildContext context){
      return SizedBox.expand(
        child: DraggableScrollableSheet(
          minChildSize: .1,
          initialChildSize: .5,
          maxChildSize: 1 - (50 / size.height),
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              height: size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("title", style: const TextStyle(fontSize: 16, color: Color.fromRGBO(1, 1, 1, 0.7), fontWeight: FontWeight.w700, letterSpacing: -.25)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close_outlined, color: Color.fromRGBO(1, 1, 1, 0.5)),
                        )
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(child: ListView.builder(
                    controller: scrollController,
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('Item $index'));
                    },
                  ))
                ],
              )
            );
          },
        ),
      );
    }
  );
}

void bottomSheet(context, String title, Widget widget,
  {
    TextStyle? titleStyle,
    double? size,
    double? dismissSize,
    // double? initialChildSize = 0.5,
    bool? inPixel = false,
    double? sizeInPixel = 0,
    bool? isFullSize = false,
    bool? hasRadius = true,
    bool? hasAction,
    double? actionHeight,
  })
{
  var _titleStyle = titleStyle ?? const TextStyle(fontSize: 17, color: Color.fromRGBO(1, 1, 1, 0.8), fontWeight: FontWeight.w600, letterSpacing: -0.5);

  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
    //anchorPoint: Offset(-300, 0),
    anchorPoint: Offset.infinite,
    builder: (BuildContext context) {
      return GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        child: DraggableScrollableSheet(
          expand: false,
          initialChildSize: isFullSize ?? false ? 0.94 : (size ?? 0.5), // half screen on load
          maxChildSize: 0.94,       // full screen on scroll
          minChildSize: dismissSize ?? 0.3,
          builder: (BuildContext context, ScrollController scrollController) {
            return Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: 3,
                        margin: const EdgeInsets.only(top: _nav - 3),
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      Container(
                        height: _header,
                        // color: Colors.yellow,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: AlignmentDirectional.centerStart,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(title, style: _titleStyle),
                            GestureDetector(
                              onTap: () { Navigator.pop(context); },
                              child: const Icon(Icons.close_outlined, color: Color.fromRGBO(1, 1, 1, 0.5)),
                            )
                          ],
                        ),
                      ),
                      //Expanded(
                      //   child: Container(
                      //     margin: EdgeInsets.only(bottom: hasAction ?? false ? (actionHeight ?? 55) : 0),
                      //     child: Align(
                      //       alignment: AlignmentDirectional.topStart,
                      //       child: SingleChildScrollView(child: widget,),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom: hasAction ?? false ? (actionHeight ?? 55) : 0),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: ListView(
                              controller: scrollController,
                              physics: const BouncingScrollPhysics(),
                              children: [ widget ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (hasAction ?? false) bottomSheetAction(context, actionHeight ?? 55)
              ],
            );
          },
        ),
      );
    },
  );
}

Widget bottomSheetAction(BuildContext context, double actionHeight) {
  return Positioned(
    bottom: 0,
    left: 0,
    width: MediaQuery.of(context).size.width,
    height: actionHeight,
    child: Container(
      height: actionHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: color.defaultBorderColor,
            blurRadius: 4,
            offset: Offset(-1, 0), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color.primary,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              elevation: 0
          ),
          child: const Text('Tampilkan', style: TextStyle(color: Colors.white, fontSize: 14,)),
          onPressed: () {
          },
        ),
      ),
    ),
  );
}