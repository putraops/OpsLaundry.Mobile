import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile_apps/redux/appState.dart';
import 'package:mobile_apps/shared/PageDivider.dart';
import 'package:mobile_apps/pages/profile/Avatar.dart';
import 'package:mobile_apps/pages/profile/components/Subtitle.dart';
import 'package:mobile_apps/pages/profile/components/Submenu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_apps/constants/color.dart' as color;

import '../auth/LoginPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double _padding = 15.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  String getPhone(String value) {
    if (value.isNotEmpty) {
      return value;
    }
    return "-";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, state) {
          return SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  pinned: true,
                  expandedHeight: 90.0,
                  centerTitle: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Transform(
                      transform: Matrix4.translationValues(-35, 5, 0),
                      child: const Text(
                        'Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.all(_padding),
                    padding: EdgeInsets.all(_padding -2.5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26, width: 0.75),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Avatar(20, state?.auth?.user?.initialName?.toUpperCase() ?? ""),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(state?.auth?.user?.fullname?.toUpperCase() ?? "", style: const TextStyle(fontSize: 15, letterSpacing: -0.4, fontWeight: FontWeight.bold,),),
                                  Text(getPhone(state.auth.user?.phone ?? ""), style: const TextStyle(fontSize: 12.5),),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Text("Ubah", style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w800),)
                      ],
                    ),
                  ),
                ),

                SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: <Widget> [
                            Subtitle("Akun"),
                            Submenu("Informasi", Icons.account_circle),
                          ],
                        ),
                      ),
                      PageDivider(10),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: <Widget> [
                            Subtitle("Keamanan"),
                            Submenu("Ubah Password", Icons.lock),
                          ],
                        ),
                      ),
                      PageDivider(10),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: <Widget> [
                            Subtitle("Tentang"),
                            Submenu("Tentang Kami", Icons.info),
                            Submenu("Syarat dan Ketentuan", Icons.list_alt),
                            Submenu("Kebijakan Privasi", Icons.verified_user),
                          ],
                        ),
                      ),
                      PageDivider(10),

                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Version 1.0.0"),
                            Text("#OpsLaundry", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.all(_padding),
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: const MaterialStatePropertyAll(color.primary),
                                  padding: const MaterialStatePropertyAll(EdgeInsets.all(5)),
                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)
                                  )),
                                  fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 50))
                              ),
                              onPressed: setLogout,
                              child: const Text('Keluar', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w900,)),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30,),
                    ])
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Future<void> setLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('storedUser');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage()),
            (Route route) => route == null);
  }
}

