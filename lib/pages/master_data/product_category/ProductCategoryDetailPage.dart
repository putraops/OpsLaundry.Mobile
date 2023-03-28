import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/pages/master_data/product_category/form/DetailForm.dart';
import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:skeletons/skeletons.dart';

class ProductCategoryDetailPage extends StatefulWidget {
  static const route = "/product_category/detail";
  final String? recordId;

  const ProductCategoryDetailPage({
    this.recordId,
    super.key
  });

  @override
  State<ProductCategoryDetailPage> createState() => _ProductCategoryDetailPageState();
}

class _ProductCategoryDetailPageState extends State<ProductCategoryDetailPage> {
  bool isLoading = false;

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context,
        title: "${widget.recordId == null ? "Tambah" : "Ubah"} Kategori",
        centerTitle: true,
        actions: [
          const SizedBox(width: 15,),
        ]
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, state) {
          return Skeleton(
            isLoading: isLoading,
            skeleton: SkeletonListView(
              itemCount: 20,
              scrollable: false,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: DetailForm(recordId: widget.recordId),
            ),
          );
        }
      ),
    );
  }
}
