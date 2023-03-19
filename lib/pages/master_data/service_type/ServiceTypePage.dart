import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/components/NoData.dart';
import 'package:mobile_apps/config/Api.dart';
import 'package:mobile_apps/models/product_category.dart';
import 'package:mobile_apps/helper/FilterRequest.dart';
import 'package:mobile_apps/models/service_type.dart';
import 'package:mobile_apps/pages/master_data/service_type/components/ContentView.dart';

import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:skeletons/skeletons.dart';

import 'package:mobile_apps/data/dummies.dart';

class ServiceTypePage extends StatefulWidget {
  const ServiceTypePage({Key? key}) : super(key: key);

  @override
  State<ServiceTypePage> createState() => _ServiceTypePageState();
}

class _ServiceTypePageState extends State<ServiceTypePage> {
  late List<service_type> data = <service_type>[];
  bool isLoading = true;
  late FilterRequest filterRequest = FilterRequest();
  late double filterPage = 180;
  late double pageHeight = 50;

  @override
  initState() {
    getAll();
    super.initState();
  }

  @override
  void dispose() {
    data = [];
    super.dispose();
  }

  Future<void> getAll() async {
    try {
      var response = await Api().dio.get('/service_type/getAll');
      setState(() => {
        data = (response.data as List<dynamic>).map((i) => service_type.fromJson(i)).toList(),
      });
      await setIsLoading(false);
    } on DioError catch (e)  {
      await setIsLoading(false);
      rethrow;
    }
  }

  Future<void> setIsLoading(bool value) async {
    setState(() { isLoading = value; });
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
