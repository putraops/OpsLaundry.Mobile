import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class BoxIncome extends StatefulWidget {
  final String name;
  final double amount;
  final Color color;

  const BoxIncome(
      this.name,
      this.amount,
      this.color,
      { super.key }
  );

  @override
  State<BoxIncome> createState() => _BoxIncomeState();
}

class _BoxIncomeState extends State<BoxIncome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(17.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Image.asset("assets/icons/store.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const <Widget>[
                    Text(
                      "Hari Ini",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "17 Feb 2022",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 5,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Text(widget.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 3,
                    color: Colors.black87,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text("Rp ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 5,
                          color: Colors.black,
                        ),
                      ],
                    )
                ),
                Text("368.000",
                    style: TextStyle(
                      fontFamily: "Lato-Bold",
                      letterSpacing: 0.25,
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 5,
                          color: Colors.black,
                        ),
                      ],
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}