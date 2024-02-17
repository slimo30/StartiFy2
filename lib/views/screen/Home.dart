import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startify/globale.dart';
import 'package:startify/views/component/MyBottomNavigationBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int currentIndexRow = 0;

  static const List<Map<String, dynamic>> items = [
    {'label': 'Startups', 'imagePath': 'assets/images/man.png'},
    {'label': 'Opportunities', 'imagePath': 'assets/images/gift.png'},
    {'label': 'Jobs', 'imagePath': 'assets/images/jobs.png'},
    {'label': 'Montoes', 'imagePath': 'assets/images/man.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Good Morning',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppColor.bleu,
                            ),
                          ),
                        ),
                        Text(
                          'Good Morning',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColor.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/notif.png",
                      width: 100,
                      height: 100,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(items.length, (index) {
                    return buildSelectableContainer(index);
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      'All',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: AppColor.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: Column(
                        children: [
                          Image.asset('assets/images/yassir.png'),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Yassir',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.bleu),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        color: AppColor.grey,
                                      ),
                                      Text(
                                        '8/15',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '   Algers',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.black),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
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

  Widget buildSelectableContainer(int index) {
    bool selected = currentIndexRow == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndexRow = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selected ? Colors.lightBlue : Colors.transparent,
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                items[index]['imagePath'],
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 4),
              Text(
                items[index]['label'],
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
