import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/components/NoData.dart';
import 'package:mobile_apps/models/product_category.dart';
import 'package:mobile_apps/helper/FilterRequest.dart';
import 'package:mobile_apps/models/service_type.dart';
import 'package:mobile_apps/pages/master_data/service_type/components/ContentView.dart';

import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:skeletons/skeletons.dart';
import 'dart:convert';

import 'package:mobile_apps/data/dummies.dart';

class ServiceTypePage extends StatefulWidget {
  const ServiceTypePage({Key? key}) : super(key: key);

  @override
  State<ServiceTypePage> createState() => _ServiceTypePageState();
}

class _ServiceTypePageState extends State<ServiceTypePage> with TickerProviderStateMixin {
  late List<service_type> data = [];
  bool isLoading = true;
  late FilterRequest filterRequest;
  late double filterPage;
  late double pageHeight;

  @override
  initState() {
    super.initState();
    filterRequest = FilterRequest();
    data = serviceTypeDummies;
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

  Future<product_category> onInsert() async{
    var item = product_category(id: "a", isActive: true, createdAt: DateTime.now(), organizationName: "Jireh Laundry", name: "Newest", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context,
        title: "Tipe Layanan",
        centerTitle: true,
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
