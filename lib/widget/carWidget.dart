  import 'package:firebase_database/firebase_database.dart';
  import 'package:flutter/material.dart';
  
  class carWidget extends StatefulWidget {
    const carWidget({Key? key, required this.spotNumber}) : super(key: key);
    final int spotNumber;
  
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
              ? Transform.rotate(
            angle: 270 * 3.14/180,
            child: Transform.scale(
              scale: 1.3,
              child: Image.asset(
                "lib/images/carIcon.png",
              ),
            )
          )
              : Center(
            child: Text(
                "Spot ${widget.spotNumber}"
            ),
          ),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(width: 1), left: BorderSide(width: 1),bottom: BorderSide(width: 1)),
          ),
        ),
      );
    }
  }
  
