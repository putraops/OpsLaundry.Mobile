import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/models/pagination/DataTableRequest.dart';
import 'package:mobile_apps/helper/FilterRequest.dart';
import 'package:mobile_apps/models/tenant.dart';
import 'package:mobile_apps/pages/outlet/DetailPage.dart';
import 'package:mobile_apps/pages/outlet/components/ListViewBuilder.dart';
import 'package:mobile_apps/redux/appState.dart';
import 'package:mobile_apps/repository/BaseRepository.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:redux/redux.dart';

class OutletPage extends StatefulWidget {
  static const route = "/outlet/index";
  const OutletPage({Key? key}) : super(key: key);

  @override
  State<OutletPage> createState() => _OutletPagePageState();
}

class _OutletPagePageState extends State<OutletPage>  {
  bool hasMore = true;
  late bool isInit = true;
  late bool isLoading = false;
  late bool hasUpdate = false;
  late FilterRequest filterRequest;
  final repo = BaseRepository("tenant");

  late List<tenant> data = [];
  late DataTableRequest request = DataTableRequest(
    draw: 0,
    page: 1,
    length: 5000,
    columns: [
    ],
    orders: [
      Orders(column: "is_default", direction: "DESC"),
      Orders(column: "name", direction: "ASC")
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
    setState(() {
      isLoading = true;
      request.draw = request.draw! + 1;
    });
    if (isLoadMore) {
      setState(() { request.page = request.page! + 1; });
    }
    if (request.draw! > 1) {
      setState(() { isInit = false; });
    }

    var dt = await repo.getPagination(request);
    if ((dt.data?.length ?? 0 ) > 0) {
      List<tenant> newData = dt.data!.map((item) => tenant.fromJson(item)).toList();
      setState(() {
        data = [...data, ...newData];
        hasUpdate = true;
      });
      if (data.length >= (dt.recordsTotal ?? 0)) {
        setState(() { hasMore = false; });
      }
    }
    setState(() { isLoading = false; });
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
            appBar: customAppBar(context, title: "Daftar Outlet", centerTitle: true, ),
            floatingActionButton: ((state.user!.isSystemAdmin! || state.user!.isAdmin!)) ? FloatingActionButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailPage()),
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
            ) : null,
            body: Column(
              children: [
                Expanded(
                  child: ListViewBuilder(data: data),
                )
              ],
            )
        );
      }
    );
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