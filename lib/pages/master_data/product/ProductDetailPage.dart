import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/models/product.dart';
import 'package:mobile_apps/models/product_details.dart';
import 'package:mobile_apps/pages/master_data/product/form/ProductDetailForm.dart';

import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:skeletons/skeletons.dart';

class DetailFormPage extends StatefulWidget {
  final product productRecord;
  final product_details? productDetailsRecord;

  const DetailFormPage({
    required this.productRecord,
    this.productDetailsRecord,
    // this.onDelete,
    // this.outletFilter,
    super.key
  });

  @override
  State<DetailFormPage> createState() => _DetailFormPageState();
}

class _DetailFormPageState extends State<DetailFormPage> {
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
                title: "Tambah Detail Barang",
                centerTitle: true,
            ),
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  // height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  color: const Color.fromRGBO(40, 167, 69, 0.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 80,
                            child: Text("Nama", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color.fromRGBO(0, 0, 0, 0.75), letterSpacing: -.25),),
                          ),
                          const SizedBox(
                            width: 5,
                            child: Text(":", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,)),
                          ),
                          (widget.productRecord == null ?
                            Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(2.5),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: const CircularProgressIndicator(
                                color: Color.fromRGBO(40, 167, 69, 0.8),
                                strokeWidth: 1.5,
                              ),
                            ) :
                            Expanded(
                              child: Text(
                                widget.productRecord?.name ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 13, color: Color.fromRGBO(0, 0, 0, 0.75), letterSpacing: -.25)
                              ),
                            )
                          ),
                        ],
                      ),
                      const SizedBox(height: 2,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 80,
                            child: Text("Description", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color.fromRGBO(0, 0, 0, 0.75), letterSpacing: -.25),),
                          ),
                          const SizedBox(
                            width: 5,
                            child: Text(":", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,)),
                          ),

                          (widget.productRecord!.product_category_description == null ?
                            Container(
                              width: 20,
                              height: 20,
                              padding: const EdgeInsets.all(2.5),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: const CircularProgressIndicator(
                                color: Color.fromRGBO(40, 167, 69, 0.8),
                                strokeWidth: 1.5,
                              ),
                            ) :
                            Expanded(
                              child: Text(
                                widget.productRecord.product_category_description!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 13, color: Color.fromRGBO(0, 0, 0, 0.75), letterSpacing: -.25)
                              ),
                            )
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Skeleton(
                    isLoading: isLoading,
                    skeleton: SkeletonListView(
                      itemCount: 4,
                      scrollable: false,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: ProductDetailForm(productDetailsRecord: widget.productDetailsRecord,),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
