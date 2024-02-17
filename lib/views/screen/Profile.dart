import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startify/globale.dart';
import 'package:startify/views/component/MyBottomNavigationBar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bleu,
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: AppColor.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          color: AppColor.white,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.64,
                        child: Padding(
                          padding: const EdgeInsets.all(40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 150,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'profile settings',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/arrow-circle-right.svg',
                                      width: 24,
                                      height: 24,
                                      color: AppColor.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'my start ups',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/arrow-circle-right.svg',
                                      width: 24,
                                      height: 24,
                                      color: AppColor.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'help requests history',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/arrow-circle-right.svg',
                                      width: 24,
                                      height: 24,
                                      color: AppColor.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'log out',
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.red),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                const ClipOval(
                                  child: Image(
                                    image:
                                        AssetImage('assets/images/profile.jpg'),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Escoders',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Text(
                                  'start up owner',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
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
                  Navigator.pushReplacementNamed(context, '/help');
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
