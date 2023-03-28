import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/models/pagination/DataTableRequest.dart';
import 'package:mobile_apps/models/product_category.dart';
import 'package:mobile_apps/helper/FilterRequest.dart';
import 'package:mobile_apps/pages/master_data/product_category/ProductCategoryDetailPage.dart';
import 'package:mobile_apps/pages/master_data/product_category/components/ListViewBuilder.dart';
import 'package:mobile_apps/repository/BaseRepository.dart';
import 'package:mobile_apps/constants/color.dart' as color;

import '../product/components/FilterBar.dart';

class ProductCategoryPage extends StatefulWidget {
  static const route = "/product_category/index";
  const ProductCategoryPage({Key? key}) : super(key: key);

  @override
  State<ProductCategoryPage> createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage>  {
  bool hasMore = true;
  late bool isInit = true;
  late bool hasUpdate = false;
  late FilterRequest filterRequest;
  final repo = BaseRepository("product_category");

  late List<product_category> data = [];
  late DataTableRequest request = DataTableRequest(
    draw: 0,
    page: 1,
    length: 25,
    columns: [
      // Columns(
      //   data: "catalog_name",
      //   name: "catalog_name",
      //   searchable: true,
      //   orderable: true,
      //   searchRegex: true
      // ),
    ],
    orders: [
      Orders(column: "name", direction: "asc")
    ],
    //search: Search(searchRegex: true, searchValue: search ?? "")
  );

  @override
  initState() {
    super.initState();
    filterRequest = FilterRequest();
    data = [];
    Future.delayed(const Duration(milliseconds: 0), () async { await getPagination(false); },);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getPagination(bool isLoadMore) async {
    setState(() { request.draw = request.draw! + 1; });
    if (isLoadMore) {
      setState(() { request.page = request.page! + 1; });
    }
    if (request.draw! > 1) {
      setState(() { isInit = false; });
    }

    var dt = await repo.getPagination(request);
    if ((dt.data?.length ?? 0 ) > 0) {
      List<product_category> newData = dt.data!.map((item) => product_category.fromJson(item)).toList();
      setState(() {
        data = [...data, ...newData];
        hasUpdate = true;
      });
      if (data.length >= (dt.recordsTotal ?? 0)) {
        setState(() { hasMore = false; });
      }
    }
  }

  Future<void> onFilter(FilterRequest? filterRequest) async {
    // Future.delayed(const Duration(seconds: 1), () { setState(() { isLoading = false; }); },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context, title: "Kategori Barang", centerTitle: true, ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductCategoryDetailPage()),
          );
          if (result != null) {
            setState(() {
              data = [...data, ...[result["value"]]];
              hasUpdate = true;
            });
            // getPagination(true);
          }
        },
        backgroundColor: color.primary,
        tooltip: "Tambah Barang",
        child: const Icon(Icons.add, size: 30,),
      ),
      body: Column(
        children: [
          if (true) (
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: FilterBar(onFilter: onFilter,),
              )
          ),
          Expanded(
            child: ListViewBuilder(isInit: isInit, data: data, hasMore: hasMore, fetch: (value) => getPagination(value) ),
          )
        ],
      )
    );
  }
}