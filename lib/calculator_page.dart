import 'package:calculator_app/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcultorPage extends StatefulWidget {
  @override
  _CalcultorPageState createState() => _CalcultorPageState();
}

class _CalcultorPageState extends State<CalcultorPage> {
  List no = [
    ['C', '+/-', '%', '/'],
    ['7', '8', '9', 'x'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', 'x'],
    ['0', '.', '<x|', '='],
  ];

  bool _value = false;
  bool darkMod = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkMod ? kNightPrimaryColor : kDayPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: modSwitch(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '2122',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.notoSans(
                      color: darkMod ? kNightTextColor : kDaySeconderyColor,
                      fontSize: 50),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '10x5+2020',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.notoSans(
                      color: kNightSeconderyColor, fontSize: 20),
                ),
              ),
              Container(
                height: 425,
                child: Numric(),
              ),
            ],
          ),
        ));
  }

  Widget myButton({text, color, icon, font = 23.0}) {
    color = color == null
        ? darkMod
            ? kNightTextColor
            : kDayTextColor
        : color;
    return NeumorphicButton(
      onPressed: () {},
      child: Container(
        width: 35,
        height: 45,
        child: Center(
            child: icon == null
                ? Text(
                    text.toString(),
                    style: GoogleFonts.notoSans(fontSize: font, color: color),
                  )
                : Icon(
                    icon,
                    color: color,
                  )),
      ),
      style: NeumorphicStyle(
        intensity: 1,
        shadowDarkColor:
            (darkMod ? Colors.black : kDaySeconderyColor).withOpacity(0.35),
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
        color: darkMod ? kNightPrimaryColor : kDayPrimaryColor,
        shadowLightColor: Colors.white.withOpacity(0.2),
        depth: 5,
      ),
    );
  }

  Numric() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            myButton(
                text: 'c',
                color: darkMod ? kNightSeconderyColor : kDaySeconderyColor),
            myButton(
                text: '+/-',
                color: darkMod ? kNightSeconderyColor : kDaySeconderyColor),
            myButton(
                text: '%',
                color: darkMod ? kNightSeconderyColor : kDaySeconderyColor),
            myButton(
                text: '/',
                color: darkMod ? kNightSeconderyColor : kDaySeconderyColor),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            myButton(text: '7'),
            myButton(text: '8'),
            myButton(text: '9'),
            myButton(
                text: '+',
                color: darkMod ? kNightSeconderyColor : kDaySeconderyColor),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            myButton(text: '4'),
            myButton(text: '5'),
            myButton(text: '6'),
            myButton(
                text: '-',
                color: darkMod ? kNightSeconderyColor : kDaySeconderyColor,
                font: 30.0),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            myButton(text: '1'),
            myButton(text: '2'),
            myButton(text: '3'),
            myButton(
                text: 'x',
                color: darkMod ? kNightSeconderyColor : kDaySeconderyColor),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            myButton(text: '0'),
            myButton(text: '.'),
            myButton(
                color: darkMod ? kNightSeconderyColor : kDaySeconderyColor,
                icon: Icons.backspace_outlined),
            myButton(
                text: '=',
                color: darkMod ? kNightSeconderyColor : kDaySeconderyColor),
          ],
        ),
      ],
    );
  }

  modSwitch() {
    return NeumorphicSwitch(
      value: _value,
      style: NeumorphicSwitchStyle(
          thumbShape: NeumorphicShape.flat,
          activeTrackColor: kNightPrimaryColor,
          inactiveTrackColor: kDayPrimaryColor,
          activeThumbColor: kDayPrimaryColor,
          inactiveThumbColor: kNightPrimaryColor),
      onChanged: (active) {
        setState(() {
          _value = !_value;
          darkMod = _value;
        });
      },
    );
  }
}
