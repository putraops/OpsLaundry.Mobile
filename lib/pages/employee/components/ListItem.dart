import 'package:flutter/material.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class ListItem extends StatefulWidget {
  final application_user user;

  const ListItem(
      this.user,
      { super.key }
  );

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {

  Widget isAdmin() {
    return Column(
      children: [
        const SizedBox(height: 2.5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text("Administrator", style: TextStyle(fontSize: 11, color: Colors.blueAccent, fontWeight: FontWeight.w700)),
            SizedBox(width: 7.5,),
            Icon(Icons.circle_sharp, size: 4, color: Colors.black87,),
            SizedBox(width: 7.5,),
            Text("Administrator", style: TextStyle(fontSize: 11, color: Colors.blueAccent, fontWeight: FontWeight.w700))
          ],
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    application_user user = widget.user;
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                    radius: 100,
                    backgroundColor: color.primary,
                    child: Text(
                      user.initialName ?? "",
                      // textAlign: TextAlign.justify,
                      style: const TextStyle(
                          color: Colors.white,
                          // fontSize: widget.size - 2.5,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal
                      ),
                    )
                ),
              ),
              const SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // 30 outer margin; 30 inner padding; 50 size of AvatarCircle; 15 size of SizedBox
                    width: MediaQuery.of(context).size.width - 30 - 30 - 50 - 15 ,
                    child: Text(
                      user.fullname ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(user.tenantName ?? "", style: const TextStyle(fontSize: 13)),
                ],
              ),
            ],
          ),
          if (user.isSystemAdmin ?? false == true) isAdmin()
        ],
      ),
    );
  }
}
