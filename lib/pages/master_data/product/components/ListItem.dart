import 'package:flutter/material.dart';
import 'package:mobile_apps/components/GreySeparator.dart';
import 'package:mobile_apps/components/SkeletonAppend.dart';
import 'package:mobile_apps/models/product.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobile_apps/components/CustomAlertDialog.dart';
import 'package:mobile_apps/helper/ActiveStatus.dart';
import 'package:mobile_apps/navigation/AnimateNavigation.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/pages/master_data/product/ProductDetailPage.dart';

import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:skeletons/skeletons.dart';

class ListItem extends StatefulWidget {
  final product record;
  final int index;
  final Function(String, int)? onDelete;
  final bool? outletFilter;

  const ListItem({
    required this.record,
    required this.index,
    this.onDelete,
    this.outletFilter,
    super.key
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  late product record;
  late bool isExpanded = false;
  late bool isLoading = false;

  @override
  initState() {
    super.initState();
    record = widget.record!;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchServices() async {
    setState(() { isLoading = true; });
    await Future.delayed(const Duration(seconds: 1), () async { setState(() { isLoading = false; });},);
  }

  void deleteById(String id) async {
    await widget.onDelete!(id, widget.index!);
  }

  // Widget recordStatus(product record) {
  //   return Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           (
  //             widget.outletFilter == false ?
  //             Container(
  //               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
  //               color: color.secondaryBackgroundColor,
  //               child: Text(record.organizationName!,
  //                 style: const TextStyle(fontSize: 12,
  //                     color: color.defaultTextColor,
  //                     fontWeight: FontWeight.w600,
  //                     letterSpacing: -.25),
  //               ),
  //             ) : Container()
  //           ),
  //           Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
  //             color: record.isActive! ? color.successBackgroundColor : color.primaryBackgroundColor, //color.selectedBackgroundColor,
  //             child: Text(getStatusNameByStatus(record.isActive!),
  //               style: TextStyle(fontSize: 12,
  //                   color: record.isActive! ? color.success : color.primary,
  //                   fontWeight: FontWeight.w600,
  //                   letterSpacing: -.25),
  //             ),
  //           ),
  //         ],
  //       ),
  //
  //       const SizedBox(height: 7.5,),
  //     ],
  //   );
  // }

  Widget children() {
    if (isLoading) {
      return Column(
        children: const [
          SkeletonAppend(
            totalLines: 1,
          ),
          Text("Sedang memuat...", style: TextStyle(fontSize: 12, color: Color.fromRGBO(1, 1, 1, 0.75)),),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10,),
        detail(serviceName: "Cuci Setrika", price: 12000),
        const SizedBox(height: 10,),
        // const GreySeparator(height: 5,),
        // const SizedBox(height: 7.5,),
        detail(serviceName: "Cuci Kering", price: 15000),
      ],
    );
  }

  Widget detail({required String serviceName, required double price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Express 1 Hari", style: TextStyle(fontSize: 14, color: Color.fromRGBO(1, 1, 1, 0.8),),),
            Text(serviceName, style: const TextStyle(fontSize: 11.5, color: Color.fromRGBO(1, 1, 1, 0.8),)),
          ],
        ),
        // Text(price.toString()),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Rp ", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600)),
            Text(price.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: -.25),),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, state) {
        return Slidable(
          enabled: true,
          // key: ValueKey(widget.index),
          key: ValueKey(widget.record.id),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.6,
            children: [
              SlidableAction(
                onPressed: (BuildContext context){
                  debugPrint("Ubah");
                },
                backgroundColor: const Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.edit_outlined,
                label: 'Ubah',
              ),
              SlidableAction(
                onPressed: (BuildContext context){
                  confirmDialog(
                      callback: (value) => {
                        if (value) deleteById(record.id!),
                      },
                      confirmButtonText: "Hapus",
                      cancelButtonText: "Batal", hasCancelButton: true, reverse: true
                  );
                },
                backgroundColor: color.primary,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Hapus',
              ),
            ],
          ),
          child: ExpansionTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                record?.name ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14, color: Color.fromRGBO(1, 1, 1, 0.8), fontWeight: FontWeight.w600, letterSpacing: -.25),
              ),
            ),
            collapsedTextColor: Colors.red,
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
                        color: color.warningBackgroundColor, //color.selectedBackgroundColor,
                        child: Text(record.product_category_name!,
                          style: const TextStyle(fontSize: 12,
                              color: color.warningTextColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -.25
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Text("Total 5 items.",
                          style: TextStyle(fontSize: 12,
                              color: color.defaultTextColor,
                              letterSpacing: -.25
                          )
                      ),
                    ],
                  ),
                  if (record.product_category_description != null) (
                    Column(
                      children: [
                        const SizedBox(height: 5,),
                        Text(
                            record.product_category_description ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12, color: Color.fromRGBO(1, 1, 1, 0.8),)
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
                child: Column(
                  children: [
                    const Divider(height: 1),
                    const SizedBox(height: 10,),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // SizedBox(
                        //   height: 25,
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: Colors.white,
                        //       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        //       shape: const RoundedRectangleBorder(
                        //         side: BorderSide(color: color.primary, width: 1),
                        //         borderRadius: BorderRadius.all(Radius.circular(2.5)),
                        //       ),
                        //
                        //       elevation: 0,
                        //     ),
                        //     child: const Text('Tambah', style: TextStyle(color: color.primary, fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: -.25)),
                        //     onPressed: () {
                        //     },
                        //   ),
                        // ),
                        SizedBox(
                          height: 27.5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(1, 1, 1, 0.1),
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.transparent, width: 0),
                                borderRadius: BorderRadius.all(Radius.circular(2.5)),
                              ),
                              elevation: 0,
                            ),
                            onPressed: isLoading ? null : () async {
                              await fetchServices();
                            },
                            child: Text(isLoading ? "Sedang memuat..." : "Perbaharui",
                                style: TextStyle(
                                    color: isLoading ? const Color.fromRGBO(0, 0, 0, 0.5) : const Color.fromRGBO(210, 41, 41, 0.7),
                                    fontSize: 12, letterSpacing: -.15)),
                          ),
                        ),
                        const SizedBox(width: 7.5,),
                        SizedBox(
                          height: 27.5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: color.primary, width: 0.75),
                                borderRadius: BorderRadius.all(Radius.circular(2.5)),
                              ),

                              elevation: 0,
                            ),
                            child: const Text('Tambah', style: TextStyle(color: color.primary, fontSize: 12, letterSpacing: -.15)),
                            onPressed: () {
                              Navigator.of(context).push(AnimateNavigation(DetailFormPage(productRecord: widget.record!,)));
                            },
                          ),
                        ),
                        // SizedBox(
                        //   height: 25,
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: Colors.white,
                        //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        //       shape: const RoundedRectangleBorder(
                        //         side: BorderSide(color: color.primary, width: 1),
                        //         borderRadius: BorderRadius.all(Radius.circular(2.5)),
                        //       ),
                        //
                        //       elevation: 0,
                        //     ),
                        //     child: const Text('Tambah', style: TextStyle(color: color.primary, fontSize: 12, letterSpacing: -.15)),
                        //     onPressed: () {
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                    // const SizedBox(height: 10,),

                    const SizedBox(height: 10,),
                    children(),


                  ],
                ),
              ),
            ],
            onExpansionChanged: (bool expanding) => setState(() => isExpanded = expanding),
          ),
        );
      },
    );
  }
}
