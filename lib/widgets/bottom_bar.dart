
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:github/controller/bottom_bar.controller.dart';
import 'package:github/helpers/colors.dart';
import 'package:github/views/historypage/history_page.dart';
import 'package:github/views/home_page/home_page.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});
  final List<Widget> bottomBarBarPages = [
     MyHomePage(),
    Hivepage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottombarControlldata = Provider.of<BottomController>(context);
    // Provider.of<Homecontroller>(context, listen: false).fecthDonorDatas();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colorss.black,
        body: bottomBarBarPages[bottombarControlldata.currentIndex],
        bottomNavigationBar: FloatingNavbar(

            // iconSize: 30,
            // itemBorderRadius: 10,
            selectedBackgroundColor:  Colorss.black,
            backgroundColor: Color.fromARGB(255, 27, 27, 27),
            onTap: (int val) {
              bottombarControlldata.changer(val);
            },
            currentIndex: bottombarControlldata.currentIndex,
            elevation: 10,
            selectedItemColor: Colorss.green,
            unselectedItemColor: Colorss.white,
            items: [
              FloatingNavbarItem(icon: Icons.ads_click_rounded, title: 'UseHub'),
              FloatingNavbarItem(
                icon: Icons.history,
                title: 'History',
              ),
            ]),
      ),
    );
  }
}
