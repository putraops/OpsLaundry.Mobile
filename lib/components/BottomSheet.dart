import 'package:flutter/material.dart';

const _backgroundColor = Colors.transparent;

void draggableBottomSheet(context, Widget widget) {
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: _backgroundColor,
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius:BorderRadius.vertical(top: Radius.circular(10))
    ),
    builder: (BuildContext context){
      return SizedBox.expand(
        child: DraggableScrollableSheet(
          minChildSize: .1,
          initialChildSize: .5,
          maxChildSize: 1 - (50 / size.height),
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              height: size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: [
                  // Container(
                  //   height: 3,
                  //   margin: const EdgeInsets.only(top: 10),
                  //   width: MediaQuery.of(context).size.width * 0.2,
                  //   decoration: const BoxDecoration(
                  //     color: Color.fromRGBO(0, 0, 0, 0.3),
                  //     borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //   ),
                  // ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("title", style: const TextStyle(fontSize: 16, color: Color.fromRGBO(1, 1, 1, 0.7), fontWeight: FontWeight.w700, letterSpacing: -.25)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close_outlined, color: Color.fromRGBO(1, 1, 1, 0.5)),
                        )
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(child: ListView.builder(
                    controller: scrollController,
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('Item $index'));
                    },
                  ))
                ],
              )
            );
            // return Container(
            //   color: Colors.blue[100],
            //   child: ListView.builder(
            //     controller: scrollController,
            //     itemCount: 25,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ListTile(title: Text('Item $index'));
            //     },
            //   ),
            // );
          },
        ),
      );
    }
  );
}

void bottomSheet(context, String title, Widget widget){
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
    //anchorPoint: Offset(-300, 0),
    builder: (BuildContext context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: (MediaQuery.of(context).size.height * 0.5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 3,
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, color: Color.fromRGBO(1, 1, 1, 0.7), fontWeight: FontWeight.w700, letterSpacing: -.25)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close_outlined, color: Color.fromRGBO(1, 1, 1, 0.5)),
                    )
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                  child: SingleChildScrollView(child: widget,),
              )
            ],
          )
        ),
      );
      return Container(
        height: (MediaQuery.of(context).size.height * 0.5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 3,
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Daftar Outlet", style: TextStyle(fontSize: 16, color: Color.fromRGBO(1, 1, 1, 0.7), fontWeight: FontWeight.w700, letterSpacing: -.25)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close_outlined, color: Color.fromRGBO(1, 1, 1, 0.5)),
                  )
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text('Modal BottomSheet',),
                      ElevatedButton(
                        child: const Text('Close BottomSheet', style: TextStyle(color: Colors.white)),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      );
    },
  );
}