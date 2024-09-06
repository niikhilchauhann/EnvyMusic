import 'package:envymusic/screens/mainscreens/library.dart';
import 'package:envymusic/screens/drawerscreens/about.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../screens/mainscreens/explore.dart';
import '../screens/mainscreens/home.dart';

class AppStructure extends StatefulWidget {
  @override
  State<AppStructure> createState() => _AppStructureState();
}

class _AppStructureState extends State<AppStructure> {
  final List<Widget> _screens = [
    Home(),
    Explore(),
    Library(),
    About(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 45, 45, 45),
            Colors.black,
          ],
          stops: [
            0.1,
            0.6,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: IndexedStack(index: selectedIndex, children: _screens),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          color: Colors.black,
          child: GNav(
            style: GnavStyle.google,
            tabBackgroundColor: Color.fromARGB(255, 85, 85, 85),
            activeColor: Colors.white,
            color: Colors.white,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            gap: 10,
            tabs: const [
              GButton(
                icon: Icons.home_rounded,
                text: "Home",
                textStyle: TextStyle(fontFamily: 'Jost', color: Colors.white),
              ),
              GButton(
                icon: Icons.explore_rounded,
                text: "Explore",
                textStyle: TextStyle(fontFamily: 'Jost', color: Colors.white),
              ),
              GButton(
                icon: Icons.library_music_rounded,
                text: "Library",
                textStyle: TextStyle(fontFamily: 'Jost', color: Colors.white),
              ),
              GButton(
                icon: Icons.more_horiz_rounded,
                text: "More",
                textStyle: TextStyle(fontFamily: 'Jost', color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
