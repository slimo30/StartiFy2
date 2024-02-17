import 'package:flutter/material.dart';
import 'package:startify/globale.dart';
import 'package:startify/views/component/MyBottomNavigationBar.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int currentIndex = 1; // Initialize the index within the state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // The current index is already 1, so you may not need to navigate to '/home' again
                break;
              case 2:
                Navigator.pushReplacementNamed(context, '/add');
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
    );
  }
}
