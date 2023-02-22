import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';

class ProductCategoryPage extends StatefulWidget {
  const ProductCategoryPage({Key? key}) : super(key: key);

  @override
  State<ProductCategoryPage> createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Kategori Barang",),
      body: Center(
        child: Text("Kategori Barang"),
      ),
    );
  }
}
