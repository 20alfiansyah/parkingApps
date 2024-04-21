import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkingapps/screen/profilePage.dart';
import 'package:parkingapps/screen/slotPage.dart';
import 'package:dart_nats/dart_nats.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  List<Widget> tabItems = [
    SlotPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: FlashyTabBar(
            animationCurve: Curves.linear,
            selectedIndex: _selectedIndex,
            iconSize: 30,
            showElevation: false, // use this to remove appBar's elevation
            onItemSelected: (index) => setState(() {
              _selectedIndex = index;
            }),
            items: [
              FlashyTabBarItem(
                icon: Icon(Icons.home_outlined),
                title: Text(
                    'Home',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    ),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.person_2_outlined),
                title: Text(
                    'Profile',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ],
          ),
          appBar: _appBar(),
          body: Container(
            child: tabItems[_selectedIndex],
          ),
      ),
    );
  }

  //WIDGET
  PreferredSize _appBar(){
    if (_selectedIndex == 1) {
      // If the selected index is 1 (ProfilePage), return an empty app bar
      return PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(12, 53, 106, 1)
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ProfileBar()
              ],
            ),
          ),
        ),
      );
    } else {
      // If the selected index is not 1, return the regular app bar
      return PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: _decoration(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: _topBar(),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
  Decoration _decoration(){
    return BoxDecoration(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      color: Color.fromRGBO(12, 53, 106, 1),
    );
  }
  Widget _topBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            _signOut();
          },
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Icon(
              Icons.logout,
              color: Colors.white,
              weight: double.infinity,
            ),
          ),
        ),
        Text(
            "ParkirinDong",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white
            ),
        ),
        CircleAvatar(
            backgroundImage: AssetImage("lib/images/profile.png"),
            radius: 15,
            backgroundColor: Colors.white,
        )
      ],
    );
  }
  Widget _ProfileBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            "Personal Information",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white
            ),
        ),
      ],
    );
  }

}

