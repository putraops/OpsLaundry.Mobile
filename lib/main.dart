
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobile_apps/context/UserContext.dart';
import 'package:mobile_apps/pages/master_data/product_category/ProductCategoryDetailPage.dart';
import 'package:mobile_apps/pages/master_data/product_category/ProductCategoryPage.dart';
import 'package:mobile_apps/pages/outlet/OutletPage.dart';
import 'package:mobile_apps/redux/store.dart';
import 'package:redux/redux.dart';
import 'package:mobile_apps/pages/auth/LoginPage.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile_apps/redux/appState.dart';

import 'context/GlobalContext.dart';
import 'navigation/MainNavigation.dart';
void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(
  //     //Lets make the Status Bar Transparent
  //     statusBarColor: Colors.white,
  //
  //     //Lets make the status bar icon brightness to bright
  //     // statusBarIconBrightness: Brightness.dark,
  //     )
  // );

  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  var store = await AppStore().getStoreAsync();
  runApp(Main(store));
}

class Main extends StatefulWidget {
  final Store<AppState> store;
  const Main(this.store, {super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late bool isLogin = false;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print("storeLogin from main.dart: ${widget.store.state?.isLogin ?? false}");
    // print("isLogin: $widget.store.");

    // if (widget.store.state.authState?.isLogin ?? false) {
    //   var user = await UserContext().invokeUser();
    //   if (user != null) setState(() { isLogin = true; });
    // }
    //
    // await Future.delayed(const Duration(seconds: 1));
    // FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Color> customColor = {
      50: const Color.fromRGBO(210, 41, 41, .1),
      100: const Color.fromRGBO(210, 41, 41, .2),
      200: const Color.fromRGBO(210, 41, 41, .3),
      300: const Color.fromRGBO(210, 41, 41, .4),
      400: const Color.fromRGBO(210, 41, 41, .5),
      500: const Color.fromRGBO(210, 41, 41, .6),
      600: const Color.fromRGBO(210, 41, 41, .7),
      700: const Color.fromRGBO(210, 41, 41, .8),
      800: const Color.fromRGBO(210, 41, 41, .9),
      900: const Color.fromRGBO(210, 41, 41, 1),
    };

    MaterialColor materialColor = MaterialColor(0xFFFFFFFF, customColor);
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: color.primary));

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.dark, // For iOS (dark icons)
    ));

    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Ops Laundry',
        theme: ThemeData(
            primaryColor: Colors.blue,
            // brightness: Brightness.dark,
            primarySwatch: materialColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: "Poppins",
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.red,
              selectionColor: Color.fromRGBO(250, 0, 0, 0.4),
              selectionHandleColor: color.primary,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              backgroundColor: color.primary,
              textStyle: const TextStyle(color: Colors.red),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              //onPrimary: Colors.black87,
              //primary: Colors.grey[300],
              // minimumSize: Size(88, 36),
              // minimumSize: Size(double.infinity, 45),
            ))),
        // theme: ThemeData.light(), // Provide light theme
        // darkTheme: ThemeData.dark(), // Provide dark theme
        // home: HomePage(),
        // darkTheme: ThemeData.dark(),
        // themeMode: ThemeMode.dark,
        // darkTheme: ThemeData(brightness: Brightness.dark, scaffoldBackgroundColor: Colors.red),
        debugShowCheckedModeBanner: false,
        // home: const ,
        navigatorKey: NavigationService.navigatorKey,
        // builder: (context, child) => MyTheme(
        //   light: myLightTheme,
        //   dark: myDarkTheme,
        //   child: isLogin ? const BottomNavigationBarController() : const LoginPage(),
        // ),
        routes: {
          MainNavigation.route: (route) => MainNavigation(widget.store),
          ProductCategoryPage.route: (route) => const ProductCategoryPage(),
          OutletPage.route: (route) => const OutletPage(),
          ProductCategoryDetailPage.route: (route) => const ProductCategoryDetailPage(),
        },
        initialRoute: MainNavigation.route,
        //home: SplashScreen(widget.store),
         //home: widget.store.state?.isLogin ?? false ? const BottomNavigationBarController() : const LoginPage(),
      ),
    );
  }
}

// class MyThemeData {
//   late ThemeData themeData; // important!
//   final Color myCustomColor;
//   final CustomWidgetData customWidget;
//   MyThemeData({
//     required this.themeData,
//     required this.myCustomColor,
//     required this.customWidget,
//   });
// }
//
// class CustomWidgetData {
//   final Color backgroundColor;
//   final BoxShape shape;
//
//   CustomWidgetData({
//     required this.backgroundColor,
//     required this.shape,
//   });
// }
//
// class MyTheme extends StatelessWidget {
//   final MyThemeData light;
//   final MyThemeData dark;
//   final Widget child;
//   const MyTheme({
//     required this.light,
//     required this.dark,
//     required this.child,
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final brightness = MediaQuery.of(context).platformBrightness;
//     final data = brightness == Brightness.light ? light : dark;
//
//     return InheritedMyTheme(
//       data: data,
//       child: Theme(
//         data: data.themeData,
//         child: child,
//       ),
//     );
//   }
//
//   static MyThemeData of(BuildContext context) {
//     final theme = Theme.of(context);
//     return context.dependOnInheritedWidgetOfExactType<InheritedMyTheme>()!.data
//       ..themeData = theme;
//   }
// }
//
// class InheritedMyTheme extends InheritedWidget {
//   final MyThemeData data;
//   const InheritedMyTheme({
//     required this.data,
//     required Widget child,
//     Key? key,
//   }) : super(
//           key: key,
//           child: child,
//         );
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
//       oldWidget != this;
// }
//
// final myLightTheme = MyThemeData(
//   themeData: ThemeData.light(),
//   myCustomColor: Colors.lightBlue,
//   customWidget: CustomWidgetData(
//     backgroundColor: Colors.lightGreen,
//     shape: BoxShape.circle,
//   ),
// );
// final myDarkTheme = MyThemeData(
//   themeData: ThemeData.dark(),
//   myCustomColor: Colors.blue,
//   customWidget: CustomWidgetData(
//     backgroundColor: Colors.green,
//     shape: BoxShape.circle,
//   ),
// );
