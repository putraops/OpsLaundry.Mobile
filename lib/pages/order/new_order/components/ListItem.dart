import 'package:flutter/material.dart';
import 'package:mobile_apps/components/Form/CounterView.dart';

class ListItem extends StatefulWidget {
  const ListItem({ super.key });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  final bool isSatuan = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.black12,
                  child: Text(
                    "CS",
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal
                    ),
                  )
                ),
              ),
              const SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    child: Text(
                      "Cuci Setrika",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, letterSpacing: -.25),
                    ),
                  ),
                  Text("Satuan", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color.fromRGBO(1, 1, 1, 0.5), letterSpacing: -.25)),

                ],
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Rp ", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600)),
                    Text("25,000", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: -.25),),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  GestureDetector(
                    onTap: () { print("debug.."); },
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      color: Colors.white,
                      child:  ClipRRect(
                        child: Image.asset("assets/icons/trash.png", height: 20, width: 20,),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CounterView(
                        height: 30,
                        counterCallback: (value) { print("value: " + value.toString()); },
                        initNumber: 0,
                        minNumber: 0,
                      ),
                      const SizedBox(height: 2.5,),
                      Text(isSatuan ? "Total Barang" : "Total Berat (Kg)", style: const TextStyle(fontSize: 11.5, color: Color.fromRGBO(1, 1, 1, 0.5), letterSpacing: -.25),)
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
