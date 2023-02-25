import 'package:flutter/material.dart';
import 'package:mobile_apps/components/GreySeparator.dart';
import 'package:mobile_apps/models/product_category.dart';
import 'package:mobile_apps/commons/StandardResult.dart';

import 'ListItem.dart';

class ContentView extends StatefulWidget {
  final List<product_category> items;
  final Future<product_category> Function() onInsert;
  final Future<void> Function(bool value) setIsLoading;

  const ContentView({
    super.key,
    required this.items,
    required this.onInsert,
    required this.setIsLoading,
  });

  @override
  ContentViewState createState() {
    return ContentViewState();
  }
}

class ContentViewState extends State<ContentView> with TickerProviderStateMixin {
  late final GlobalKey<AnimatedListState> _listKey; // backing data
  late final Tween<Offset>? _animatedTween;
  late ScrollController _controller;
  late List<product_category> _data;
  late int totalData;
  late bool isLoading;


  @override
  initState() {
    super.initState();
    _listKey = GlobalKey();
    setState(() {
      _data = widget.items;
      totalData = _data.length;
    });
    _animatedTween = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    );
    isLoading = false;
    _controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  // @mustCallSuper
  @override
  @protected
  void didUpdateWidget(covariant ContentView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _listKey = GlobalKey();
    setState(() {
      _data = widget.items;
      totalData = _data.length;
    });
  }

  Future<void> setIsLoading(bool value) async {
    setState(() { isLoading = value; });
  }

  Future<void> _scrollListener() async {
    // print(_controller.position.extentAfter);
    //print(isLoading);
    if (_controller.position.extentAfter < 5) {
      // print("asdasd");
      // await _insertSingleItem();
      // await setIsLoading(true);
    }
  }

  Future<void> _insertSingleItem() async {
    await setIsLoading(false);
    var item = product_category(id: "a", isActive: true, createdAt: DateTime.now(), organizationName: "Jireh Laundry", name: "AKU BARU", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
    int insertIndex = totalData;
    _data?.insert(insertIndex, item);
    //_listKey.currentState!.insertItem(insertIndex);

    _listKey.currentState?.insertItem(insertIndex,
        duration: const Duration(milliseconds: 500)
    );
  }

  Future<void> deleteById(String id, int index) async {
    StandardResult result = StandardResult(success: true, message: "OK", data: null);
    if (result.success!) {
      await widget.setIsLoading(true);
      await Future.delayed(const Duration(seconds: 1),
        () async => {
          await widget.setIsLoading(false),
          await removeItem(index),
        },
      );
    }
  }

  Future<void> removeItem(int index) async {
    //-- Remove from list.
    _data.removeAt(index);

    final removedItem = _data[index];
    _listKey!.currentState?.removeItem(
        index,
            (context, animation) => SlideTransition(
          position: animation.drive(_animatedTween!),
          child: ListItem(
            index: index,
            record: removedItem,
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: totalData,
      controller: _controller,
      itemBuilder: (context, index, animation) {
        return _buildItem(_data[index], index, animation);
      },
    );
  }

  SizeTransition _buildItem(product_category item, int index, Animation<double> animation) {
    return  SizeTransition(
      sizeFactor: animation,
      child: Column(
        children: [
          ListItem(
            index: index,
            record: item,
            onDelete: (recordId, index) async => { await deleteById(recordId, index) },
          ),
          const GreySeparator(),
        ],
      ),
    );
  }



  // void _onButtonPress() async {
  //   // replace this with method choice below
  //   await _insertSingleItem();
  // }

  //

  // void _removeAllItems() {
  //   final length = _data.length;
  //   for (int i = length - 1; i >= 0; i--) {
  //     product_category removedItem = _data.removeAt(i);
  //     builder(context, animation) {
  //       return _buildItem(removedItem, i, animation);
  //     }
  //     //_listKey.currentState!.removeItem(i, builder);
  //
  //     _listKey!.currentState!.removeItem(i,
  //       (context, animation) => SlideTransition(
  //         position: animation.drive(_animatedTween!),
  //         child: ListItem(
  //           index: i,
  //           record: removedItem,
  //         ),
  //       )
  //     );
  //   }
  // }
  //
  // // void _updateSingleItem() {
  // //   final newValue = 'I like sheep';
  // //   final index = 3;
  // //   setState(() {
  // //     _data[index] = newValue;
  // //   });
  // // }
}