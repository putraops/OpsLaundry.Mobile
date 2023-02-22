import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

class SearchBar extends StatefulWidget {
  final double width;
  final Function(String?) counterCallback;

  const SearchBar({
    super.key,
    required this.width,
    required this.counterCallback,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final myController = TextEditingController();
  late String currentText;
  bool touched = false;

  void _printLatestValue() {
    setState(() { currentText = ""; });
  }

  @override
  void initState() {
    myController.addListener(_printLatestValue);
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _clearInput() {
    WidgetsBinding.instance.addPostFrameCallback((_) => myController.clear());
    setState(() { touched = false; });
    widget.counterCallback("");
  }

  void _onSubmit(value) {
    // print(value);
    // print(currentText);
    widget.counterCallback(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width:  widget.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromRGBO(1, 1, 1, 0.2)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            width: 27.5,
            alignment: const Alignment(0.5, 0.0),
            child: const Icon(Icons.search, size: 20, color: Color.fromRGBO(0, 0, 0, 0.5)),
          ),
          Expanded(
            child: TextFormField(
              // controller: TextEditingController(text: currentText!),
              controller: myController,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color.fromRGBO(0, 0, 0, 0.8)),
              decoration: const InputDecoration(
                hintText: "Cari Pesanan / Pelanggan",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 14.5,),
              ),
              onChanged: (value) {
                touched = isNotEmpty(value);
                setState(() {
                  currentText = value;
                  //widget.onChange;
                });
              },
              onFieldSubmitted: (value) => _onSubmit(value),
              textInputAction: TextInputAction.search,
            ),
          ),
          GestureDetector(
            onTap: () => _clearInput(),
            child: Container(
              width: 25,
              alignment: const Alignment(-0.5, 0.0),
              child: touched ? const Icon(Icons.highlight_off, size: 15, color: Color.fromRGBO(0, 0, 0, 0.5)) : null,
            ),
          )
        ],
      ),
    );
  }
}
