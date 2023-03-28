import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_apps/pages/auth/LoginPage.dart';
import 'package:mobile_apps/pages/order/new_order/NewOrderPage.dart';
import 'package:mobile_apps/pages/profile/ProfilePage.dart';
import 'package:mobile_apps/pages/order/OrderPage.dart';
import 'package:mobile_apps/pages/dashboard/DashboardPage.dart';
import 'package:mobile_apps/pages/notification/NotificationPage.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/redux/store.dart';
import 'package:mobile_apps/navigation/AnimateNavigation.dart';

import 'package:mobile_apps/utils/Navigate.dart';
import 'package:mobile_apps/context/GlobalContext.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../context/UserContext.dart';
import '../redux/appState.dart';

void mainNavigation() async {
  WidgetsFlutterBinding.ensureInitialized();
  var store = await AppStore().getStoreAsync();
  runApp(MainNavigation(store));
}

class MainNavigation extends StatefulWidget {
  static const route = '/index';
  final Store<AppState> store;

  const MainNavigation(this.store, {super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
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

  void initialization(MainState state) async {
    var user = await UserContext().invokeUser();
    if (!state!.isLogin || user == null) {
      clearStackAndPushRoute(NavigationService.navigatorKey.currentContext!, const LoginPage());
    }
  }

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
        icon: Icon(Icons.list_alt),
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
      floatingActionButton: StoreConnector<AppState, MainState>(
        converter: MainState.fromState,
        onInitialBuild: (state) {
          initialization(state);
        },
        builder: (BuildContext context, MainState init) {
          return FloatingActionButton( //Floating action button on Scaffold
            onPressed: () => {
              Navigator.of(context).push(AnimateNavigation(const NewOrderPage()))
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

class MainState {
  final bool isLogin;
  final dynamic user;

  MainState({
    required this.isLogin,
    this.user,
  });

  static MainState fromState(Store<AppState> store) {
    return MainState(
      isLogin: store.state.isLogin ?? false,
      user: store.state.user
    );
  }
}