import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:startify/globale.dart';

import 'package:startify/views/component/Button.dart';
import 'package:startify/views/component/MyBottomNavigationBar.dart';
import 'package:startify/views/screen/scrrenTow.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int currentIndex = 2;
  ImagePicker _imagePicker = ImagePicker();
  File? _profileImage;

  Future<void> _pickProfileImage() async {
    XFile? pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add a startup',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: AppColor.bleu,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Please enter the information',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackgrey,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'All the fields are required*',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColor.bleu,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Stack(
                    children: [
                      ClipOval(
                        child: _profileImage != null
                            ? Image.file(
                                _profileImage!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/profile.jpg',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickProfileImage,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.blackgrey,
                              border: Border.all(
                                width: 2,
                                color: AppColor.white,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                Icons.add,
                                color: AppColor.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: AppColor.grey,
                    ),
                  ),
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Start-up name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: AppColor.grey,
                    ),
                  ),
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Startup description',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: AppColor.grey,
                    ),
                  ),
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Startup budget',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'DA',
                        style: TextStyle(color: AppColor.grey, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: AppColor.grey,
                    ),
                  ),
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Startup description',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: AppColor.grey,
                    ),
                  ),
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Founder',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: AppColor.grey,
                    ),
                  ),
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'number of team members',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenTwo()));
                      },
                      buttonText: "Next",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;

              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushReplacementNamed(context, '/news');
                  break;
                case 3:
                  Navigator.pushReplacementNamed(context, '/help');
                  break;
                case 4:
                  Navigator.pushReplacementNamed(context, '/profile');
                  break;
                default:
                  break;
              }
            });
          },
          selectedItemColor: AppColor.bleu,
          items: [
            buildBottomNavigationBarItem(
              'assets/icons/home.svg',
              'Home',
              currentIndex == 0 ? AppColor.bleu : AppColor.grey,
            ),
            buildBottomNavigationBarItem(
              'assets/icons/news.svg',
              'News',
              currentIndex == 1 ? AppColor.bleu : AppColor.grey,
            ),
            buildBottomNavigationBarItem(
              'assets/icons/add.svg',
              'Add',
              currentIndex == 2 ? AppColor.bleu : AppColor.grey,
            ),
            buildBottomNavigationBarItem(
              'assets/icons/help.svg',
              'Help',
              currentIndex == 3 ? AppColor.bleu : AppColor.grey,
            ),
            buildBottomNavigationBarItem(
              'assets/icons/profile.svg',
              'Profile',
              currentIndex == 4 ? AppColor.bleu : AppColor.grey,
            ),
          ],
        ),
      ),
    );
  }
}
