import 'package:flutter/material.dart';
import 'package:mobile_apps/models/service_type.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobile_apps/components/CustomAlertDialog.dart';
import 'package:mobile_apps/constants/ActiveStatus.dart';
import 'package:mobile_apps/constants/color.dart' as color;

import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ListItem extends StatefulWidget {
  final service_type record;
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
  late service_type record;

  @override
  initState() {
    super.initState();
    record = widget.record!;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void deleteById(String id) async {
    await widget.onDelete!(id, widget.index!);
  }

  Widget recordStatus(service_type record) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            (
              widget.outletFilter == false ?
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
                color: color.secondaryBackgroundColor,
                child: Text(record.organizationName!,
                  style: const TextStyle(fontSize: 12,
                      color: color.defaultTextColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -.25),
                ),
              ) : Container()
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
              color: record.isActive! ? color.successBackgroundColor : color.primaryBackgroundColor, //color.selectedBackgroundColor,
              child: Text(getStatusNameByStatus(record.isActive!),
                style: TextStyle(fontSize: 12,
                    color: record.isActive! ? color.success : color.primary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -.25),
              ),
            ),
          ],
        ),

        const SizedBox(height: 7.5,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 30 outer margin; 30 inner padding; 50 size of AvatarCircle; 15 size of SizedBox
    double titleBoxSize = MediaQuery.of(context).size.width - 30;
    double descriptionBoxSize = MediaQuery.of(context).size.width - 30;

    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, state) {
        return Slidable(
            enabled: false,
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
                    // confirmDialog(
                    //   callback: (value) => {
                    //     if (value) deleteById(record.id!),
                    //   },
                    //   confirmButtonText: "Hapus",
                    //   cancelButtonText: "Batal", hasCancelButton: true, reverse: true
                    // );
                  },
                  backgroundColor: color.primary,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Hapus',
                ),
              ],
            ),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // if (state.auth.user!.isSuperAdmin! || state.auth.user!.isAdmin!) recordStatus(record),

                  Text(
                    record.name ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -.25),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                      record.description ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13, color: Color.fromRGBO(1, 1, 1, 0.8),)
                  )
                ],
              ),
            )
        );
      },
    );
  }
}
