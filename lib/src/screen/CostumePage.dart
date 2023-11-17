import 'package:flutter/material.dart';
import 'package:panther_mania_mobile/src/screen/RegisterScreen.dart';
import 'package:panther_mania_mobile/src/screen/loginscreen.dart';

class CostumePage extends StatelessWidget {
  const CostumePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/src/images/image/defaultbackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "lib/src/images/image/panther-mania-car.png",
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk tombol "Scan ID"
                },
                child: Text(
                  "Scan ID",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 42, 66, 85),
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      width: 2,
                      color: Colors.white,
                    ),
                  ),
                  fixedSize: Size.fromHeight(60),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                  // Aksi untuk tombol "Masuk"
                },
                child: Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 42, 66, 85),
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      width: 2, // Menambahkan lebar border (misalnya 5)
                      color: Colors.white,
                    ),
                  ),
                  fixedSize: Size.fromHeight(60),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterScreen()));
                  // Tindakan yang akan dilakukan ketika tombol ditekan// Aksi untuk tombol "Daftar"
                },
                child: Text(
                  "Daftar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 42, 66, 85),
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 85),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      width: 2, // Menambahkan lebar border (misalnya 4)
                      color: Colors.white,
                    ),
                  ),
                  fixedSize: Size.fromHeight(60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
