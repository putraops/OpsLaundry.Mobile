import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/components/SkeletonAppend.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/models/pagination/DataTableRequest.dart';
import 'package:mobile_apps/models/pagination/DataTablesResponse.dart';
import 'package:mobile_apps/models/product_category.dart';
import 'package:mobile_apps/helper/FilterRequest.dart';
import 'package:mobile_apps/pages/master_data/product_category/ProductCategoryDetailPage.dart';
import 'package:mobile_apps/pages/master_data/product_category/components/FilterBar.dart';
import 'package:mobile_apps/pages/master_data/product_category/components/ListViewBuilder.dart';
import 'package:mobile_apps/redux/appState.dart';
import 'package:mobile_apps/repository/BaseRepository.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:redux/redux.dart';
import 'package:skeletons/skeletons.dart';

class ProductCategoryPage extends StatefulWidget {
  static const route = "/product_category/index";
  const ProductCategoryPage({Key? key}) : super(key: key);

  @override
  State<ProductCategoryPage> createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
  bool hasMore = true;
  late bool isInit = true;
  late bool isLoading = false;
  late bool hasUpdate = false;
  late FilterRequest filterRequest;
  final repo = BaseRepository("product_category");

  late List<product_category> data = [];
  // late DataTablesResponse dt = DataTablesResponse()
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
    orders: [Orders(column: "name", direction: "asc")],
    //search: Search(searchRegex: true, searchValue: search ?? "")
  );

  @override
  initState() {
    super.initState();
    filterRequest = FilterRequest();
    data = [];
    Future.delayed(
      const Duration(milliseconds: 0),
      () async {
        await getPagination(false);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getPagination(bool isLoadMore) async {
    setState(() {
      isLoading = true;
      request.draw = request.draw! + 1;
    });
    if (isLoadMore) {
      setState(() {
        request.page = request.page! + 1;
      });
    }

    var dt = await repo.getPagination(request);
    print(jsonEncode(dt));
    if (dt.error != null) {}

    if (request.draw! > 0) {
      setState(() {
        isInit = false;
      });
    }

    if ((dt.data?.length ?? 0) > 0) {
      List<product_category> newData =
          dt.data!.map((item) => product_category.fromJson(item)).toList();
      setState(() {
        data = [...data, ...newData];
        // hasUpdate = true;
      });
      if (data.length >= (dt.recordsTotal ?? 0)) {
        setState(() {
          hasMore = false;
        });
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> onFilter(FilterRequest? filterRequest) async {
    // Future.delayed(const Duration(seconds: 1), () { setState(() { isLoading = false; }); },);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PageState>(
      converter: PageState.fromState,
      builder: (_, PageState state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: customAppBar(
            context,
            title: "Kategori Barang",
            centerTitle: true,
          ),
          floatingActionButton: ((state.user!.isSystemAdmin! || state.user!.isAdmin!)) ?
            FloatingActionButton(
              onPressed: () async {
                final result = await Navigator.push( context, MaterialPageRoute(builder: (context) =>  const ProductCategoryDetailPage()),);
                if (result != null) {
                  setState(() { data = [ ...data, ...[result["value"]] ];  hasUpdate = true; });
                }
              },
              backgroundColor: color.primary,
              tooltip: "Tambah Barang",
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            ) : null,
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.symmetric(
                    horizontal: request.draw! <= 1 && isLoading ? 7.5 : 0),
                child: request.draw! <= 1 && isLoading ?
                  const SkeletonAppend(
                    total: 3,
                    type: SkeletonType.Item,
                    height: 30,
                    width: 100,
                  ) : FilterBar(onFilter: onFilter,),
              ),
              Expanded(
                child: ListViewBuilder(
                  isInit: isInit,
                  data: data,
                  hasMore: hasMore,
                  fetch: (value) => getPagination(value)),
              )
            ],
          ));
      });
  }
}

class PageState {
  final application_user? user;

  PageState({
    this.user,
  });

  static PageState fromState(Store<AppState> store) {
    return PageState(
      user: store.state.user,
    );
  }
}
