import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  // final double? subtractHeight;
  const NoData({
    super.key,
    // this.subtractHeight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Center(
          child: Text("Tidak ada data."),
        ),
      ),
    );
  }
}
