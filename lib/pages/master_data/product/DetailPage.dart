import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/models/product.dart';
import 'package:mobile_apps/models/product_details.dart';
import 'package:mobile_apps/pages/master_data/product/form/DetailForm.dart';

import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:skeletons/skeletons.dart';

class DetailPage extends StatefulWidget {
  final product? productRecord;

  const DetailPage({
    this.productRecord,
    super.key
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late bool isLoading = false;
  final obj = product_details(id: "", itemName: '', itemPrice: 0);

  @override
  initState() {
    super.initState();
    // record = widget.record!;
    fetchServices();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchServices() async {
    setState(() { isLoading = true; });
    await Future.delayed(const Duration(milliseconds: 1250), () async { setState(() { isLoading = false; });},);
  }

  FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, state) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            appBar: customAppBar(context,
                title: "${widget?.productRecord?.id == null ? "Tambah" : "Ubah"} Barang",
                centerTitle: true,
            ),
            body: Skeleton(
              isLoading: isLoading,
              skeleton: SkeletonListView(
                itemCount: 4,
                scrollable: false,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: DetailForm(record: widget?.productRecord,)
              ),
            ),
          ),
        );
      },
    );
  }
}
