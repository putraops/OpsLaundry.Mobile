import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/models/product_category.dart';
import 'package:mobile_apps/pages/master_data/product_category/form/DetailForm.dart';
import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:skeletons/skeletons.dart';

class ProductDetailPage extends StatefulWidget {
  final product_category? record;

  const ProductDetailPage({
    this.record,
    super.key
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    if (widget.record != null) {
      initialization();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initialization() async {
    await setIsLoading(true);
    await Future.delayed(const Duration(seconds: 1), () async { await setIsLoading(false); },);
  }

  Future<void> setIsLoading(bool value) async {
    setState(() { isLoading = value; });
  }

  Future<product_category> onInsert() async{
    var item = product_category(id: "a", isActive: true, createdAt: DateTime.now(), organizationName: "Jireh Laundry", name: "Newest", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context,
        title: "${widget.record == null ? "Tambah" : "Ubah"} Kategori",
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
              child: DetailForm(record: widget.record),
            ),
          );
        }
      ),
    );
  }
}
