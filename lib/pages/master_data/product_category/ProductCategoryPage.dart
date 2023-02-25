import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/components/AppBarBottomSheetAction.dart';
import 'package:mobile_apps/components/NoData.dart';
import 'package:mobile_apps/models/product_category.dart';
import 'package:mobile_apps/helper/FilterRequest.dart';
import 'package:mobile_apps/pages/master_data/product_category/components/ContentView.dart';
import 'package:mobile_apps/pages/master_data/product_category/components/FilterBar.dart';

import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:skeletons/skeletons.dart';

import 'package:mobile_apps/data/dummies.dart';

class ProductCategoryPage extends StatefulWidget {
  const ProductCategoryPage({Key? key}) : super(key: key);

  @override
  State<ProductCategoryPage> createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> with TickerProviderStateMixin {
  GlobalKey<AnimatedListState>? _listKey;
  AnimationController? _controller;
  Tween<Offset>? _animatedTween;

  late List<product_category> data = [];
  bool isLoading = true;
  late FilterRequest filterRequest;
  late double filterPage;
  late double pageHeight;

  @override
  initState() {
    super.initState();
    filterRequest = FilterRequest();
    data = productCategoriDummies;
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
    setIsLoading(true);
    Future.delayed(const Duration(seconds: 1), () async { await setIsLoading(false); },);
    setState((){
      if (filterRequest.isActive == null) {
        data = productCategoriDummies.toList();
      } else {
        data = productCategoriDummies.where((i) => i.isActive == filterRequest.isActive).toList();
      }
    });
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
        title: "Kategori Barang",
        centerTitle: true,
        actions: [
          AppBarBottomSheetAction(
            title: "Pilihan",
            action: const Icon(Icons.more_horiz, size: 25),
            body: Padding(
              padding: const EdgeInsets.only(left: 12.5, right: 12.5, top: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        Container(
                          alignment: const Alignment(-1.5, 0.0),
                          width: 32.5,
                          height: 50,
                          child: const Icon(Icons.add, size: 25),
                        ),
                        const Text("Tambah Kategori Barang", style: TextStyle(fontSize: 14, letterSpacing: -.15),)
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        Container(
                          alignment: const Alignment(-0.99, 0.0),
                          width: 32.5,
                          height: 50,
                          child: ClipRRect(
                            child: Image.asset("assets/icons/alphabetical-sorting-ascending-black.png", height: 22.5, width: 22.5,),
                          ),
                        ),
                        const Text("Urutkan Nama Abjad Terkecil", style: TextStyle(fontSize: 14, letterSpacing: -.15),)
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        Container(
                          alignment: const Alignment(-0.99, 0.0),
                          width: 32.5,
                          height: 50,
                          child: ClipRRect(
                            child: Image.asset("assets/icons/alphabetical-sorting-descending-black.png", height: 22.5, width: 22.5),
                          ),
                        ),
                        const Text("Urutkan Nama Abjad Terbesar", style: TextStyle(fontSize: 14, letterSpacing: -.15),)
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                ],
              ),
            ),
            size: 0.5,
            hasRadius: false,
            inPixel: true,
            sizeInPixel: 180,
          ),
          const SizedBox(width: 15,),
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
