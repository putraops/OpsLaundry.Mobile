import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  // final double? subtractHeight;
  const NoData({
    super.key,
    // this.subtractHeight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              child: Image.asset("assets/icons/no-data.png", height: 130, width: 130, fit: BoxFit.fitWidth,),
            ),
            const SizedBox(height: 20,),
            const Text("Tidak ada data ditemukan.", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: -.5),)
          ],
        ),
      ),
    );
  }
}
