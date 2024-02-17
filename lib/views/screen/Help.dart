import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startify/globale.dart';
import 'package:startify/views/component/Button.dart';
import 'package:startify/views/component/MyBottomNavigationBar.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  int currentIndex = 3; // Initialize the index according to your initial state
  List<String> items = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
  ];
  String selectedValue = 'Option 1';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Help',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: AppColor.bleu),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'What is the service you need or the opportunity you share',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: AppColor.grey,
                        ),
                      ),
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: SizedBox(),
                      items: items.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
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
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Help description...',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.grey),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomElevatedButton(onPressed: () {}, buttonText: "Publish")
                ],
              ),
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
                case 2:
                  Navigator.pushReplacementNamed(context, '/add');
                  break;
                case 3:
                  // You are already on the 'Help' screen, so you may not need additional navigation
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
