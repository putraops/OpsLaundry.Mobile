import 'package:flutter/material.dart';
import 'package:mobile_apps/pages/profile/ProfilePage.dart';
import 'package:mobile_apps/pages/order/OrderPage.dart';
import 'package:mobile_apps/pages/dashboard/DashboardPage.dart';
import 'package:mobile_apps/pages/notification/NotificationPage.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/redux/Store.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/appState.dart';

class BottomNavigationBarController extends StatefulWidget {
  const BottomNavigationBarController({super.key});

  @override
  State<BottomNavigationBarController> createState() => _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState extends State<BottomNavigationBarController> {
  int _selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> pages = [
    const DashboardPage(
      key: PageStorageKey('DashboardPage'),
    ),
    const OrderPage(
      key: PageStorageKey('OrderPage'),
    ),
    const NotificationPage(
      key: PageStorageKey('NotificationPage'),
    ),
    const ProfilePage(
      key: PageStorageKey('profilePage'),
    ),
  ];

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    onTap: (int index) => setState(() => _selectedIndex = index),
    type: BottomNavigationBarType.fixed,
    currentIndex: _selectedIndex,
    selectedItemColor: color.primary,
    selectedLabelStyle: const TextStyle(height: 1.5),
    unselectedItemColor: Colors.black38,
    unselectedFontSize: 14,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Dashboard',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Pesanan',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications_none, size: 26),
        label: 'Notifikasi',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Profile',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: StoreConnector<AppState, LoginState>(
        converter: (Store<AppState> store) => store.state.auth,
        builder: (BuildContext context, LoginState init) {
          // print('IsLogin: ${store.state.isLogin}');
          // bool current = store.state!.isLogin!;
          // print('current: ${current}');
          // print('token: ${store.state!.token}');
          return FloatingActionButton( //Floating action button on Scaffold
            onPressed: () => {
              // print('token: ${store.state!.auth}')
              print('IsLogin: ${store.state.auth.isLogin}'),
              print('token: ${store.state.auth.token}'),
              print('token: ${store.state.auth.user!.fullname}')
              //StoreProvider.of<AppState>(context).dispatch(SetLogin(!store.state!.isLogin!))
            },
            backgroundColor: color.primary,
            child: const Icon(Icons.add, size: 30,),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: _bottomNavigationBar(_selectedIndex),
      ),
      extendBody: true,
      body: PageStorage(
        bucket: bucket,
        child: pages[_selectedIndex],
      ),
    );
  }
}