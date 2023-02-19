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
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("No Pesanan: JRH-502", style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
              const Text("16 Februari 2023", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black54)),
              // Text("Jireh Amplas", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color.primary)),
            ],
          ),
          const SizedBox(height: 15,),
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.black12,
                    child: Text(
                      user.initialName ?? "",
                      // textAlign: TextAlign.justify,
                      style: const TextStyle(
                          color: Colors.black54,
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
                  const Text("${5} items", style: TextStyle(fontSize: 13, color: Colors.black54)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(color: Colors.black12, height: 5),
          const SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Outlet : Jireh Amplas", style: TextStyle(fontSize: 12, color: Colors.black54)),
                  SizedBox(height: 10,),
                  Text("Total Harga", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
                  Text("123,000", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: -1, color: color.primary)),
                ],
              ),
              ElevatedButton(
                // onPressed: isDisabled ? null : _validateInputs,
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  minimumSize: const Size(15, 15),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(color: color.primary)
                  ),
                ),
                child: const Text("Lihat",
                  style: TextStyle(
                    // color: Color.fromRGBO(255, 255, 255, 1),
                    color: color.primary,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -.25,
                  )
                ),
              ),
            ],
          ),
          if (user.isSuperAdmin ?? false == true) isAdmin()
        ],
      ),
    );
  }
}
