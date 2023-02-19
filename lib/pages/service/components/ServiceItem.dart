import 'package:flutter/material.dart';

class ServiceItem extends StatefulWidget {
  final bool is_grid;
  final String name;
  final String description;
  final Image image;
  final Function onPress;

  const ServiceItem(
      this.is_grid,
      this.name,
      this.description,
      this.image,
      this.onPress,
      { super.key }
  );

  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  @override
  Widget build(BuildContext context) {
    void calculate() {
      debugPrint(widget.is_grid.toString());
      widget.onPress();
    }

    return Column(
      children: [
        Container(
          height: 135,
          margin: const EdgeInsets.only(bottom: 15),
          child: Stack(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      // color: Colors.redAccent[100]!.withOpacity(1),
                      color: Colors.black26,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(17.5),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text("AKTIF", style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: -0.25)),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(widget.name, style: const TextStyle(fontSize: 14, color: Colors.black87, letterSpacing: -0.25, fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(height: 3.5),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.description,
                                style: const TextStyle(fontSize: 13),
                                softWrap: true,
                                maxLines: 5,
                                overflow: TextOverflow.fade, //new
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 10,
                right: 15,
                width: 60,
                height: 60,
                child: widget.image,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
