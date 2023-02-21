import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class CounterView extends StatefulWidget {
  final int? initNumber;
  final Function(double) counterCallback;
  final void Function()? increaseCallback;
  final void Function()? decreaseCallback;
  final int? minNumber;
  final double? height;

  const CounterView({
    super.key,
    this.initNumber,
    required this.counterCallback,
    this.increaseCallback,
    this.decreaseCallback,
    this.minNumber,
    this.height,
  });

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late int _currentCount;
  late Function _counterCallback;
  late Function _increaseCallback;
  late Function _decreaseCallback;
  late int _minNumber;
  late double _height = 30;

  @override
  void initState() {
    _currentCount = widget.initNumber ?? 1;
    _counterCallback = widget.counterCallback;// ?? (int number) {};
    _increaseCallback = widget.increaseCallback ?? () {};
    _decreaseCallback = widget.decreaseCallback ?? () {};
    _minNumber = widget.minNumber ?? 0;
    if (widget.height != null) {
      _height = widget!.height!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        // color: const Color.fromRGBO(1, 1, 1, 0.1),
        color: const Color.fromRGBO(0, 0, 0, 0),
        border: Border.all(color: const Color.fromRGBO(1, 1, 1, 0.2))
      ),
      height: _height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionButton(Icons.remove, () => _decrement(), isDecrement: true),
          SizedBox(
            width: 40,
            child: Text(_currentCount.toString(), style: const TextStyle(fontSize: 12), textAlign: TextAlign.center,),
          ),
          _actionButton(Icons.add, () => _increment()),
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      _currentCount++;
      _increaseCallback();
    });
    _counterCallback(_currentCount.toDouble());
  }

  void _decrement() {
    setState(() {
      if (_currentCount > _minNumber) {
        _currentCount--;
        _decreaseCallback();
      }

      if (_currentCount <= 0) _currentCount = 0;
      _counterCallback(_currentCount.toDouble());
    });
  }

  Widget _actionButton(IconData icon, void Function()? onPressed, { bool? isDecrement = false }) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(minWidth: _height, minHeight: _height),
      onPressed: _currentCount <= 0 && isDecrement! ? null : onPressed,
      elevation: 0,
      // fillColor: const Color.fromRGBO(1, 1, 1, 0.5),
      fillColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius:BorderRadius.all(Radius.circular(5))
      ),

      child: Icon(
        icon,
        color: _currentCount <= 0 && isDecrement! ? const Color.fromRGBO(1, 1, 1, 0.5) : color.primary,
        size: 15.0,
      ),
    );
  }
}