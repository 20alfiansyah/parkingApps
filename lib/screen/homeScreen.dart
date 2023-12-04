import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkingapps/widget/carWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('hai'),
          ),
          body: Container(
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "Spot 1",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),Tab(
                      child: Text(
                        "Spot 1",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),Tab(
                      child: Text(
                        "Spot 1",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 60),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(top: BorderSide(width: 1), left: BorderSide(width: 1),bottom: BorderSide(width: 1))
                                      ),
                                      child: Column(
                                        children: [
                                          carWidget(spotNumber: 1),
                                          carWidget(spotNumber: 2),
                                          carWidget(spotNumber: 3),
                                          carWidget(spotNumber: 4),
                                          carWidget(spotNumber: 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              flex: 4,
                            ),
                            Expanded(
                              child: Container(
                                  color: Colors.yellow,
                                ),
                              flex: 3,
                            ),
                            Expanded(
                              child: Container(
                                  color: Colors.green,
                                ),
                              flex: 4,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
        )
    );
  }
}

