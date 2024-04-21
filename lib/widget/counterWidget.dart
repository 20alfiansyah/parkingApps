import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class counterWidget extends StatefulWidget {
  const counterWidget({Key? key, required this.floor}) : super(key: key);
  final String floor;

  @override
  State<counterWidget> createState() => _counterWidgetState();
}

class _counterWidgetState extends State<counterWidget> {
  final databaseReference = FirebaseDatabase.instance.ref();
  List<int>carCounter = [];

  @override
  void initState() {
    super.initState();
    if (widget.floor == "lantai 1"){
      for (int i = 0; i <=10  ; i++){
        databaseReference.child('dataSensor$i').onValue.listen((event) {
          dynamic value = event.snapshot.value;
          setState(() {
            if(value == 0){
              carCounter.add(0);
            }else if(value == 1){
              carCounter.removeLast();
            }
          });
        }
        );
      }
    }
    if (widget.floor == "lantai 2"){
      for (int i = 10; i <=20  ; i++){
        databaseReference.child('dataSensor$i').onValue.listen((event) {
          dynamic value = event.snapshot.value;
          setState(() {
            if(value == 0){
              carCounter.add(0);
            }else if(value == 1){
              carCounter.removeLast();
            }
          });
        }
        );
      }
    }
    if (widget.floor == "lantai 3"){
      for (int i = 20; i <=30  ; i++){
        databaseReference.child('dataSensor$i').onValue.listen((event) {
          dynamic value = event.snapshot.value;
          setState(() {
            if(value == 0){
              carCounter.add(0);
            }else if(value == 1){
              carCounter.removeLast();
            }
          });
        }
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Center(
        child: Text(
          "${carCounter.length} SLOTS AVAILABLE",
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
