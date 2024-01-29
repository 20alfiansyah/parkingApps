import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
  
  class carWidget extends StatefulWidget {
    const carWidget({Key? key, required this.spotNumber, required this.position}) : super(key: key);
    final int spotNumber;
    final String position;
  
    @override
    State<carWidget> createState() => _carWidgetState();
  }
  
  class _carWidgetState extends State<carWidget> {
    final databaseReference = FirebaseDatabase.instance.ref();
    int dataValue = 0;
  
    @override
    void initState() {
      super.initState();
      listenToDataChanges();
    }
  
    void listenToDataChanges() {
      databaseReference.child('dataSensor${widget.spotNumber}').onValue.listen((event) {
        if (event.snapshot.exists) {
          dynamic value = event.snapshot.value;
          if (value is int) {
            setState(() {
              dataValue = value;
            });
          }
        }
      });
    }
    @override
    Widget build(BuildContext context) {
      return  Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: dataValue == 1
              ? widget.position == "left"
                ? Transform.rotate(
                  angle: 90 * 3.14/180,
                  child: Transform.scale(
                    scale: 1,
                    child: Image.asset(
                      "lib/images/carIcon.png",
                    ),
                  )
                )
                : Transform.rotate(
                  angle: 270 * 3.14/180,
                  child: Transform.scale(
                    scale: 1,
                    child: Image.asset(
                      "lib/images/carIcon.png",
                    ),
                  )
                )
              : Center(
                child: Text(
                  "SPOT ${widget.spotNumber}",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                  ),
                ),
          ),
          decoration: BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide(width: 0.5, color: Colors.black.withOpacity(0.5))),
          ),
        ),
        flex: 2,
      );
    }
  }
  
