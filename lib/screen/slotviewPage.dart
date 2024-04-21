import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/carWidget.dart';
import '../widget/counterWidget.dart';

class slotViewPage extends StatefulWidget {
  const slotViewPage({super.key});

  @override
  State<slotViewPage> createState() => _slotViewPageState();
}

class _slotViewPageState extends State<slotViewPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(left: BorderSide(width: 1, color: Colors.black.withOpacity(0.5)))
                ),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                          border: Border(top: BorderSide(width: 1, color: Colors.black.withOpacity(0.5)),right: BorderSide(width: 1,color: Colors.black.withOpacity(0.5)), bottom: BorderSide(width: 0.5,color: Colors.black.withOpacity(0.5)), left: BorderSide(width: 0,color: Colors.black.withOpacity(0.5)))
                      ),
                    ),
                    carWidget(spotNumber: 1, position: "left"),
                    carWidget(spotNumber: 2, position: "left"),
                    carWidget(spotNumber: 3, position: "left",),
                    carWidget(spotNumber: 4, position: "left",),
                    carWidget(spotNumber: 5, position: "left",),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
                          border: Border(top: BorderSide(width: 0.5, color: Colors.black.withOpacity(0.5)),right: BorderSide(width: 1, color: Colors.black.withOpacity(0.5)), bottom: BorderSide(width: 1, color: Colors.black.withOpacity(0.5)), left: BorderSide(width: 0 , color: Colors.black.withOpacity(0.5)))
                      ),
                    ),
                  ],
                ),
              ),
            ),
            flex: 3,
          ),
          Expanded(
            child: Container(
              child: Opacity(
                opacity: 0.5,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: counterWidget(floor: "lantai 1"),
                      flex: 3,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "lib/images/carIcon.png",
                              scale: 30,
                            ),
                            Icon(Icons.arrow_drop_down_sharp),
                            Text(
                              "ENTRY",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green
                              ),
                            )
                          ],
                        ),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(right: BorderSide(width: 1, color: Colors.black.withOpacity(0.5)))
                ),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                          border: Border(top: BorderSide(width: 1, color: Colors.black.withOpacity(0.5)),right: BorderSide(width: 0,color: Colors.black.withOpacity(0.5)), bottom: BorderSide(width: 0.5,color: Colors.black.withOpacity(0.5)), left: BorderSide(width: 1,color: Colors.black.withOpacity(0.5)))
                      ),
                    ),
                    carWidget(spotNumber: 6, position: "right"),
                    carWidget(spotNumber: 7, position: "right"),
                    carWidget(spotNumber: 8, position: "right",),
                    carWidget(spotNumber: 9, position: "right",),
                    carWidget(spotNumber: 10, position: "right",),
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                          border: Border(top: BorderSide(width: 0.5, color: Colors.black.withOpacity(0.5)),right: BorderSide(width: 0, color: Colors.black.withOpacity(0.5)), bottom: BorderSide(width: 1, color: Colors.black.withOpacity(0.5)), left: BorderSide(width: 1 , color: Colors.black.withOpacity(0.5)))
                      ),
                    ),
                  ],
                ),
              ),
            ),
            flex: 3,
          )
        ],
      ),
    );
  }
}
