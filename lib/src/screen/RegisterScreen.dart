import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterScreen(),
  ));
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _profileImage;
  String? _selectedGender;
  String? _selectedShirtSize;
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Fungsi untuk mengambil gambar profil dari galeri atau kamera
  Future<void> _pickProfileImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pilih Sumber Gambar"),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                final XFile? image =
                    await _imagePicker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  setState(() {
                    _profileImage = image;
                  });
                }
              },
              child: Text("Kamera"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                final XFile? image =
                    await _imagePicker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    _profileImage = image;
                  });
                }
              },
              child: Text("Galeri"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi'),
        elevation: 0,
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "lib/src/images/image/emptybackground.jpeg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildProfileImage(),
                  SizedBox(height: 20),
                  _buildTextFieldWithIcon(
                      "Nama Lengkap", Icons.person, namaController, false),
                  SizedBox(height: 20),
                  _buildTextFieldWithIcon(
                      "Email", Icons.email, emailController, false),
                  SizedBox(height: 10),
                  _buildTextFieldWithIcon(
                      "Password", Icons.lock, passwordController, true),
                  SizedBox(height: 20),
                  _buildGenderDropdown(),
                  SizedBox(height: 10),
                  _buildShirtSizeDropdown(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle registration button press here
                      // Anda dapat mengakses email dan password menggunakan emailController.text dan passwordController.text
                    },
                    child: Text("Registrasi"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan gambar profil
  // Widget untuk menampilkan gambar profil
  Widget _buildProfileImage() {
    return GestureDetector(
      onTap: _pickProfileImage,
      child: Container(
        width: 500.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.white54, // Atur warna background disini
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10), // Atur radius disini
        ),
        child: Column(
          children: <Widget>[
            _profileImage == null
                ? Center(
                    child: Icon(Icons.photo_camera_back_rounded,
                        size: 40, color: Colors.black))
                : Image.file(
                    File(_profileImage!.path),
                    width: 500.0,
                    height: 500.0,
                    fit: BoxFit.cover,
                  ),
            Text(
              'Pilih Gambar',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk input teks dengan ikon
  Widget _buildTextFieldWithIcon(String labelText, IconData icon,
      TextEditingController controller, bool password) {
    return Container(
      width: 355,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: labelText,
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                ),
                isDense: true,
                alignLabelWithHint: true,
              ),
              obscureText: password,
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk pemilihan jenis kelamin
  Widget _buildGenderDropdown() {
    return Container(
      width: 355,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: DropdownButton<String>(
        hint: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(9.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(Icons.male_rounded, color: Colors.white),
            ),
            SizedBox(
              height: 20,
              width: 15,
            ),
            Text(
              'Pilih Gender',
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
        value: _selectedGender,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        underline: Container(
          height: 20,
          color: Colors.transparent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            _selectedGender = newValue;
          });
        },
        items: <String>[
          'Laki-Laki',
          'Perempuan',
          'Lainnya',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  // Widget untuk pemilihan ukuran baju
  Widget _buildShirtSizeDropdown() {
    return Container(
      width: 355,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: DropdownButton<String>(
        hint: Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(Icons.sailing_outlined, color: Colors.white),
            ),
            SizedBox(width: 8),
            Text(
              'Ukuran Baju',
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
        value: _selectedShirtSize,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            _selectedShirtSize = newValue;
          });
        },
        items: <String>[
          'S',
          'M',
          'L',
          'XL',
          'XXL',
          'XXXL',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
