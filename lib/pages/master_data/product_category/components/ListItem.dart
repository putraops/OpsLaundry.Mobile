import 'package:flutter/material.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/models/product_category.dart';
import 'package:mobile_apps/constants/ActiveStatus.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ListItem extends StatefulWidget {
  final product_category data;
  final int index;

  const ListItem({
    required this.data,
    required this.index,
    super.key
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  product_category get data => widget.data;
  int get index => widget.index;

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PageState>(
      converter: PageState.fromState,
      builder: (_, PageState state) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 90 - 30,
                    child: Text(
                      data.name ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -.25),
                    ),
                  ),
                  if (state.user!.isSystemAdmin! || state.user!.isAdmin!) (
                    Container(
                      width: 75,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      color: data.isActive! ? color.successBackgroundColor : color.primaryBackgroundColor,
                      child: Center(
                        child: Text(getStatusNameByStatus(data.isActive!),
                          style: TextStyle(fontSize: 11,
                              color: data.isActive! ? color.success : color.primary,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -.25),
                        ),
                      ),
                    )
                  )
                ],
              ),

              if (data.description != null && data.description != "") (
              // if (true) (
                Column(
                  children: [
                    const SizedBox(height: 7.5,),
                    Text(
                      data.description ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, color: Color.fromRGBO(1, 1, 1, 0.8),)
                    )
                  ],
                )
              )
            ],
          ),
        );
      },
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