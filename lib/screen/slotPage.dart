import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkingapps/screen/slotviewPage.dart';

class SlotPage extends StatefulWidget {
  const SlotPage({super.key});

  @override
  State<SlotPage> createState() => _SlotPageState();
}

class _SlotPageState extends State<SlotPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 10,right: 10, top: 20),
              child: TabBar(
                  unselectedLabelColor: Colors.black.withOpacity(0.3),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromRGBO(255, 196, 54, 1)
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Color.fromRGBO(12, 53, 106, 1), width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "SLOT 1",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Color.fromRGBO(12, 53, 106, 1), width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "SLOT 2",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Color.fromRGBO(12, 53, 106, 1), width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "SLOT 3",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  slotViewPage(),
                  slotViewPage(),
                  slotViewPage(),
                ],
              ),
            )
          ],
        )
    );
  }
}
