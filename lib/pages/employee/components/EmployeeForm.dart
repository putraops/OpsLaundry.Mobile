import 'package:flutter/material.dart';
import 'package:mobile_apps/components/Form/TextBox.dart';
import 'package:mobile_apps/components/Form/TitleText.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:mobile_apps/components/BottomSheet.dart';

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({Key? key}) : super(key: key);

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();

}

class _EmployeeFormState extends State<EmployeeForm> {

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5,),
          const Text("Tambah", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: -.5)),

          const SizedBox(height: 20,),
          const Text("Data Pribadi", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -.5)),
          const SizedBox(height: 10,),

          Row(
            children: const [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: TextBox(title: "Nama Depan", hint: "Nama Depan", textInputAction: TextInputAction.next,),
              ),
              SizedBox(width: 15,),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: TextBox(title: "Nama Belakang", hint: "Nama Belakang", textInputAction: TextInputAction.next,),
              ),
            ],
          ),

          const SizedBox(height: 15,),
          const TextBox(title: "Email", hint: "Nama Depan", textInputAction: TextInputAction.next,),

          const SizedBox(height: 15,),
          const TextBox(title: "Alamat", hint: "Alamat", textInputAction: TextInputAction.next,),

          const SizedBox(height: 20,),
          const Text("Penempatan", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -.5)),
          const SizedBox(height: 10,),

          const TitleText(title: "Organization",),
          TextButton(
            onPressed: () {
              draggableBottomSheet(context, Text("data"));
            },
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
              alignment: Alignment.topLeft,
            ),
            child: const Text("Ops Laundry", style: TextStyle(fontSize: 14, color: color.primary, fontWeight: FontWeight.w600, letterSpacing: -.5)),
          ),

          const TitleText(title: "Outlet",),
          TextButton(
            onPressed: () {
              bottomSheet(
                  context,
                  "Daftar Outlet",
                  Align(
                    alignment: Alignment.centerLeft,
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
                        ],
                      ),
                    ),
                  )
              );
            },
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
              alignment: Alignment.topLeft,
            ),
            child: const Text("Pilih", style: TextStyle(fontSize: 14, color: color.primary, fontWeight: FontWeight.w600, letterSpacing: -.5)),
          ),


          const SizedBox(height: 10,),
          const Text("Keamanan", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -.5)),
          const SizedBox(height: 10,),


          const TextBox(title: "Username", hint: "Masukkan Username", textInputAction: TextInputAction.next,),
          const SizedBox(height: 15,),
          const TextBox(title: "Password", hint: "Masukkan Password", textInputAction: TextInputAction.next,),
          const SizedBox(height: 15,),
          const TextBox(title: "Ulangi Password", hint: "Ulangi Password", textInputAction: TextInputAction.next,),

          const SizedBox(height: 20,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 45)
            ),
            onPressed: () { },
            child: const Text('Simpan',
              style: TextStyle(
                  color:  Color.fromRGBO(255, 255, 255, 1),
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: -.25
              )
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
