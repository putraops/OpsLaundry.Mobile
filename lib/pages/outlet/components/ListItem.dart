import 'package:flutter/material.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/models/tenant.dart';
import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ListItem extends StatefulWidget {
  final tenant data;
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
  tenant get data => widget.data;
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
    double sizedBox = MediaQuery.of(context).size.width - 30 - 50 - 10;

    return StoreConnector<AppState, PageState>(
      converter: PageState.fromState,
      builder: (_, PageState state) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data.isDefault ?? false == true) primaryTenant(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/icons/store.png", height: 50, width: 50,),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: sizedBox,
                        child: Text(
                          data.name ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, letterSpacing: -.25),
                        ),
                      ),
                      SizedBox(
                        width: sizedBox,
                        child: Text(
                            data.address ?? "",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14, color: Colors.black54)
                        ),
                      ),
                      SizedBox(
                        width: sizedBox,
                        child: Text(
                            data.phone ?? "",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w600, letterSpacing: -.5)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

  }

  Widget primaryTenant() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 25,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              color: color.selectedBackgroundColor,
              child: const Center(
                child: Text("Utama", style: TextStyle(fontSize: 12, color: color.primary, fontWeight: FontWeight.w600, letterSpacing: -.25),),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5,),
      ],
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