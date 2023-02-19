import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_apps/pages/auth/components/LoginForm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: null, // NeverScrollableScrollPhysics()
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior/,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 7),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.all(Radius.circular(2.5)),
                        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.3), width: .75),
                      ),
                      child: Row(
                        children: [
                          const Center(
                            child: Text('ID',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.75),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.25
                                )
                            ),
                          ),
                          const SizedBox(width: 7.5,),
                          ClipRRect(
                            child: Image.asset("assets/icons/flag/indonesia.png", width: 30,),
                            // child: widget.image,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text("Selamat Datang\nKembali !",
                    style: TextStyle(
                        wordSpacing: 5,
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -2.5,
                        height: 1.25
                    )
                ),
                const SizedBox(height: 60,),
                const LoginForm(),
                const Spacer(),
                Center(child: Column(
                  children: [
                    const Text("Powered by", style: TextStyle(fontSize: 12),),
                    const SizedBox(height: 7.5,),
                    ClipRRect(
                      child: Image.asset("assets/images/logo/transparent-red.png", width: 70,),
                      // child: widget.image,
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
