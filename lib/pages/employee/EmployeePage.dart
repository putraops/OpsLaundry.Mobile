import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/pages/employee/EmployeeFormPage.dart';
import 'package:mobile_apps/pages/employee/components/ListItem.dart';
import 'package:mobile_apps/navigation/AnimateNavigation.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  List<application_user> Users = [
    application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas", fullname: "Putra Ompusunggu", initialName: "PO"),
    application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Coin Laundry", fullname: "Bagus Dewa Anggoro", initialName: "BA"),
    application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Naomi Angelina Ompusunggu", initialName: "NO"),
    application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", initialName: "NO"),
    application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas", fullname: "Putra Ompusunggu", initialName: "PO"),
    application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Coin Laundry", fullname: "Bagus Dewa Anggoro", initialName: "BA"),
    application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Naomi Angelina Ompusunggu", initialName: "NO"),
    application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", initialName: "NO"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(AnimateNavigation(const EmployeeFormPage()));
        },
        backgroundColor: color.primary,
        child: const Icon(Icons.add, size: 30,),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              color: color.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () { Navigator.pop(context); },
                    child: Container(
                      width: 65,
                      color: color.primary,
                      alignment: Alignment.center,
                      child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,),
                    ) ,
                  ),

                  const Text('Karyawan', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600,)),

                  GestureDetector(
                    onTap: () { Navigator.pop(context); },
                    child: Container(
                      width: 65,
                      color: color.primary,
                      alignment: Alignment.center,
                      child: const Icon(Icons.search_sharp, color: Colors.white, size: 22.5),
                    ) ,
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: color.backgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 3.5, bottom: 3, left: 12.5, right: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.filter_alt_rounded, color: Color(0xFF3D3D3D), size: 15),
                        SizedBox(width: 2.5),
                        Text("Filter", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: -0.15),)
                      ],
                    ),
                  ),
                  const SizedBox(width: 5,),
                  // This place for selected filted
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: Users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        extentRatio: 0.75,
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
                              debugPrint("Ubah");
                            },
                            backgroundColor: const Color.fromRGBO(255, 210, 8, 1),
                            foregroundColor: Colors.black,
                            icon: Icons.delete,
                            label: 'Hapus',
                          ),
                          SlidableAction(
                            onPressed: (BuildContext context){
                              debugPrint("Lainnya");
                            },
                            backgroundColor: color.primary,
                            foregroundColor: Colors.white,
                            icon: Icons.more_horiz,
                            label: 'Lainnya',
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ListItem(Users[index]),
                          const Divider(color: Colors.black12, height: 1),
                        ],
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      )
    );
  }
}
