import 'package:flutter/material.dart';

Color kWhite=Colors.white;
Color kBlack=Colors.black;
Color kGrey=Colors.grey;
Color kBlue=Colors.blue;
Color kMainColor=const Color(0xFF0F3C4C);




Map<int, Color> color =
  const {
    50:Color.fromRGBO(15, 60, 76, .1),
    100:Color.fromRGBO(15, 60, 76, .2),
    200:Color.fromRGBO(15, 60, 76, .3),
    300:Color.fromRGBO(15, 60, 76, .4),
    400:Color.fromRGBO(15, 60, 76, .5),
    500:Color.fromRGBO(15, 60, 76, .6),
    600:Color.fromRGBO(15, 60, 76, .7),
    700:Color.fromRGBO(15, 60, 76, .8),
    800:Color.fromRGBO(15, 60, 76, .9),
    900:Color.fromRGBO(15, 60, 76, 1),
  };

MaterialColor colorCustom = MaterialColor(0xFF0F3C4C, color);



///opacity of hex color
/*
100% — FF
95% — F2
90% — E6
85% — D9
80% — CC
75% — BF
70% — B3
65% — A6
60% — 99
55% — 8C
50% — 80
45% — 73
40% — 66
35% — 59
30% — 4D
25% — 40
20% — 33
15% — 26
10% — 1A
5% — 0D
0% — 00
 */
