import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUp({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _npmController = TextEditingController();
  final TextEditingController _nohpController = TextEditingController();
  final TextEditingController _uidController = TextEditingController();
  final TextEditingController _vehicleController = TextEditingController();

  final databaseReference = FirebaseDatabase.instance.ref();
  String dataUID = "";
  @override
  void initState() {
    super.initState();
    listenToDataChanges();
  }

  void dispose(){
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
    _npmController.dispose();
    _uidController.dispose();
    _vehicleController.dispose();
    super.dispose();
  }

  Future signUp() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
    );
    addUserDetails(
        _nameController.text.trim(),
        _npmController.text.trim(),
        _nohpController.text.trim(),
        _emailController.text.trim(),
        _uidController.text.trim(),
        _vehicleController.text.trim()
    );
  }
  Future addUserDetails(String name, String npm, String phone, String email, String uid, String vehiclePlate) async{
    var firebaseUser = await FirebaseAuth.instance.currentUser!;
    Map<String, dynamic> userDetails = {
      'name': name,
      'npm': npm,
      'phone': phone,
      'email': email,
      'uid':uid,
      'vehiclePlate': vehiclePlate
    };
    await FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set(userDetails);
  }

  void listenToDataChanges() {
    databaseReference.child('dataUID').onValue.listen((event) {
      if (event.snapshot.exists) {
        dynamic value = event.snapshot.value;
        if (value is String) {
          setState(() {
            dataUID = value;
            _uidController.text = dataUID;
          });
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(
                  child: Image.asset(
                    "lib/images/signUp.png"
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                              fontSize: 30
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Let's Sign Up",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5)
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.alternate_email),
                                  hintText: "Your Email",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _passController,
                              obscureText: true,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  hintText: "Your Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _nameController,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "Your Full Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _npmController,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.numbers),
                                  hintText: "Your NPM",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _nohpController,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  hintText: "Your Phone Number",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: _vehicleController,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.drive_eta),
                                  hintText: "Your Vehicle Plate",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              enabled: false,
                              controller: _uidController,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.credit_card),
                                  hintText: "Your UID",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async{
                          signUp().whenComplete(() => Get.snackbar(
                              "Success", "Your account has been created.",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green.withOpacity(0.1),
                              colorText: Colors.green
                          )
                          ).catchError((error, stackTrace){
                            Get.snackbar(
                                "Error", "Something went wrong. Try again",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.redAccent.withOpacity(0.1),
                                colorText: Colors.red
                            );
                          });
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(12, 53, 106, 1)),
                            minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Have an account? ",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.5)
                              ),
                            ),
                            InkWell(
                              onTap: widget.showLoginPage,
                              child: Text(
                                "Log In",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Color.fromRGBO(12, 53, 106, 1)
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
