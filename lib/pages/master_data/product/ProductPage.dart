import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/components/AppBarBottomSheetAction.dart';
import 'package:mobile_apps/components/NoData.dart';
import 'package:mobile_apps/models/product.dart';
import 'package:mobile_apps/helper/FilterRequest.dart';
import 'package:mobile_apps/pages/master_data/product/DetailPage.dart';
import 'package:mobile_apps/pages/master_data/product/components/ContentView.dart';
import 'package:mobile_apps/pages/master_data/product/components/FilterBar.dart';
import 'package:mobile_apps/navigation/AnimateNavigation.dart';

import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:skeletons/skeletons.dart';

import 'package:mobile_apps/data/dummies.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with TickerProviderStateMixin {
  late List<product> data = [];
  bool isLoading = true;
  late FilterRequest filterRequest;
  late double filterPage;
  late double pageHeight;

  @override
  initState() {
    super.initState();
    filterRequest = FilterRequest();
    data = productDummies;
    filterPage = 180;
    pageHeight = filterPage + 50;
    initialization();
  }

  @override
  void dispose() {
    //data = [];
    super.dispose();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1), () async { await setIsLoading(false); },);
  }

  Future<void> setIsLoading(bool value) async {
    setState(() { isLoading = value; });
  }

  Future<void> onFilter(FilterRequest filterRequest) async {
    List<product> temp = productDummies.toList();

    setIsLoading(true);
    Future.delayed(const Duration(seconds: 1), () async { await setIsLoading(false); },);
    setState((){
      if (filterRequest.organizationId != null){
        temp = temp.where((r) => r.organizationId == filterRequest.organizationId).toList();
      }
      if (filterRequest.isActive == null) {
        temp = temp.toList();
      } else {
        temp = temp.where((i) => i.isActive == filterRequest.isActive).toList();
      }
      data = temp;
    });
  }
  
  Future<product> onInsert() async{
    var item = product(id: "a", isActive: true, createdAt: DateTime.now(), organizationName: "Jireh Laundry", name: "Newest", product_category_name: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context,
        title: "Barang",
        centerTitle: true,
        actions: [
          IconButton(
            color: const Color.fromRGBO(1, 1, 1, 0.75),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.add, size: 30),
            tooltip: "Tambah Barang",
            onPressed: () {
              Navigator.of(context).push(AnimateNavigation(DetailPage(productRecord: product(id: ""),)));
            },
          ),
          const SizedBox(width: 5,),
        ]
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (true) (
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: FilterBar(onFilter: onFilter,),
                    ),
                  )
              ),
              Expanded(
                child: Skeleton(
                  isLoading: isLoading,
                  skeleton: SkeletonListView(
                    itemCount: 20,
                    scrollable: false,
                  ),
                  child: data.isEmpty ? const NoData():
                    ContentView(
                      items: data,
                      onInsert: () async { return onInsert(); },
                      setIsLoading: (value) async => { await setIsLoading(value) },
                    ),
                )
              )
            ],
          );
        }
      ),
    );
  }
}
