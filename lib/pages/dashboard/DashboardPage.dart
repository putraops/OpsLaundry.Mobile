import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/pages/dashboard/Header.dart';
import 'package:mobile_apps/shared/BoxIncome.dart';
import 'package:mobile_apps/pages/dashboard/navigation/DashboardMenuController.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../models/application_user.dart';
import '../../redux/appState.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light
  ));
  runApp(const DashboardPage());
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StoreConnector<AppState, PageState>(
          converter: PageState.fromState,
          onInitialBuild: (state) =>  {
            //initialization(state),
          },
          builder: (BuildContext context, PageState state) {
            // var userLogin = application_user.fromJson(state?.user);

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 30),
                    child:  StoreConnector<AppState, PageState>(
                      converter: PageState.fromState,
                      builder: (_, PageState state) {
                        if (state.user == null) return Container();
                        return Header(state.user as application_user);
                      },
                    ),
                  ),
                  Card(
                    elevation: 10,
                    margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
                    color: color.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Column(
                            children: const <Widget>[
                              ListTile(
                                leading: null,
                                title: Text("AA",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 5,
                                          color: Colors.black,
                                        ),
                                      ],
                                    )
                                ),
                                subtitle: null,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const DashboardMenuController(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text("Pendapatan Outlet", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color.fromRGBO(52, 52, 52, 1)),),
                        Icon(Icons.arrow_right_alt_sharp, color: color.primary, size: 40),
                      ],
                    ),
                  ),
                  Container(
                    height: 160,
                    margin: const EdgeInsets.only(top: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        SizedBox(width: 15),
                        BoxIncome("Amplas", 50000, color.primary),
                        SizedBox(width: 10),
                        BoxIncome("Amplas 365", 135000, color.info),
                        SizedBox(width: 10),
                        BoxIncome("Amplas Coin", 135000,Colors.lightBlueAccent),
                        SizedBox(width: 10),
                        BoxIncome("Patumbak", 135000, Colors.greenAccent),
                        SizedBox(width: 10),
                        BoxIncome("Patumbak", 135000, Colors.orange),
                        SizedBox(width: 15),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            );
          }
      ),
    );
  }
}

class PageState {
  final dynamic user;

  PageState({
    required this.user,
  });

  static PageState fromState(Store<AppState> store) {
    return PageState(
      user: store.state.user,
    );
  }
}