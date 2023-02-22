import 'package:flutter/material.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class ListItem extends StatefulWidget {
  final application_user user;

  const ListItem(this.user, { super.key });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {

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

  @override
  Widget build(BuildContext context) {
    // 30 outer margin; 30 inner padding; 50 size of AvatarCircle; 15 size of SizedBox
    double sizedBox = MediaQuery.of(context).size.width - 30 - 50 - 10;

    application_user user = widget.user;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (user.isDefault ?? false == true) primaryTenant(),
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
                      user.tenantName ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -.25),
                    ),
                  ),
                  const SizedBox(height: 2.5,),
                  SizedBox(
                    width: sizedBox,
                    child: const Text(
                        "Jalan Amplas No. 32, Medan. Jalan Amplas No. 32, Medan. Jalan Amplas No. 32, Medan. Jalan Amplas No. 32, Medan.Jalan Amplas No. 32, Medan.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13, color: Colors.black54)
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
