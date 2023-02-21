import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/components/BottomSheet.dart';

class NewItem extends StatefulWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 25,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color.primary,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.5)),
              ),
              elevation: 0
          ),
          child: const Text('Tambah', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: -.25)),
          onPressed: () {
            bottomSheet(context,
                "Daftar Barang",
                const Expanded(child: Center(child: Text("Daftar Barang"),)),
                size: 1,
                hasRadius: false
            );
          },
        ),
      ),
    );
  }
}
